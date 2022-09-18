import QtQuick 2.15
import QtQuick.Controls 2.5
import "../controls/custom"
import "../controls/buttons"
import "../javascript/region.js" as Region
import "../javascript/color-picker.js" as ColorPicker
import "../javascript/startup.js" as Startup

Item {
    id: colorPicker
//    height: 20 * scaleFactor
//    width: 20 * scaleFactor

    property string chosenColor: "#FF0000"
    property string chosenColorName: chosenColor
    property int colorPickerAxis: 0
    property var errorMessage : ""

    Connections {
        target: backend
        function onDestroyColorPicker() {
            try{
              errorMessage.destroy()
            } catch(err) {
            }
            customColorEntry.enabled = true
        }
        function onStartUpNewRegion(num) {
            Startup.colorPicker(num)
            if(num === 123) {
                chosenColor = "#FF0000"
            }
        }
    }

    ColorPickerBtn {
        id: selectColorPickerIcon
        width: colorPicker.width
        height: colorPicker.height
        selectedColor: chosenColor
        onClicked: Region.expandDialogBox()
    }

    Rectangle {
        id: dialogBox
        x: colorPickerAxis
        opacity: 0
        visible: false
        width: colorPicker.width * 6
        height: colorPicker.height * 5.5
        color: "#ffffff"
        radius: 5 * scaleFactor
        border.color: "#087589"
        border.width: 2 * scaleFactor
        anchors.top: parent.bottom
        anchors.topMargin: 0
        clip: false
        onOpacityChanged: if(dialogBox.opacity === 0) return dialogBox.visible = false


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
            id: closeBtn
            x: 100
            height:colorPicker.height / 1.8 * scaleFactor
            width: colorPicker.width / 1.8 * scaleFactor
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 3 * scaleFactor
            anchors.rightMargin: 3 * scaleFactor
            onClicked: Region.expandDialogBox()
        }

        ColorPickerBtn {
            id: red
            x: 5 * scaleFactor
            y: 6 * scaleFactor
            width: colorPicker.width // 20 * scaleFactor
            height: colorPicker.height // 20 * scaleFactor
            selectedColor: "#FF0000"
            anchors.left: parent.left
            anchors.leftMargin: 5 * scaleFactor
            onClicked: chosenColor = red.selectedColor

            ColorPickerBtn {
                id: blue
                x: 25 * scaleFactor
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#0000FF"
                anchors.left: red.right
                anchors.leftMargin: 5 * scaleFactor
                onClicked: chosenColor = blue.selectedColor;
            }

            ColorPickerBtn {
                id: green
                x: 50 * scaleFactor
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#008000"
                anchors.left: blue.right
                anchors.leftMargin: 5 * scaleFactor
                onClicked: chosenColor = green.selectedColor
            }

            ColorPickerBtn {
                id: purple
                x: 75 * scaleFactor
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#800080"
                anchors.left: green.right
                anchors.leftMargin: 5 * scaleFactor
                onClicked: chosenColor = purple.selectedColor
            }
        }

        ColorPickerBtn {
            id: crimson
            x: 11 * scaleFactor
            width: colorPicker.width
            height: colorPicker.height
            selectedColor: "#dc143c"
            anchors.left: parent.left
            anchors.top: red.bottom
            anchors.topMargin: 5 * scaleFactor
            anchors.leftMargin: 5 * scaleFactor
            onClicked: chosenColor = crimson.selectedColor

            ColorPickerBtn {
                id: navy
                x: 25 * scaleFactor
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#000080"
                anchors.left: crimson.right
                anchors.leftMargin: 5 * scaleFactor
                onClicked: chosenColor = navy.selectedColor
            }

            ColorPickerBtn {
                id: darkolivegreen
                x: 50 * scaleFactor
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#556b2f"
                anchors.left: navy.right
                anchors.leftMargin: 5 * scaleFactor
                onClicked: chosenColor = darkolivegreen.selectedColor
            }

            ColorPickerBtn {
                id: mediumpurple
                x: 75 * scaleFactor
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#9370db"
                anchors.left: darkolivegreen.right
                anchors.leftMargin: 5 * scaleFactor
                onClicked: chosenColor = mediumpurple.selectedColor
            }
        }

        ColorPickerBtn {
            id: orange
            x: 5 * scaleFactor
            width: colorPicker.width
            height: colorPicker.height
            selectedColor: "#ffa500"
            anchors.left: parent.left
            anchors.top: crimson.bottom
            anchors.topMargin: 5 * scaleFactor
            anchors.leftMargin: 5 * scaleFactor
            onClicked: chosenColor = orange.selectedColor

            ColorPickerBtn {
                id: brown
                x: 25 * scaleFactor
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#a52a2a"
                anchors.left: orange.right
                anchors.leftMargin: 5 * scaleFactor
                onClicked: chosenColor = brown.selectedColor
            }

            ColorPickerBtn {
                id: saddlebrown
                x: 50 * scaleFactor
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#8b4513"
                anchors.left: brown.right
                anchors.leftMargin: 5 * scaleFactor
                onClicked: chosenColor = saddlebrown.selectedColor
            }

            ColorPickerBtn {
                id: black
                x: 75 * scaleFactor
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#000000"
                anchors.left: saddlebrown.right
                anchors.leftMargin: 5 * scaleFactor
                onClicked: chosenColor = black.selectedColor
            }
            anchors.verticalCenterOffset: 3 * scaleFactor
        }

        CustomTextField {
            id:customColorEntry
            fontSize: colorPicker.height / 2.85
            height: colorPicker.height / 1.3
            anchors.top: orange.bottom
            anchors.topMargin:colorPicker.height / 2.5
            anchors.horizontalCenterOffset: colorPicker.height / 1.3
            anchors.horizontalCenter: parent.horizontalCenter
            width: colorPicker.height * 2.5
            onTextChanged: try{
                               chosenColor = ColorPicker.colorDict[customColorEntry.text]
                           } catch(err) {
                           }
            Keys.onReturnPressed: try{
                                    chosenColor = ColorPicker.colorDict[customColorEntry.text]
                                    Region.expandDialogBox()
                                  } catch(err) {
                                      Region.colorPickerErrorMsg("Color not available", "colorpicker")
                                  }

            Label {
                id: label
                x: -41 * scaleFactor
                y: 3 * scaleFactor
                text: qsTr("Custom:")
                color: "#087589"
                anchors.verticalCenter: customColorEntry.verticalCenter
                anchors.right: customColorEntry.left
                anchors.rightMargin: 4 * scaleFactor
                font.pointSize: 5 * scaleFactor
                font.family: "PragmaticaLightC"
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}
}
##^##*/
