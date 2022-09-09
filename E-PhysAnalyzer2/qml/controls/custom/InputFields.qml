import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.5

Rectangle {

    property string file: ""

    id: objectBg
    height: 35
    color: columnColor
    radius: 5
    border.color: topBarColor
    border.width: 0

    Label {
        id: fileName
        width: 195
        height: 22
        color: "#f9f9f9"
        clip: true
        text: file
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 5
        font.pointSize: 10
        anchors.verticalCenterOffset: 0
            }

    CustomTextField {
        id: drugName
        x: 213
        width: 128
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
                    }

    CustomTextField {
        id: traceNumber
        x: 405
        width: 128
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        validator: RegularExpressionValidator { regularExpression: /^[0-9]+$/ }
                    }

    CustomTextField {
        id: excludedTraces
        x: 574
        width: 230
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenterOffset: 0
        validator: RegularExpressionValidator { regularExpression: /^[,0-9]+$/ }
                    }
}
