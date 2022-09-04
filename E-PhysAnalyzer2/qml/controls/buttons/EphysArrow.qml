import QtQuick 2.0
import QtQuick.Controls 6.2
import "../../controls"

Button {
    id: button
    onHoveredChanged: triangle.requestPaint()

    QtObject{
        id: internal
        property var dynamicColor: button.hovered ? colorMouseOver : colorDefault
    }

    property color colorDefault: settings.terminalText
    property color colorMouseOver: settings.backgroundColor
    property int arrowRotation: 0

    down: false
    flat: true

    background: Triangle {
        id: triangle
        width: button.width
        height: button.height
        rotation: arrowRotation
        fillStyle: internal.dynamicColor //"#4abece"
        strokeStyle: internal.dynamicColor //"#4abece"
        clip: false
        fill: true
    }
}

