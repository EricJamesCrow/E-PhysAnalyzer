import QtQuick 2.0
import QtQuick.Controls 2.5
import "../../controls/custom"
import "../../controls/buttons"
import "../../controls"
import "../../javascript/settings.js" as Settings
import "../../javascript/startup.js" as Startup

Rectangle {
    id: toolTip
    width: 150 /** scaleFactor*/
    height: 100 /** scaleFactor*/
    color: "#5ac1d0"
    radius: 5

    property string textInfo: "Click here to select your files"


    Label {
        id: label
        y: 17
        width: 135
        height: 42
        color: "#ffffff"
        text: textInfo
        wrapMode: Text.WordWrap
        anchors.horizontalCenterOffset: 0
        font.family: "PragmaticaLightC"
        font.pointSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
    }

    CustomButton {
        id: nextBtn
        y: 65
        width: 58
        height: 22
        text: "Next"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        colorDefault: settings.buttonColorDefault
        colorMouseOver: settings.backgroundColor
        colorPressed: settings.buttonColorPressed
        fontColorMouseOver: settings.buttonColorDefault
        onClicked: Startup.tooltips()
    }

    Triangle {
            id: triangle
            x: 14
            y: -9
            width: 20
            height: 20
            z: 0
            rotation: 90
            fillStyle: "#5ac1d0"
            strokeStyle: "#5ac1d0"
            clip: false
            fill: true
        }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}
}
##^##*/
