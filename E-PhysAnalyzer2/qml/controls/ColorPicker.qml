import QtQuick 2.15
import QtQuick.Controls 2.5
import "../controls/custom"
import "../controls/buttons"
import "../javascript/region.js" as Region
import "../javascript/color-picker.js" as ColorPicker

Item {
    id: colorPicker
    height: 20
    width: 20

    property string chosenColor: "#FF0000"
    property string chosenColorName: chosenColor
    property int colorPickerAxis: 0

//    Connections {
//        target: newRegionBtn1
//        function onCloseColorDialogBox() {
//            ColorPicker.closeColorDialogBox()
//        }
//    }

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
        radius: 5
        border.color: "#087589"
        border.width: 2
        anchors.top: parent.bottom
        anchors.topMargin: 0
        clip: false


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
            height:colorPicker.height / 1.8
            width: colorPicker.width / 1.8
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 3
            anchors.rightMargin: 3
            onClicked: Region.expandDialogBox()
        }

        ColorPickerBtn {
            id: red
            x: 5
            y: 6
            width: colorPicker.width
            height: colorPicker.height
            selectedColor: "#FF0000"
            anchors.left: parent.left
            anchors.leftMargin: 5
            onClicked: chosenColor = red.selectedColor

            ColorPickerBtn {
                id: blue
                x: 25
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#0000ff"
                anchors.left: red.right
                anchors.leftMargin: 5
                onClicked: chosenColor = blue.selectedColor;
            }

            ColorPickerBtn {
                id: green
                x: 50
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#008000"
                anchors.left: blue.right
                anchors.leftMargin: 5
                onClicked: chosenColor = green.selectedColor
            }

            ColorPickerBtn {
                id: purple
                x: 75
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#800080"
                anchors.left: green.right
                anchors.leftMargin: 5
                onClicked: chosenColor = purple.selectedColor
            }
        }

        ColorPickerBtn {
            id: crimson
            x: 11
            width: colorPicker.width
            height: colorPicker.height
            selectedColor: "#dc143c"
            anchors.left: parent.left
            anchors.top: red.bottom
            anchors.topMargin: 5
            anchors.leftMargin: 5
            onClicked: chosenColor = crimson.selectedColor

            ColorPickerBtn {
                id: navy
                x: 25
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#000080"
                anchors.left: crimson.right
                anchors.leftMargin: 5
                onClicked: chosenColor = navy.selectedColor
            }

            ColorPickerBtn {
                id: darkolivegreen
                x: 50
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#556b2f"
                anchors.left: navy.right
                anchors.leftMargin: 5
                onClicked: chosenColor = darkolivegreen.selectedColor
            }

            ColorPickerBtn {
                id: mediumpurple
                x: 75
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#9370db"
                anchors.left: darkolivegreen.right
                anchors.leftMargin: 5
                onClicked: chosenColor = mediumpurple.selectedColor
            }
        }

        ColorPickerBtn {
            id: orange
            x: 5
            width: colorPicker.width
            height: colorPicker.height
            selectedColor: "#ffa500"
            anchors.left: parent.left
            anchors.top: crimson.bottom
            anchors.topMargin: 5
            anchors.leftMargin: 5
            onClicked: chosenColor = orange.selectedColor

            ColorPickerBtn {
                id: brown
                x: 25
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#a52a2a"
                anchors.left: orange.right
                anchors.leftMargin: 5
                onClicked: chosenColor = brown.selectedColor
            }

            ColorPickerBtn {
                id: saddlebrown
                x: 50
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#8b4513"
                anchors.left: brown.right
                anchors.leftMargin: 5
                onClicked: chosenColor = saddlebrown.selectedColor
            }

            ColorPickerBtn {
                id: black
                x: 75
                y: 0
                width: colorPicker.width
                height: colorPicker.height
                selectedColor: "#000000"
                anchors.left: saddlebrown.right
                anchors.leftMargin: 5
                onClicked: chosenColor = black.selectedColor
            }
            anchors.verticalCenterOffset: 3
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

            Label {
                id: label
                x: -41
                y: 3
                text: qsTr("Custom:")
                color: "#087589"
                anchors.verticalCenter: customColorEntry.verticalCenter
                anchors.right: customColorEntry.left
                anchors.rightMargin: 4
                font.pointSize: colorPicker.height / 2.85
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
