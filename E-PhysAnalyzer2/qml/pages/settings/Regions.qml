import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/buttons"

Rectangle {
id: regions
//x: 26
//y: 61
width: 230
height: 518
color: "#00000000"

        Rectangle {
        id: regionsTopBar
        y: 0
        height: 29
        opacity: 1
        color: "#02323a"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 0
        Rectangle {
        id: regionsTopBarBottom
        height: 18
        opacity: 1
        color: "#02323a"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.topMargin: 11
        z: 0
        anchors.rightMargin: 0
        }

        Label {
        id: regionsLabel
        width: 195
        height: 14
        color: "#ffffff"
        text: qsTr("Regions")
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "PragmaticaLightC"
        }

        CustomButton {
        id: resetRegionsBtn
        x: 76
        y: 478
        width: 78
        height: 20
        text: "Reset"
        }

        Rectangle {
        id: region1
        x: 15
        y: 35
        width: 200
        height: 19
        color: "#5ac1d0"
        radius: 5
        Label {
        id: label
        x: 35
        color: "#ffffff"
        text: qsTr("-10")
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: label1
        x: 68
        color: "#ffffff"
        text: qsTr("<")
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: label2
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
        id: label3
        color: "#ffffff"
        text: qsTr("<")
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 21
        font.family: "PragmaticaLightC"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: label4
        color: "#ffffff"
        text: qsTr("-5")
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 42
        font.family: "PragmaticaLightC"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 0
        }

        Label {
        id: label5
        x: 160
        color: "#f70808"
        text: qsTr("Red")
        anchors.verticalCenter: parent.verticalCenter
        font.family: "PragmaticaLightC"
        }
        }
        anchors.rightMargin: 0
        }

        Rectangle {
        id: regionsDropShadow
        x: 2
        y: 2
        height: 740
        opacity: 0.25
        visible: true
        color: "#000000"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        anchors.topMargin: 2
        anchors.leftMargin: 2
        anchors.rightMargin: -2
        anchors.bottomMargin: 2
        z: -4
        }

        Rectangle {
        id: regionsBg
        x: 0
        height: 496
        color: "#ffffff"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: regionsTopBar.bottom
        anchors.topMargin: -10
        anchors.leftMargin: 0
        Rectangle {
        id: regionsBg1
        visible: true
        color: backgroundColor
        radius: 10
        anchors.fill: parent
        z: -1
        }
        gradient: Gradient {
        GradientStop {
        position: 0
        color: "#7f89f7fe"
        }

        GradientStop {
        position: 1
        color: "#8066a6ff"
        }
        orientation: Gradient.Vertical
        }
        z: -1
        anchors.rightMargin: 0
        }
}
