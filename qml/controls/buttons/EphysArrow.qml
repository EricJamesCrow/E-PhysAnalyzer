import QtQuick 2.0
import QtQuick.Controls 6.2
import "../../controls"

Button {
    id: button
    onHoveredChanged: triangle.requestPaint()
    onCheckedStateChanged: triangle.requestPaint()

    QtObject{
        id: internal
        property var dynamicColor: button.hovered ? colorMouseOver : colorDefault
    }

    property color colorDefault: checkedState === true ? settings.terminalText : "#802aafd3"
    property color colorMouseOver: settings.backgroundColor
    property int arrowRotation: 0
    property bool checkedState: true

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


/*##^##
Designer {
    D{i:0;formeditorZoom:8}
}
##^##*/
