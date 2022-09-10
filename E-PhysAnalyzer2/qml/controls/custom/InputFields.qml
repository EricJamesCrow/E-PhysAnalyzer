import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.5

Rectangle {

    property string file: ""

    id: objectBg
    height: 35 * scaleFactor
    color: columnColor
    radius: 5
    border.color: topBarColor
    border.width: 0

    Label {
        id: fileName
        width: 195 * scaleFactor
        height: 22 * scaleFactor
        color: "#f9f9f9"
        clip: true
        text: file
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 5 * scaleFactor
        font.pointSize: 10 * scaleFactor
        anchors.verticalCenterOffset: 0
            }

    CustomTextField {
        id: drugName
        x: 213 * scaleFactor
        width: 128 * scaleFactor
        height: 20 * scaleFactor
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
                    }

    CustomTextField {
        id: traceNumber
        x: 405 * scaleFactor
        width: 128 * scaleFactor
        height: 20 * scaleFactor
        anchors.verticalCenter: parent.verticalCenter
        validator: RegularExpressionValidator { regularExpression: /^[0-9]+$/ }
                    }

    CustomTextField {
        id: excludedTraces
        x: 574 * scaleFactor
        width: 230 * scaleFactor
        height: 20 * scaleFactor
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20 * scaleFactor
        anchors.verticalCenterOffset: 0
        validator: RegularExpressionValidator { regularExpression: /^[,0-9]+$/ }
                    }
}
