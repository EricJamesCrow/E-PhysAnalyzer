import QtQuick 2.0
import QtQuick.Controls 6.2
import QtQuick.Window 2.2
import "../../pages"
import "../../controls/buttons"

Item {
    id: topColumnMerger
    onHeightChanged: if(columnCollapsed === false && programFinishedLaunching) {
                         merger.height = columnHeight2
                     } else if(columnCollapsed === true && programFinishedLaunching) {
                         merger.height = 29
                     }

    property var selectedMergeVCFfiles : []
    property int currentSelectedModel : 0
    property bool filterPValues : false
    property bool removeDuplicates : false
    property string pValue : "N/A"
    property var columnHeight2: topColumnMerger.height
    property bool columnCollapsed: false
    property var columnBottomAnchor: topColumnMerger.bottom
    property bool programFinishedLaunching: false

    signal sendTopColumnInfo(string file, var selectedMergeVCFfiles, int currentSelectedModel, bool filterPValues, bool removeDuplicates, string pValue)

    function collapseColumn () {
        programFinishedLaunching = true
        if(columnCollapsed === false) {       
            backend.send_collapsing_data("topColumnCollapsed")
            mergerTopCollapseAnimation.running = true
            columnCollapsed = true
        } else {
            mergerTopCollapseAnimation.running = true
            backend.send_collapsing_data("topColumnCollapsed")
            columnCollapsed = false
        }
    }

    FontLoader {
        id: fixedFont
        source: "../fonts/Segoe UI.ttf"
    }

    Rectangle {
        id: merger
        radius: 10
//        height: columnHeight2
        height: 248
        visible: true
        color: "#5ac1d0"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        clip: true


        PropertyAnimation {
            id: mergerTopCollapseAnimation
            target: merger
            property: "height"
            easing.type: Easing.InOutQuint
            duration: 500
            to: {if(merger.height !== 29) return 29; else return columnHeight2}
        }

        Rectangle {
            id: mergerTopBorder
            color: "#00000000"
            radius: 10
            border.color: "#5ac1d0"
            border.width: 1
            anchors.fill: parent
            clip: true

            CheckBox {
                id: removeDuplicatesCheckBox
                y: 137
                anchors.left: parent.left
                anchors.leftMargin: 36
                onCheckStateChanged: if(removeDuplicatesCheckBox.checked === true) {
                                         removeDuplicates = true
                                     } else {
                                         removeDuplicates = false
                                     }
            }

            Label {
                id: removeDuplicatesLabel
                y: 137
                color: "#ffffff"
                text: qsTr("Remove Duplicates")
                anchors.left: removeDuplicatesCheckBox.right
                anchors.leftMargin: 6
            }

            Label {
                id: filesSelectedLabel
                y: 62
                width: 82
                height: 16
                visible: false
                color: "#1926ba"
                text: qsTr("Files selected")
                anchors.left: parent.left
                anchors.leftMargin: 184
            }

            ComboBox {
                id: headersComboBox
                y: 137
                width: 209
                height: 20
                anchors.left: parent.left
                anchors.leftMargin: 315
                model: []
                onCurrentIndexChanged: {currentSelectedModel = headersComboBox.currentIndex}
            }

            CheckBox {
                id: filterPValuesCheckBox
                y: 137
                anchors.left: parent.left
                anchors.leftMargin: 191
                onCheckStateChanged: if(filterPValuesCheckBox.checked) {
                                         filterPValues = true
                                     } else {
                                         filterPValues = false
                                     }
            }

            Label {
                id: filterPvaluesLabel
                y: 137
                color: "#ffffff"
                text: qsTr("Filter P-Values")
                anchors.left: filterPValuesCheckBox.right
                anchors.leftMargin: 5
            }

            TextField {
                id: pValueTextField
                y: 168
                text: ""
                anchors.left: parent.left
                anchors.leftMargin: 192
                placeholderText: qsTr("N/A")
                onTextChanged: pValue = pValueTextField.text
                selectByMouse: true
            }

            CustomButton {
                id: addToQueueButton
                x: 608
                width: 89
                height: 24
                text: qsTr("Add to Queue")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 91
                font.pointSize: 10
                anchors.topMargin: 216
                onClicked: mutationspectra.add_merge_queue([selectedMergeVCFfiles, snvFilename.text, currentSelectedModel,
                                                    filterPValues, removeDuplicates, pValue])
            }
        }

        CustomButton {
            id: browseBtn
            width: 108
            height: 40
            text: "Browse to Select"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 41
            anchors.topMargin: 52
            font.family: fixedFont.font.family
            font.weight: Font.DemiBold
            onClicked: {
                mutationspectra.getFilename()
                snvFilename.visible = true
                snvFilenameLabel.visible = true
            }
        }

        TextField {
            id: snvFilename
            width: 130
            height: 16
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 194
            anchors.topMargin: 105
            clip: false
            font.bold: true
            z: 0
            placeholderText: qsTr("Filename")
            selectByMouse: true
        }

        Label {
            id: snvFilenameLabel
            width: 177
            height: 16
            visible: true
            color: "#ffffff"
            text: qsTr("Merged VCF Filename:")
            anchors.left: parent.left
            anchors.top: parent.top
            font.letterSpacing: 2
            anchors.leftMargin: 19
            anchors.topMargin: 105
            font.weight: Font.Bold
        }

        CustomRunButton {
            id: runBtn
            x: 707
            width: 74
            height: 24
            text: "Run"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 8
            anchors.topMargin: 216
            font.weight: Font.DemiBold
            onClicked: {
                mutationspectra.run_merge_VCF(selectedMergeVCFfiles, snvFilename.text, removeDuplicates, pValue, currentSelectedModel, filterPValues)
            }
            font.pointSize: 10
            font.family: fixedFont.font.family
        }
    }

    MouseArea {
        id: mergerTopCollapseMouseArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: mergerTopUnderline.top
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        onClicked: {collapseColumn()
        }
        anchors.topMargin: 0
        anchors.leftMargin: 0
    }

    Rectangle {
        id: mergerTopUnderline
        x: 1
        y: 29
        height: 1
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        z: 0
        anchors.rightMargin: -1
        anchors.leftMargin: 1
    }


    Label {
        id: mergerTopLogoText
        y: 8
        width: 56
        height: 16
        color: "#ffffff"
        text: qsTr("MERGER")
        anchors.bottom: mergerTopUnderline.top
        font.letterSpacing: 2
        anchors.horizontalCenter: parent.horizontalCenter
        z: 2
        anchors.bottomMargin: 5
        font.weight: Font.ExtraBold
        clip: false
    }

    Connections {
        target: mutationspectra
        function onSetMergeFileChosen(filepaths) {
            selectedMergeVCFfiles = filepaths
            if(selectedMergeVCFfiles.length > 0) {
             filesSelectedLabel.visible = true
            }
        }

        function onGetHeaders(headers) {
            headersComboBox.model = headers
        }

        function onGetTopColumnInfo() {
            sendTopColumnInfo(snvFilename.text, selectedMergeVCFfiles, currentSelectedModel, filterPValues, removeDuplicates, pValue)
        }


    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66;height:246;width:789}
}
##^##*/
