import QtQuick
import QtQuick.Controls

ScrollBar {
    id: control
    size: 0.3
    position: 0.2
    active: true
    orientation: Qt.Vertical

    property color btnColorDefault: buttonColorDefault
    property color backgroundColorDefault: backgroundColor


    contentItem: Rectangle {
        implicitWidth: 6*scaleFactor
        implicitHeight: 100*scaleFactor
        radius: width / 2
        color: control.pressed ? btnColorDefault : backgroundColorDefault/*"#80dcf3"*/
        // Hide the ScrollBar when it's not needed.
        opacity: control.policy === ScrollBar.AlwaysOn || (control.active && control.size < 1.0) ? 0.75 : 0

        // Animate the changes in opacity (default duration is 250 ms).
        Behavior on opacity {
            NumberAnimation {}
        }
    }
}
