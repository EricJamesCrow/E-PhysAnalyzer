import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: button

    // Custom Properties
    property color selectedColor: "#f81010"
    property color colorDefault: "#087589"
    property color colorMouseOver: "#b8e3ee"
    property bool startUp: false

    down: false
    flat: true

    QtObject{
        id: internal

        property var dynamicColor: if(button.hovered) {
                                       return colorMouseOver
                                   } else if(startUp) {
                                    return colorMouseOver
                                   } else {
                                       return colorDefault
                                       }
    }

    checkable: false
    display: AbstractButton.TextBesideIcon

    background: Rectangle {
        id: background
        width: button.width * scaleFactor
        height: button.height * scaleFactor
        color: selectedColor
        radius: 3 * scaleFactor
        border.color: "#087589"
        border.width: 1 * scaleFactor
        clip: true

        Rectangle {
            anchors.fill: parent
            radius: 3 * scaleFactor
            color: colorMouseOver
            visible: button.hovered
            opacity: 0.5
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:4}
}
##^##*/
