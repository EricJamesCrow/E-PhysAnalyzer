import QtQuick 2.0
import QtQuick.Controls 2.5
import "../../controls/custom"
import "../../controls/buttons"
import "../../controls"
import "../../javascript/settings.js" as Settings
import "../../javascript/startup.js" as Startup
import "../../javascript/app.js" as App

Rectangle {
    id: toolTip
    width: 150 * scaleFactor
    height: 100 * scaleFactor
    color: toolTipColor
    radius: 5 * scaleFactor
    onOpacityChanged: if(toolTip.opacity === 1.0) return nextBtn.focus = true

    property string textInfo: "Click here to select your files"
    property color toolTipColor: "#5ac1d0"


    Label {
        id: label
        y: 17 * scaleFactor
        width: 135 * scaleFactor
        height: 42 * scaleFactor
        color: "#ffffff"
        text: textInfo
        wrapMode: Text.WordWrap
        anchors.horizontalCenterOffset: 0
        font.family: "PragmaticaLightC"
        font.pointSize: 12 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
    }

    CustomButton {
        id: nextBtn
        y: 65 * scaleFactor
        width: 58 * scaleFactor
        height: 22 * scaleFactor
        text: "Next"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        colorDefault: settings.buttonColorDefault
        colorMouseOver: settings.backgroundColor
        colorPressed: settings.buttonColorPressed
        fontColorMouseOver: settings.buttonColorDefault
        onClicked: Startup.tooltips()
        Keys.onReturnPressed: if(nextBtn.focus === true && nextBtn.visible === true) return Startup.tooltips()
    }

    Triangle {
            id: triangle
            x: 14 * scaleFactor
            y: -9 * scaleFactor
            width: 20 * scaleFactor
            height: 20 * scaleFactor
            z: 0
            rotation: 90
            fillStyle: toolTipColor
            strokeStyle: toolTipColor
            clip: false
            fill: true
        }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}
}
##^##*/
