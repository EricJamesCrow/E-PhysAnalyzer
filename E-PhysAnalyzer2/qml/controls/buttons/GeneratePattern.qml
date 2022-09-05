import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.5
import "../custom"
import "../../javascript/region.js" as Region


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
    onClicked: Region.expandDialogBox()

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
        width: 167
        height: 93
        color: "#ffffff"
        radius: 5
        border.color: "#087589"
        border.width: 2
        anchors.top: parent.bottom
        anchors.topMargin: 0

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
                onClicked: Region.expandDialogBox()
            }
        }

        CustomTextField {
            id: every_minutesTextField
            x: 71
            width: 28
            height: 20
            anchors.verticalCenter: everyLabel.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        CustomTextField {
            id: startTimeEntry
            x: 71
            width: 28
            height: 20
            anchors.verticalCenter: every_minutesTextField.verticalCenter
            anchors.verticalCenterOffset: 29
        }

        CustomTextField {
            id: endTimeEntry
            x: 71
            width: 28
            height: 20
            anchors.verticalCenter: every_minutesTextField.verticalCenter
            anchors.verticalCenterOffset: 58
        }

        CustomButton {
            id: submitButton
            x: 111
            y: 70
            width: 48
            height: 15
            text: "Submit"
        }


        Label {
            id: everyLabel
            x: 37
            y: 12
            color: "#087589"
            text: qsTr("Every")
        }


        Label {
            id: minutesLabel
            x: 105
            color: "#087589"
            text: qsTr("minutes")
            anchors.verticalCenter: everyLabel.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        Label {
            id: everyLabel2
            x: 13
            y: 38
            color: "#087589"
            text: qsTr("Start time")
        }

        Label {
            id: everyLabel3
            x: 13
            y: 70
            color: "#087589"
            text: qsTr("End time")
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
            text: "Generate Pattern"
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
    D{i:0;formeditorZoom:1.33}D{i:6}D{i:8}D{i:11}D{i:12}D{i:13}D{i:3}
}
##^##*/
