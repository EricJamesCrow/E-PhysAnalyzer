import QtQuick 2.0
import QtQuick.Controls 6.2
import "../../pages"
import "../../controls"
import "../../controls/custom"
import "../../controls/buttons"
import "../../javascript/remove-duplicates.js" as RemDup

Item {
    id: removeDuplicatesMiddleColumn
    // Make sure the object inherit's the parent's height
    //    onHeightChanged: if(columnCollapsed === false && programFinishedLaunching) {
    //                         emptyTopColumn.height = columnHeight2
    //                     } else if(columnCollapsed === true && programFinishedLaunching) {
    //                         emptyTopColumn.height = 29
    //                     }
    //    width: 789
    //    height: 246

//    // properties for editing
//    property int scaleFactor: 1
//    property color topBarColor: "#02323a"
//    property color topBarSecondaryColor: "#015967"
//    property color columnColor: "#5ac1d0"
//    property color backgroundColor: "#b8e3ee"
//    property color backgroundBorderColor: "#e9efec"
//    property color buttonColorDefault: "#087589"
//    property color buttonColorPressed: "#357aac"
//    property color checkBoxHighlighted: "#33aac0"
//    property color terminalUnderlineColor: "#51abb9"
//    property color terminalText: "#2aafd3"

    // Properties for column height + dynamically adjustability
    property var columnHeight2: removeDuplicatesMiddleColumn.height
    property bool columnCollapsed: false
    property var columnBottomAnchor: removeDuplicatesMiddleColumn.bottom
    property bool programFinishedLaunching: false

    // Properties for the column's specific functions
    property bool headersBool: false
    property var fileList: []
    property string outputFileName: ""
    property bool clearTerminalBool: false

    // Properties for filter terminal
    property var currentObj : []
    property int flickableContentHeight : 164
    property real scrollBar: ScrollBar.AsNeeded
    property bool startAdjustingFlickableContentHeight: false
    property bool progressBarRunning: false
    property bool processCancelled : false
    property bool thisWontRun : false

    FontLoader {
        id: fixedFont
        source: "../../fonts/Segoe UI.ttf"
    }

    FontLoader {
        id: pragmaticaFont
        source: "../../fonts/PT Pragmatica Book.ttf"
    }

    Rectangle {
        id: middleColumn
        //        height: columnHeight2
        height: 248 * scaleFactor
        visible: true
        color: columnColor
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10 * scaleFactor
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        clip: true

        PropertyAnimation {
            id: removeDuplicatesMiddleColumnCollapseAnimation
            target: middleColumn
            property: "height"
            easing.type: Easing.InOutQuint
            duration: 325
            to: {if(middleColumn.height !== 29 * scaleFactor) return 29 * scaleFactor; else return 248 * scaleFactor}
        }

        Rectangle {
            id: removeDuplicatesMiddleColumnBgBorder
            color: "#00000000"
            radius: 10
            border.color: columnColor
            border.width: 1
            anchors.fill: parent
            clip: true

            Label {
                id: filesSelectedLabel
                y: 62 * scaleFactor
                width: 82 * scaleFactor
                height: 16 * scaleFactor
                visible: false
                color: "#1926ba"
                text: qsTr("Files selected")
                anchors.left: parent.left
                anchors.leftMargin: 184 * scaleFactor
            }

            CustomCheckBoxLabel {
                id: headersLabel
                x: 148 * scaleFactor
                y: 46 * scaleFactor
                text: "Headers"
                width: 93 * scaleFactor
                height: 26 * scaleFactor
            }

            CustomButton {
                id: removeDuplicatesBtn
                y: 122 * scaleFactor
                width: 130 * scaleFactor
                height: 25 * scaleFactor
                text: "Remove Duplicates"
                anchors.left: parent.left
                font.pointSize: 9 * scaleFactor
                font.family: pragmaticaFont.name
                anchors.leftMargin: 298 * scaleFactor
                onClicked: RemDup.runRemoveDuplicates()
                font.weight: Font.DemiBold
            }

            CustomButton {
                id: megreBtn
                y: 174 * scaleFactor
                width: 109 * scaleFactor
                height: 25 * scaleFactor
                text: "Merge"
                anchors.horizontalCenter: removeDuplicatesBtn.horizontalCenter
                onClicked: RemDup.runMerge()
                font.weight: Font.DemiBold

                CustomTextField {
                    id: mergeFileNameTextField
                    x: 146 * scaleFactor
                    y: 3 * scaleFactor
                    width: 121 * scaleFactor
                    height: 20 * scaleFactor
                    onTextChanged: outputFileName = mergeFileNameTextField.text
                }
            }

            CustomButton {
                id: removeDuplicatesBrowseBtn
                x: 25 * scaleFactor
                y: 46 * scaleFactor
                width: 108 * scaleFactor
                height: 26 * scaleFactor
                text: "File Chooser"
                anchors.left: parent.left
//                anchors.top: parent.top
////                anchors.topMargin: 40 * scaleFactor
                font.weight: Font.DemiBold
                anchors.leftMargin: 25 * scaleFactor
                onClicked: {pptools.get_remove_duplicates_filenames()}
            }
        }

        FilesSelectedTerminalRemDup {
            id: filesSelectedTerminal
            x: 8*scaleFactor
            y: 79*scaleFactor
            width: 255*scaleFactor
            height: 161*scaleFactor
        }


    }


    MouseArea {
        id: removeDuplicatesCollapseMouseArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: removeDuplicatesMiddleColumnUnderline.top
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        onClicked: RemDup.collapseColumn()
        anchors.topMargin: 0
        anchors.leftMargin: 0
    }


    Rectangle {
        id: removeDuplicatesMiddleColumnUnderline
        x: 1
        y: 29 * scaleFactor
        height: 1
        color: backgroundColor
        anchors.left: parent.left
        anchors.right: parent.right
        z: 0
        anchors.rightMargin: -1
        anchors.leftMargin: 1
    }



    Label {
        id: removeDuplicatesMiddleColumnLogoText
        x: 304 * scaleFactor
        y: 8 * scaleFactor
        width: 153 * scaleFactor
        height: 16 * scaleFactor
        color: "#ffffff"
        text: qsTr("REMOVE DUPLICATES")
        anchors.bottom: removeDuplicatesMiddleColumnUnderline.top
        font.letterSpacing: 2 * scaleFactor
        font.pointSize: 9 * scaleFactor
        z: 2
        clip: false
        font.family: fixedFont.font.family
        font.weight: Font.ExtraBold
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 5 * scaleFactor
        anchors.horizontalCenterOffset: 1
    }



    Connections {
        target: pptools
        function onFileListRemoveDuplicates(files) {
            fileList = files
        }

    }





}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:246;width:789}
}
##^##*/
