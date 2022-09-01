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
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:200}
}
##^##*/
