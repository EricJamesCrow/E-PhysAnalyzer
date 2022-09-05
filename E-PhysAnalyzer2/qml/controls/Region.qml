import QtQuick 2.15
import QtQuick.Controls 2.5
import "buttons"
import "../javascript/new-region.js" as NewRegion

Item {
    id: region
    width: 200
    height: 19
    property string greaterThanEqualToText: "-10"
    property string lessThanText: "-5"
    property string colorSelected: "Red"
    property int regionNumber: 0
    property var regionObjectsSlice: []


    Rectangle {
    id: regionBg
    width: region.width
    height: region.height
    color: "#5ac1d0"
    radius: 5

        Label {
        id: greaterThanEqualTo
        x: 35
        color: "#ffffff"
        text: greaterThanEqualToText
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: gTeTLabel
        x: 68
        color: "#ffffff"
        text: String.fromCharCode(0x2264)
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: xLabel
        x: 96
        width: 8
        height: 14
        color: "#ffffff"
        text: qsTr("X")
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: lTLabel
        color: "#ffffff"
        text: qsTr("<")
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        anchors.horizontalCenterOffset: 21
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 0
        }

        Label {
            id: lessThan
            color: "#ffffff"
            text: lessThanText
            anchors.verticalCenter: parent.verticalCenter
            font.family: "PragmaticaLightC"
            anchors.horizontalCenterOffset: 42
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 0
        }

        Label {
            id: colorLabel
            x: 160
            color: "#f70808"
            text: colorSelected
            anchors.verticalCenter: parent.verticalCenter
            font.family: "PragmaticaLightC"
        }

        Delete {
            id: circle
            width: 12
            height: 12
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            onClicked: NewRegion.deleteRegion(regionNumber)
        }
    }
}
