import QtQuick 2.15
import QtQuick.Controls 2.15
//import Qt5Compat.GraphicalEffects

Button{
    id: btnTopBar
    // CUSTOM PROPERTIES
    property url btnIconSource: "../../../images/svg_images/close_icon_white.svg"
    property color btnColorDefault: "#ffffff"
    property color btnColorMouseOver: "#ff007f"
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

    width: 35
    height: 35
    down: false
    flat: true

    background: Rectangle {
        id: roundRect
        radius: 10
        color: internal.dynamicColor
      }

      Rectangle {
        id: squareRect
        color: internal.dynamicColor
        height: roundRect.radius
        anchors.bottom: roundRect.bottom
        anchors.left: roundRect.left
        anchors.right: roundRect.right
        z: -1
      }

      Rectangle {
        id: anotherSquareRect
        color: internal.dynamicColor
        width: roundRect.radius
        anchors.bottom: roundRect.bottom
        anchors.left: roundRect.left
        anchors.top: roundRect.top
        z: -1
      }

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            visible: true
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }

}
