import QtQuick 2.0
import QtQuick.Controls 6.2
import "../../controls/buttons"

Item {
    id: bottomColumn
    //    width: 789
    //    height: 248

    property string selectedContextFile : ""
    property bool saveAsPdf : false
    property string previousFile : ""
    property bool usePrevFile : false

    signal sendBottomColumnInfo(string file, bool pdf, bool usePrevFile)

    FontLoader {
        id: fixedFont
        source: "../fonts/Segoe UI.ttf"
    }

    Rectangle {
        id: graphSettings
        color: "#5ac1d0"
        radius: 10
        height: 248
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        clip: true

        PropertyAnimation {
            id: graphSettingsCollapseAnimation
            target: graphSettings
            property: "height"
            easing.type: Easing.InOutQuint
            duration: 500
            to: if(graphSettings.height === 248) return 29; else return 248
        }

        Rectangle {
            id: bgBorder2
            color: "#00000000"
            radius: 10
            border.color: "#5ac1d0"
            border.width: 1
            anchors.fill: parent

            CustomButton {
                id: addToQueueButton
                x: 607
                width: 89
                height: 24
                text: qsTr("Add to Queue")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 216
                anchors.rightMargin: 91
                font.pointSize: 10
                onClicked: mutationspectra.add_count_contexts_queue([selectedContextFile, saveAsPdf, usePrevFile])
            }
        }



        CustomRunButton {
            id: runBtn2
            width: 260
            height: 43
            text: "Plot Example Graph"
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 20
            font.family: fixedFont.font.family
            font.weight: Font.DemiBold
            anchors.verticalCenterOffset: 58
            anchors.horizontalCenterOffset: -1
            onClicked: {
                graphswindow.stop_current_graph()
                graphswindow.display_busy_indicator()
                graphswindow.run_mpld3("sample.SBS96.all", false)
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomButton {
            id: browseBtn1
            y: 46
            width: 84
            height: 40
            text: "Browse"
            anchors.left: parent.left
            anchors.leftMargin: 30
            font.family: fixedFont.font.family
            font.weight: Font.DemiBold
            onClicked: mutationspectra.get_bed_file_name_count_contexts()
        }

        CustomButton {
            id: countContextsButton
            width: 74
            height: 24
            text: "Run"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 216
            anchors.rightMargin: 8
            font.pointSize: 10
            font.weight: Font.DemiBold
            onClicked: {
                graphswindow.stop_current_graph()
                graphswindow.display_busy_indicator()
                if(usePreviousFileButton.checked === true) {
                   graphswindow.run_mpld3(previousFile, saveAsPdf)
                } else {
                    graphswindow.run_mpld3(selectedContextFile, saveAsPdf)
                }
        }

        }

        Label {
            id: filesSelectedLabel
            x: 184
            y: 58
            width: 82
            height: 16
            visible: false
            color: "#1926ba"
            text: qsTr("")
            anchors.left: parent.left
            anchors.leftMargin: 142
        }

        CheckBox {
            id: saveAsPDFcheckbox
            y: 192
            anchors.left: parent.left
            anchors.leftMargin: 35
            onCheckStateChanged: if(saveAsPDFcheckbox.checked) {
                                     saveAsPdf = true
                                 } else {
                                     saveAsPdf = false
                                 }
        }

        Label {
            id: saveAsPdfLabel
            y: 192
            color: "#ffffff"
            text: qsTr("Save as PDF")
            anchors.left: saveAsPDFcheckbox.right
            anchors.leftMargin: 9
        }

        RadioButton {
            id: usePreviousFileButton
            y: 58
            width: 111
            height: 16
            text: qsTr("Use previous file")
            anchors.left: browseBtn1.right
            anchors.leftMargin: 22
            onCheckedChanged: if(usePreviousFileButton.checked === true) {
                                  usePrevFile = true
                              } else {
                                  usePrevFile = false
                              }
        }
    }


    MouseArea {
        id: graphSettingsCollapseMouseArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: terminalUnderline2.top
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        onClicked: {graphSettingsCollapseAnimation.running = true
        }
        anchors.topMargin: 0
        anchors.rightMargin: 0
    }

    Rectangle {
        id: terminalUnderline2
        x: 1
        y: 29
        height: 1
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 1
        z: 0
        anchors.rightMargin: -1
    }


    Label {
        id: graphSettingsLogoText
        x: 328
        y: 0
        color: "#ffffff"
        text: qsTr("COUNT CONTEXTS")
        anchors.bottom: terminalUnderline2.top
        font.letterSpacing: 2
        font.family: fixedFont.font.family
        font.weight: Font.ExtraBold
        z: 2
        anchors.bottomMargin: 5
        anchors.horizontalCenterOffset: 0
        clip: false
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Connections {
        target: mutationspectra
        function onSetContextFileChosen(filepath, filename) {
            selectedContextFile = filepath
            if(selectedContextFile.length > 0) {
                filesSelectedLabel.visible = true
                filesSelectedLabel.text = filename+" selected"
            }
        }

        function onPreviousAddContextFile(file) {
            previousFile = file
        }

        function onGetBottomColumnInfo() {
            if(usePreviousFileButton.checked === true) {
               sendBottomColumnInfo(previousFile, saveAsPdf, true)
            } else {
                sendBottomColumnInfo(selectedContextFile, saveAsPdf, false)
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:246;width:789}
}
##^##*/
