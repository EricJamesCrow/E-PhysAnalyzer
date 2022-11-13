import QtQuick 2.15
import QtQuick.Controls 6.2

Button {
    id: button
    down: false
    flat: true

    property var btnImage: ""
    property color colorDefault: settings.buttonColorDefault
    property color colorMouseOver: settings.terminalText

    QtObject{
        id: internal

        property var dynamicColor: button.hovered ? colorMouseOver : colorDefault
    }

    background: Rectangle {
            id: buttonBackground
            opacity: 1
            color: internal.dynamicColor
            radius: 10 * scaleFactor
            border.color: internal.dynamicColor
            border.width: 1

                Image {
                id: buttonImage
                anchors.fill: parent
                source: btnImage
                mipmap: true
                anchors.leftMargin: 5 * scaleFactor
                anchors.bottomMargin: 5 * scaleFactor
                anchors.rightMargin: 5 * scaleFactor
                antialiasing: true
                fillMode: Image.PreserveAspectFit
                anchors.topMargin: 5 * scaleFactor
                }
            }
}



/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/
