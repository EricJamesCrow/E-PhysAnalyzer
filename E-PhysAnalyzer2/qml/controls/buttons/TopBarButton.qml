import QtQuick 2.15
import QtQuick.Controls 2.15
//import Qt5Compat.GraphicalEffects

Button{
    id: btnTopBar
    // CUSTOM PROPERTIES
    property url btnIconSource: "../../../images/svg_images/minimize_icon.svg"
    property color btnColorDefault: "#ffffff"
    property color btnColorMouseOver: settings.buttonColorDefault
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    width: 35 * scaleFactor
    height: 35 * scaleFactor
    down: false
    flat: true

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        clip: true

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16 * scaleFactor
            width: 16 * scaleFactor
            visible: true
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }
    }
}
