import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    property real fontSize: 9 * scaleFactor

    id: customTextField
    width: 202*scaleFactor
    height: 20*scaleFactor
    font.pointSize: fontSize
    color: fontColorDefault
    placeholderText: customTextField.text
    placeholderTextColor: fontColorDefault
    background: Rectangle { color: colorDefault; radius: 5 * scaleFactor }
    focusReason: Qt.MouseFocusReason
    // Custom Properties
    property color colorDefault: backgroundColor
    property color fontColorDefault: buttonColorDefault

    Rectangle {
        id: textFieldDropShadow
        x: 2 * scaleFactor
        y: 2 * scaleFactor
        height: 740 * scaleFactor
        opacity: 0.25
        visible: true
        color: "#000000"
        radius: 5 * scaleFactor
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
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:200}
}
##^##*/
