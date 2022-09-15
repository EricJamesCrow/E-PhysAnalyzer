import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: button
    onClicked: button.focus = false

    // Custom Properties
    property color colorDefault: buttonColorDefault
    property color colorMouseOver: backgroundColor
    property color colorPressed: buttonColorPressed
    property color fontColorDefault: "#ffffff"
    property color fontColorMouseOver: buttonColorDefault
    property color fontColorPressed: "#ffffff"

    hoverEnabled: true
    down: false
    flat: true

    FontLoader {
        id: pragmaticaFont
        source: "../../fonts/PT Pragmatica Book.ttf"
//          source:"../fonts/LDFComicSans.ttf"
    }

    QtObject{
        id: internal

        property var dynamicColor: button.hovered || button.focus ? colorMouseOver : colorDefault
        property var dynamicFontColor: button.hovered || button.focus ? fontColorMouseOver : fontColorDefault
    }

    text: qsTr("Button")
    checkable: false
    display: AbstractButton.TextBesideIcon
    contentItem: Item{
        Text {
            id: name
            text: button.text
            font.family: pragmaticaFont.font.family
            font.pixelSize: 0.5 * button.height
            color: internal.dynamicFontColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    background: Rectangle{
        color: internal.dynamicColor
        border.color: colorDefault
        border.width: 2 * scaleFactor
        radius: 5 * scaleFactor
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:200}
}
##^##*/
