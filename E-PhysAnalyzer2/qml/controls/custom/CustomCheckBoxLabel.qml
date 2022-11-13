import QtQuick
import QtQuick.Controls

Button {
    id: filterCheckBox
    property string checkBoxTheme: buttonColorDefault
    property string checkBoxThemeClicked: backgroundColor
    property bool checkedState: false
    property var checkboxSvgIcon: "../../../images/svg_images/checkmark_icon_087589.svg"//checkBoxIcon


    display: AbstractButton.IconOnly
    clip: true

    QtObject{
        id: internal

        function returnColor(){
            if(checkedState) {
                return buttonColorDefault
            } else {
                return backgroundColor
            }
        }

        property var dynamicColor: filterCheckBox.hovered ? checkBoxHighlighted: buttonColorDefault;


        property var checkedButton: if(filterCheckBox.down && checkedState === false) {
                                    checkedState = true
                              } else if(filterCheckBox.down && checkedState === true){
                                        checkedState = false
                                    }
    }
        Rectangle {
        id: rectangle
        x: 0
        y: 0
        implicitWidth: filterCheckBox.width /*100 */
        implicitHeight: filterCheckBox.height /*26 */
        visible: true
        color: "#ffffff"
        radius: 3 * scaleFactor
        clip: true
        border.color: internal.dynamicColor

        Label {
            id: label
            text: filterCheckBox.text
            anchors.fill: parent
            parent: rectangle.parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 0
            anchors.leftMargin: 20 * scaleFactor
            color: internal.dynamicColor
            font.pointSize: 10 * scaleFactor
            font.family: "PragmaticaLightC"
        }

        Rectangle {
            id: checkmarkImgBorder
            width: 16* scaleFactor
            color: "#00000000"
            border.width: 1* scaleFactor
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 8* scaleFactor
            anchors.bottomMargin: 5* scaleFactor
            anchors.topMargin: 5* scaleFactor
            border.color: internal.dynamicColor
            radius: 3 * scaleFactor

            Image {
                id: checkmarkImg
                visible: checkedState
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: checkboxSvgIcon
                anchors.rightMargin: 2 * scaleFactor
                anchors.leftMargin: 2 * scaleFactor
                anchors.bottomMargin: 2 * scaleFactor
                anchors.topMargin: 2 * scaleFactor
                fillMode: Image.PreserveAspectFit
            }
        }
    }

        Rectangle {
            id: checkBoxDropShadow
            opacity: 0.20
            visible: true
            color: "#000000"
            radius: 3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: true
            anchors.topMargin: 1 * scaleFactor
            anchors.leftMargin: 1 * scaleFactor
            anchors.rightMargin: -1 * scaleFactor
            anchors.bottomMargin: -1 * scaleFactor
            z: -3
        }

//    contentItem: Text {
//        text: filterCheckBox.text
//        font: filterCheckBox.font
//        opacity: enabled ? 1.0 : 0.3
//        color: filterCheckBox.down ? checkBoxThemeClicked : checkBoxTheme
//        verticalAlignment: Text.AlignVCenter
//        leftPadding: filterCheckBox.indicator.width + filterCheckBox.spacing
//    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}
}
##^##*/
