import QtQuick 2.0
import QtQuick.Controls 2.5
import "../../controls/custom"
import "../../controls/buttons"
import "../../controls"
import "../../javascript/settings.js" as Settings
import "../../javascript/startup.js" as Startup

Rectangle {
    id: calibrateScreen
    width: 637 /** scaleFactor*/
    height: 258 /** scaleFactor*/
    visible: true
    color: "#5ac1d0"
    radius: 5


    CustomComboBox {
        id: scaleComboBox
        width: 240 * scaleFactor
        height: 23 * scaleFactor
        anchors.verticalCenter: parent.verticalCenter
        model: ["50%", "60%", "70%", "80%", "90%", "100% (Recommended for Windows)", "110%", "120%", "130%", "140% (Recommended for Linux)", "150%"]
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 9 * scaleFactor
        currentIndex: Settings.scaleFactorDictFunction()
        onCurrentIndexChanged: settings.scaleFactor = Settings.updateScaleFactor(scaleComboBox.currentIndex)
        comboBoxTheme: settings.buttonColorDefault
        comboBoxThemeClicked: settings.backgroundColor
    }

    Label {
        id: label
        y: 69
        color: "#ffffff"
        text: qsTr("Adjust Scale to fit Screen Size")
        anchors.horizontalCenterOffset: 1
        font.family: "PragmaticaLightC"
        font.pointSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
    }

    CustomButton {
        id: nextBtn
        y: 180
        width: 58
        height: 22
        text: "Next"
        anchors.horizontalCenter: parent.horizontalCenter
        colorDefault: settings.buttonColorDefault
        colorMouseOver: settings.backgroundColor
        colorPressed: settings.buttonColorPressed
        fontColorMouseOver: settings.buttonColorDefault
        onClicked: Startup.tooltips()
    }

    Triangle {
            id: triangle
            x: 8
            y: 8
            width: 20
            height: 20
            z: 0
            rotation: 0
            fillStyle: "#5ac1d0"
            strokeStyle: "#5ac1d0"
            clip: false
            fill: true
        }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}D{i:2}
}
##^##*/
