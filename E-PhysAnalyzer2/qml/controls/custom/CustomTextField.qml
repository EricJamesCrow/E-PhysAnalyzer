import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: customTextField
    width: 202*scaleFactor
    height: 20*scaleFactor
    font.pointSize: 9*scaleFactor
    color: fontColorDefault
    placeholderText: customTextField.text
    placeholderTextColor: fontColorDefault
    background: Rectangle { color: colorDefault; radius: 5 }
    focusReason: Qt.MouseFocusReason
    // Custom Properties
    property color colorDefault: backgroundColor
    property color fontColorDefault: buttonColorDefault

    Rectangle {
        id: textFieldDropShadow
        x: 2
        y: 2
        height: 740
        opacity: 0.25
        visible: true
        color: "#000000"
        radius: 5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        anchors.topMargin: 1
        anchors.leftMargin: 1
        anchors.rightMargin: -1
        anchors.bottomMargin: -1
        z: -3
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:200}
}
##^##*/
