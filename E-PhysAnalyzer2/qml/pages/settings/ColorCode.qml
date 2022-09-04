import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
id: colorCodeSection
height: 131
color: "#ffffff"
radius: 10
gradient: Gradient {
GradientStop {
position: 0
color: "#4089f7fe"
}

    GradientStop {
    position: 1
    color: "#4066a6ff"
    }
    orientation: Gradient.Vertical
    }
    z: -1

    CustomCheckBoxLabel {
    id: colorCode
    x: -191
    y: 14
    width: 100
    height: 26
    text: "Color code"
    anchors.horizontalCenter: parent.horizontalCenter
    clip: false
    font.family: "PragmaticaLightC"
    }

    CustomComboBox {
    id: graphQuality
    x: -186
    y: 70
    anchors.horizontalCenter: parent.horizontalCenter
    currentIndex: 1
    model: ["Low", "Medium", "High", "Ultra", "Custom"]
    }

    Label {
    id: graphQualityLabel
    y: 49
    width: 75
    height: 16
    color: "#087589"
    text: qsTr("Graph Quality")
    anchors.bottom: graphQuality.top
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottomMargin: 5
    font.family: "PragmaticaLightC"
    }

    CustomTextField {
    id: dpiEntry
    x: 44
    y: 103
    width: 53
    height: 20
    visible: graphQuality.currentIndex === 4
    Label {
    id: dpiLabel
    width: 25
    height: 14
    color: "#087589"
    text: qsTr("DPI")
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    anchors.leftMargin: 69
    anchors.verticalCenterOffset: 0
    font.family: "PragmaticaLightC"
    }
    }

    Rectangle {
    id: ccDropShadow
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
    anchors.topMargin: 2
    anchors.rightMargin: -2
    anchors.bottomMargin: -2
    anchors.leftMargin: 2
    z: -3
    clip: true
    }

    Rectangle {
    id: ccBg
    color: backgroundColor
    radius: 10
    anchors.fill: parent
    z: -2
    }
}
