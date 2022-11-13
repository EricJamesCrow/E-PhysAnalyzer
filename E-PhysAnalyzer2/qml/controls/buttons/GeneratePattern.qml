import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.5
import "../custom"
import "../../javascript/region.js" as Region
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
    property var errorMessage: ""
    onClicked: Region.expandDialogBox()

    signal gPclearRegions()

    hoverEnabled: true
    down: false
    flat: true

    Connections {
        target: backend
        function onDestroyGenPtn(destroy){
            if(destroy) {
              errorMessage.destroy()
            }
            submitButton.enabled = true
        }
        function onStartUpGenPtn(num) {
            Startup.genPattern(num)
        }
    }

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
        width: 167 * scaleFactor
        height: 93 * scaleFactor
        color: "#ffffff"
        radius: 5
        border.color: "#087589"
        border.width: 2 * scaleFactor
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

        Delete {
            id: closeDialogBox
            x: 204 * scaleFactor
            width: 14 * scaleFactor
            height: 14 * scaleFactor
            anchors.right: parent.right
            anchors.top: parent.top
            z: 0
            anchors.topMargin: 5 * scaleFactor
            anchors.rightMargin: 5 * scaleFactor
            onClicked: Region.expandDialogBox()
        }

        CustomTextField {
            id: every_minutesTextField
            x: 71 * scaleFactor
            width: 28 * scaleFactor
            height: 20 * scaleFactor
            validator: IntValidator {bottom: 1; top: 100}
            anchors.verticalCenter: everyLabel.verticalCenter
            anchors.verticalCenterOffset: 0
           font.pointSize: 8 * scaleFactor

            CustomTextField {
                id: startTimeEntry
                x: 0
                y: 29 * scaleFactor
                width: 30 * scaleFactor
                height: 20 * scaleFactor
                validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
                anchors.verticalCenter: every_minutesTextField.verticalCenter
                font.pointSize: 8 * scaleFactor
                anchors.verticalCenterOffset: 29 * scaleFactor

                CustomTextField {
                    id: endTimeEntry
                    x: 0
                    y: 29 * scaleFactor
                    width: 30 * scaleFactor
                    height: 20 * scaleFactor
                    validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
                    anchors.verticalCenter: every_minutesTextField.verticalCenter
                    anchors.verticalCenterOffset: 58 * scaleFactor
                    font.pointSize: 8 * scaleFactor

                    CustomButton {
                        id: submitButton
                        x: 40 * scaleFactor
                        y: 2 * scaleFactor
                        width: 48 * scaleFactor
                        height: 15 * scaleFactor
                        font.pointSize: 9 * scaleFactor
                        text: "Submit"
                        enabled: dialogBox.opacity === 1.0
                        onClicked: Region.generatePattern(every_minutesTextField.text, startTimeEntry.text, endTimeEntry.text)
                        Keys.onReturnPressed: Region.generatePattern(every_minutesTextField.text, startTimeEntry.text, endTimeEntry.text)
                    }
                }
            }
        }


        Label {
            id: everyLabel
            x: 37 * scaleFactor
            y: 12 * scaleFactor
            color: "#087589"
            text: qsTr("Every")
            font.pointSize: 9 * scaleFactor
        }


        Label {
            id: minutesLabel
            x: 105 * scaleFactor
            color: "#087589"
            text: qsTr("minutes")
            anchors.verticalCenter: everyLabel.verticalCenter
            anchors.verticalCenterOffset: 0
            font.pointSize: 9 * scaleFactor
        }

        Label {
            id: everyLabel2
            x: 13 * scaleFactor
            y: 38 * scaleFactor
            color: "#087589"
            text: qsTr("Start time")
            font.pointSize: 9 * scaleFactor
        }

        Label {
            id: everyLabel3
            x: 13 * scaleFactor
            y: 70 * scaleFactor
            color: "#087589"
            text: qsTr("End time")
            font.pointSize: 9 * scaleFactor
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
        border.width: 2 * scaleFactor
        radius: 5 * scaleFactor
    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/
