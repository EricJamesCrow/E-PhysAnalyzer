import QtQuick
import QtQuick.Controls

Switch {
    id: control
    property bool checkedState: false

    indicator: Rectangle {
        implicitWidth: 48 * scaleFactor
        implicitHeight: 26 * scaleFactor
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13 * scaleFactor
        color: control.checked ? "#02323a" : "#ffffff"
        border.color: control.checked ? "#5ac1d0" : "#cccccc"

        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: 26 * scaleFactor
            height: 26 * scaleFactor
            radius: 13 * scaleFactor
            color: control.down ? "#cccccc" : "#ffffff"
            border.color: control.checked ? (control.down ? "#5ac1d0" : "#5ac1d0") : "#999999"
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.checked ? "#02323a" : "#ffffff"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
