import QtQuick
import QtQuick 2.2
import QtQuick.Controls 2.5
import Qt.labs.platform
import "../custom"
import "../../controls"
import "../../javascript/region.js" as Region
import "../../javascript/color-picker.js" as ColorPicker
import "../../javascript/startup.js" as Startup


Button {
    id: button
    width: 112 * scaleFactor
    height: 20 * scaleFactor

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
        function onEmitRegionErrorMessage(msg, region) {
            Region.regionErrorMsg(msg, region)
        }
    }

    onClicked: Region.expandDialogBox()

    Connections {
        target: backend
        function onDestroyMsg() {
            Region.destroyErrorMsg()
        }
        function onStartUpNewRegion(num) {
            Startup.newRegion(num)
            if(num === 17) {
                return newRegion(greaterThanOrEqualEntry.text, lessThanEntry.text, chosenRegionColor, regionColorName)
            }

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
        width: 178 * scaleFactor
        height: 67 * scaleFactor
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


        Delete {
            id: closeDialogBox
            x: 204 * scaleFactor
            width: 14 * scaleFactor
            height: 14 * scaleFactor
            anchors.right: parent.right
            anchors.top: parent.top
            onClicked: Region.expandDialogBox()
            z: 0
            anchors.topMargin: 5 * scaleFactor
            anchors.rightMargin: 5 * scaleFactor
        }



        CustomTextField {
            id: greaterThanOrEqualEntry
            x: 8 * scaleFactor
            y: 8 * scaleFactor
            width: 30 * scaleFactor
            height: 20 * scaleFactor
            font.pointSize: 8 * scaleFactor
            validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }

            CustomTextField {
                id: lessThanEntry
                x: 120 * scaleFactor
                width: 30 * scaleFactor
                height: 20 * scaleFactor
                font.pointSize: 8 * scaleFactor
                validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
                anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
            }

            CustomButton {
                id: submitButton
                x: 115 * scaleFactor
                y: 40 * scaleFactor
                width: 48 * scaleFactor
                height: 15 * scaleFactor
                text: "Submit"
                onClicked: {newRegion(greaterThanOrEqualEntry.text, lessThanEntry.text, chosenRegionColor, regionColorName);
                    greaterThanOrEqualEntry.text = "";
                    lessThanEntry.text = "";
                    greaterThanOrEqualEntry.focus = true}
                Keys.onReturnPressed: {newRegion(greaterThanOrEqualEntry.text, lessThanEntry.text, chosenRegionColor, regionColorName);
                    greaterThanOrEqualEntry.text = "";
                    lessThanEntry.text = "";
                    greaterThanOrEqualEntry.focus = true}
                enabled: true
            }
        }





        Label {
            id: greaterThanOrEqualLabel
            x: 50 * scaleFactor
            color: "#087589"
            text: String.fromCharCode(0x2264)
            font.pointSize: 9 * scaleFactor
            anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
        }



        Label {
            id: lessThanLabel
            x: 108 * scaleFactor
            color: "#087589"
            text: qsTr("<")
            font.pointSize: 9 * scaleFactor
            anchors.verticalCenter: greaterThanOrEqualLabel.verticalCenter
        }



        Label {
            id: xLabel
            x: 83 * scaleFactor
            width: 11 * scaleFactor
            height: 16 * scaleFactor
            color: "#087589"
            text: qsTr("X")
            font.pointSize: 9 * scaleFactor
            anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
        }



        ColorPicker {
            id: colorPicker1
            x: 13 * scaleFactor
            width: 20 * scaleFactor
            height: 20 * scaleFactor
            anchors.verticalCenter: greaterThanOrEqualEntry.verticalCenter
            anchors.verticalCenterOffset: 31 * scaleFactor
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
        border.width: 2 * scaleFactor
        radius: 5 * scaleFactor
    }

}
/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}
}
##^##*/
