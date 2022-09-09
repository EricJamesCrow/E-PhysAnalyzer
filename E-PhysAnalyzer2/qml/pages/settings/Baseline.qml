import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
id: baselineSection
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
    id: displayBaseline
    y: 13
    width: 137
    height: 26
    text: "Display Baseline"
    anchors.horizontalCenter: parent.horizontalCenter
    clip: false
    font.family: "PragmaticaLightC"
    }

    CustomTextField {
    id: baselineColor
    width: 46
    height: 20
    anchors.verticalCenter: baselineValueLabel.verticalCenter
    anchors.verticalCenterOffset: 0
    font.pointSize: 8
    anchors.horizontalCenterOffset: 45
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: "gray"
    }

    CustomTextField {
    id: baselineValue
    width: 46
    height: 20
    anchors.verticalCenter: baselineTimeLabel.verticalCenter
    anchors.verticalCenterOffset: 0
    anchors.horizontalCenterOffset: 45
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: "10"
    validator: IntValidator {bottom: 1; top: 100}
    }

    Label {
    id: baselineTimeLabel
    y: 90
    color: "#087589"
    text: qsTr("Baseline time (min):")
    font.pointSize: 7
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: -26
    font.family: "PragmaticaLightC"
    }

    Rectangle {
    id: baselineDropShadow
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
        id: baselineBg
        color: backgroundColor
        radius: 10
        anchors.fill: parent
        z: -2
    }

    Label {
        id: baselineValueLabel
        y: 50
        color: "#087589"
        text: qsTr("Baseline value:")
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "PragmaticaLightC"
        anchors.horizontalCenterOffset: -25
        font.pointSize: 8
    }
}
