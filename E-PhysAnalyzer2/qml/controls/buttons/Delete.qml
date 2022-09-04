import QtQuick 2.15
import QtQuick.Controls 2.5

Button {
    id: circle
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    anchors.leftMargin: 10

    property color colorDefault: "white"
    property color colorMouseOver: "#FF9E9E"

    QtObject{
        id: internal

        property var dynamicColor: circle.hovered ? colorMouseOver : colorDefault
    }
    background: Rectangle {
        color: internal.dynamicColor
        radius: width * 0.5
        border.width: 0
        implicitHeight: width
        implicitWidth: 140 * scaleFactor

        Image {
            id: iconBtn
            source: "../../../images/svg_images/close_icon.svg"
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            anchors.bottomMargin: 2
            anchors.topMargin: 2
            visible: true
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }
    }
    flat: true
    down: false
    display: AbstractButton.IconOnly
}
