import QtQuick
import QtQuick 2.2
import QtQuick.Controls 2.5
import Qt.labs.platform
import "../custom"
import "../../controls"
import "../../javascript/region.js" as Region
import "../../javascript/color-picker.js" as ColorPicker


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

    signal newRegion(string greaterThan, string lessThan, string chosenRegionColor, string chosenRegionColorName) // Sends this to Regions.qml
//    signal closeColorDialogBox()
    property var errorMessage: ""
    property color chosenRegionColor: colorPicker1.chosenColor
    property color regionColorName: colorPicker1.chosenColorName


    Connections {
        target: regions
        function onEmitRegionErrorMessage(msg) {
            Region.regionErrorMsg(msg)
        }
    }

    onClicked: Region.expandDialogBox()

    Connections {
        target: backend
        function onDestroyMsg() {
            Region.destroyErrorMsg()
        }
    }

    hoverEnabled: true
    down: false
    flat: true

    FontLoader {
        id: pragmaticaFont
        source: "../../fonts/PT Pragmatica Book.ttf"
    }

    QtObject{
        id: internal

        property var dynamicColor: button.hovered ? colorMouseOver : colorDefault
        property var dynamicFontColor: button.hovered ? fontColorMouseOver : fontColorDefault
    }

    Rectangle {
        id: dialogBox
        y: 0
        opacity: 0
        visible: true
        width: 178
        height: 67
        color: "#ffffff"
        radius: 5
        border.color: "#087589"
        border.width: 2
        anchors.left: parent.right
        clip: false
        anchors.leftMargin: 0
        onOpacityChanged: if(dialogBoxOpacityOff.running === true && dialogBox.opacity === 0) return dialogBox.visible = false

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
            clip: false
            z: 0
            anchors.topMargin: 5
            anchors.rightMargin: 5
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: closeDialogBoxMouseArea
                anchors.fill: parent
                onClicked: {Region.expandDialogBox()}
            }
        }



        CustomTextField {
            id: greaterThanOrEqualEntry
            x: 8
            y: 8
            width: 28
            height: 20
            validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
        }



        CustomTextField {
            id: lessThanEntry
            x: 130
            width: 28
            height: 20
            validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
            anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
        }



        Label {
            id: greaterThanOrEqualLabel
            x: 50
            color: "#087589"
            text: String.fromCharCode(0x2264)
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



        ColorPicker {
            id: colorPicker1
            x: 13
            width: 20
            height: 20
            anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
            anchors.verticalCenterOffset: 31
        }



        CustomButton {
            id: submitButton
            x: 120
            y: 44
            width: 48
            height: 15
            text: "Submit"
            onClicked: newRegion(greaterThanOrEqualEntry.text, lessThanEntry.text, chosenRegionColor, regionColorName)
            enabled: true
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
    D{i:0;formeditorZoom:1.25}
}
##^##*/
