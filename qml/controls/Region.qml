import QtQuick 2.15
import QtQuick.Controls 2.5
import "buttons"
import "../javascript/region.js" as Region

Item {
    id: region
    width: 200 * scaleFactor
    height: 19 * scaleFactor
    property string greaterThanEqualToText: "-10"
    property string lessThanText: "-5"
    property string colorSelected: "Red"
    property int regionNumber: 0
    property var regionObjectsSlice: []
    property color chosenRegionColor: colorPicker.chosenColor
    property color colorName: colorPicker.chosenColorName


    Rectangle {
    id: regionBg
    width: region.width
    height: region.height
    color: "#5ac1d0"
    radius: 5 * scaleFactor

        Label {
        id: greaterThanEqualTo
        x: 35 * scaleFactor
        color: "#ffffff"
        text: greaterThanEqualToText
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 9 * scaleFactor
        font.family: "PragmaticaLightC"
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: gTeTLabel
        x: 68 * scaleFactor
        color: "#ffffff"
        text: String.fromCharCode(0x2264)
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        font.pointSize: 9 * scaleFactor
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: xLabel
        x: 84 * scaleFactor
        width: 8 * scaleFactor
        height: 14 * scaleFactor
        color: "#ffffff"
        text: qsTr("min.")
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        font.pointSize: 9 * scaleFactor
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: lTLabel
        color: "#ffffff"
        text: qsTr("<")
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        anchors.horizontalCenterOffset: 21 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 9 * scaleFactor
        anchors.verticalCenterOffset: 0
        }

        Label {
            id: lessThan
            color: "#ffffff"
            text: lessThanText
            anchors.verticalCenter: parent.verticalCenter
            font.family: "PragmaticaLightC"
            anchors.horizontalCenterOffset: 42 * scaleFactor
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 9 * scaleFactor
            anchors.verticalCenterOffset: 0
        }

        ColorPicker {
            id: colorPicker
            x: 167 * scaleFactor
            y: 2 * scaleFactor
            width: 15 * scaleFactor
            height: 15 * scaleFactor
            colorPickerAxis: -75 * scaleFactor
            chosenColor: chosenRegionColor
            onChosenColorChanged: chosenRegionColor = colorPicker.chosenColor
        }

        Delete {
            id: circle
            width: 12 * scaleFactor
            height: 12 * scaleFactor
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10 * scaleFactor
            onClicked: Region.deleteRegion(regionNumber)
        }
    }
}
