import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.5
import "../custom"
import "../../javascript/new-region.js" as NewRegion


Button {
    id: button
    width: 112
    height: 20

    // Custom Properties
    property color borderColor: "#087589"//buttonColorDefault
    property color colorDefault: "#ffffff"//buttonColorDefault
    property color colorMouseOver: "#b8e3ee"//backgroundColor
    property color colorPressed: "#357aac"//buttonColorPressed
    property color fontColorDefault: "#087589"
    property color fontColorMouseOver: "#ffffff"//buttonColorDefault
    property color fontColorPressed: "#ffffff"

    signal newRegion(string greaterThan, string lessThan)

    onClicked: NewRegion.expandDialogBox()

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

        property var dynamicColor: button.hovered ? colorMouseOver : colorDefault
        property var dynamicFontColor: button.hovered ? fontColorMouseOver : fontColorDefault
    }

    Rectangle {
        id: dialogBox
        opacity: 0
        visible: true
        width: 226
        height: 67
        color: "#ffffff"
        radius: 5
        border.color: "#087589"
        border.width: 2
        anchors.left: parent.right
        anchors.leftMargin: 0

        OpacityAnimator on opacity{
            id: dialogBoxOpacityOn
            from: 0
            to: 1.0
            duration:25
            target: dialogBox
            running: false
        }

        OpacityAnimator on opacity{
            id: dialogBoxOpacityOff
            from: 1.0
            to: 0
            duration:25
            target: dialogBox
            running: false
        }

        Image {
            id: closeDialogBox
            x: 204
            width: 12
            height: 14
            anchors.right: parent.right
            anchors.top: parent.top
            source: "../../../images/svg_images/close_icon.svg"
            z: 0
            anchors.topMargin: 5
            anchors.rightMargin: 5
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: closeDialogBoxMouseArea
                anchors.fill: parent
                onClicked: NewRegion.expandDialogBox()
            }
        }

        CustomTextField {
            id: greaterThanOrEqualEntry
            x: 8
            y: 8
            width: 28
            height: 20
        }

        CustomTextField {
            id: lessThanEntry
            x: 130
            width: 28
            height: 20
            anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
        }

        Label {
            id: greaterThanOrEqualLabel
            x: 50
            color: "#087589"
            text: qsTr("<=")
            anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
        }

        Label {
            id: lessThanLabel
            x: 108
            color: "#087589"
            text: qsTr("<")
            anchors.verticalCenter: greaterThanOrEqualLabel.verticalCenter
        }

        Label {
            id: xLabel
            x: 83
            width: 11
            height: 16
            color: "#087589"
            text: qsTr("X")
            anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
        }

        Rectangle {
            id: rectangle
            x: 175
            width: 23
            height: 20
            color: "#f81010"
            radius: 5
            border.width: 2
            anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
        }

        CustomButton {
            id: submitButton
            x: 163
            y: 44
            width: 48
            height: 15
            text: "Submit"
            onClicked: newRegion(greaterThanOrEqualEntry.text, lessThanEntry.text)
        }
    }

    text: qsTr("Button")
    checkable: false
    display: AbstractButton.TextBesideIcon
    contentItem: Item{
        Text {
            id: name
            font.family: pragmaticaFont.font.family
            font.pixelSize: 0.5 * button.height
            color: fontColorDefault
            text: "New Region"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    background: Rectangle{
        color: internal.dynamicColor
        border.color: borderColor
        border.width: 2
        radius: 5
    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/
