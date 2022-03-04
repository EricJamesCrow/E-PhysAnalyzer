import QtQuick 2.0
import QtQuick.Controls 6.2
import "controls"
import Qt.labs.settings 1.1

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        FontLoader {
            id: fixedFont
            source: "../fonts/Segoe UI.ttf"
        }


        Settings {
            id: settings
            property bool clearValues : false
            property bool progressBarVisibility : false
            property int progressBarValue : 0
            property string progressBarLabel : ""
        }

        CustomButton {
            id: browseBtn
            width: 84
            height: 40
            text: "Browse"
            font.family: fixedFont.font.family
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.leftMargin: 100
            onClicked: {
                backend.getFilename()
                backend.gettingWindowMargins()
            }
        }

        Label {
            id: label
            y: 50
            width: 187
            height: 42
            color: "#ffffff"
            text: qsTr("Select files for analysis")
            font.family: fixedFont.font.family
            anchors.left: browseBtn.right
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            anchors.leftMargin: 50
        }

        CustomRunButton {
            id: runBtn
            y: 182
            width: 301
            height: 85
            text: "Run"
            font.family: fixedFont.font.family
            anchors.bottom: parent.bottom
            font.pointSize: 32
            anchors.horizontalCenterOffset: 0
            anchors.bottomMargin: 127
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: backend.run()
        }

        ClearValuesButton {
            id: clearValuesButton
            y: 323
            width: 78
            height: 29
            visible: settings.clearValues
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 42
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                settings.clearValues = false
                clearValuesButton.visible = settings.clearValues
                backend.clearFiles()
                backend.scrollBar(1)
                settings.progressBarVisibility = false
                progressBar.visible = settings.progressBarVisibility
                settings.progressBarValue = 0
                progressBar.value = settings.progressBarValue
                settings.progressBarLabel = ""
                progressBarLabel.text = settings.progressBarLabel

            }
        }


    Connections {
        target:backend
        function onSetFilenames(files){
            settings.clearValues = true
            clearValuesButton.visible = settings.clearValues
        }
        function onClearFilesButton(){
            clearValuesButton.visible = false
            settings.clearValues = false
            settings.progressBarVisibility = false
            progressBar.visible = settings.progressBarVisibility
            settings.progressBarValue = 0
            progressBar.value = settings.progressBarValue
            settings.progressBarLabel = ""
            progressBarLabel.text = settings.progressBarLabel
        }
    }

    ProgressBar {
        id: progressBar
        y: 130
        width: 301
        height: 24
        visible: settings.progressBarVisibility
        wheelEnabled: false
        anchors.horizontalCenter: parent.horizontalCenter
        to: 100
        value: settings.progressBarValue

        Label {
            id: progressBarLabel
            x: 93
            y: -2
            text: settings.progressBarLabel
            font.family: fixedFont.font.family
            font.pointSize: 14
            color: "#ffffff"
        }
    }

    Connections {
        target: backend
        function onSetProgressBar(num, string) {
            settings.progressBarLabel = string
            progressBarLabel.text = settings.progressBarLabel
            settings.progressBarValue = num
            progressBar.value = settings.progressBarValue
            settings.progressBarVisibility = true
            progressBar.visible = settings.progressBarVisibility
        }
    }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:394;width:499}D{i:2}D{i:3}D{i:4}D{i:5}D{i:6}D{i:7}D{i:8}
D{i:10}D{i:9}D{i:11}D{i:1}
}
##^##*/
