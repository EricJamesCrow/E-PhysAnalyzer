import QtQuick 2.0
import QtQuick.Controls 6.2

Item {
    width: 493
    height: 50

    FontLoader {
        id: fixedFont
        source: "../fonts/Segoe UI.ttf"
    }

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Label {
            id: filesLabel
            x: 43
            y: 18
            width: 61
            height: 26
            visible: false
            color: "#ffffff"
            text: qsTr("Files")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: fixedFont.font.family
            font.pointSize: 9
            //            visible: false

            background: Rectangle {
                color: "#4891d9"
                radius: 10
            }

            Label {
                id: traceNumberLabel
                x: 222
                y: 0
                width: 85
                height: 26
                color: "#ffffff"
                text: qsTr("Trace Number")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: fixedFont.font.family
                font.pointSize: 9
                background: Rectangle {
                    color: "#4891d9"
                    radius: 10
                }
            }

            Label {
                id: excludedTracesLabel
                x: 332
                y: 0
                width: 101
                height: 26
                color: "#ffffff"
                text: qsTr("Excluded Traces")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: fixedFont.font.family
                font.pointSize: 9
                background: Rectangle {
                    color: "#4891d9"
                    radius: 10
                }
            }

            Label {
                id: drugNameLabel
                x: 105
                y: 0
                width: 85
                height: 26
                color: "#ffffff"
                text: qsTr("Drug Name")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: fixedFont.font.family
                font.pointSize: 9
                background: Rectangle {
                    color: "#4891d9"
                    radius: 10
                }
            }
        }

        Connections {
            target: backend
            function onGoClearFileLabels() {
                filesLabel.visible = false
            }
            function onShowFileLabels() {
                filesLabel.visible = true
            }
        }
    }

}
