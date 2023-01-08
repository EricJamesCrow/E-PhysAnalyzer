import QtQuick 2.0
import QtQuick.Controls 2.5
import "../../controls/custom"
import "../../controls/buttons"
import "../../controls"
import "../../javascript/settings.js" as Settings
import "../../javascript/startup.js" as Startup

Rectangle {

    property int scaleFactor: 1

    id: calibrateScreen
    width: 637 /** scaleFactor*/
    height: 258 /** scaleFactor*/
    visible: true
    color: "#5ac1d0"
    radius: 5 * scaleFactor
    onOpacityChanged: if(calibrateScreen.opacity === 1.0) return nextBtn.focus = true


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
        y: 69 * scaleFactor
        color: "#ffffff"
        text: qsTr("Adjust Scale to fit Screen Size")
        anchors.horizontalCenterOffset: 1
        font.family: "PragmaticaLightC"
        font.pointSize: 12 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
    }

    CustomButton {
        id: nextBtn
        y: 180 * scaleFactor
        width: 80 * scaleFactor
        height: 22 * scaleFactor
        text: "Show Tutorial"
        anchors.horizontalCenterOffset: -75 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        colorDefault: settings.buttonColorDefault
        colorMouseOver: settings.backgroundColor
        colorPressed: settings.buttonColorPressed
        fontColorMouseOver: settings.buttonColorDefault
        onClicked: Startup.tooltips()
        Keys.onReturnPressed: if(nextBtn.focus === true && calibrateScreen.visible === true) return Startup.tooltips()

        CustomButton {
            id: nextBtn1
            x: 125 * scaleFactor
            y: 0
            width: 120 * scaleFactor
            height: 22 * scaleFactor
            text: "Start E-PhysAnalyzer"
            anchors.horizontalCenterOffset: 135 * scaleFactor
            anchors.horizontalCenter: parent.horizontalCenter
            colorPressed: settings.buttonColorPressed
            fontColorMouseOver: settings.buttonColorDefault
            colorDefault: settings.buttonColorDefault
            colorMouseOver: settings.backgroundColor
            onClicked: Startup.skipTutorial()
            Keys.onReturnPressed: if(nextBtn1.focus === true && calibrateScreen.visible === true) return Startup.skipTutorial()
            Keys.onTabPressed: nextBtn.focus = true
        }
    }

    Triangle {
        id: triangle
        x: 8 * scaleFactor
        y: 8 * scaleFactor
        width: 20 * scaleFactor
        height: 20 * scaleFactor
        z: 0
        rotation: 0
        fillStyle: "#5ac1d0"
        strokeStyle: "#5ac1d0"
        clip: false
        fill: true
    }
}


