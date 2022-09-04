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
    y: 48
    width: 137
    height: 20
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: "Baseline color"
    }

    CustomTextField {
    id: baselineValue
    y: 94
    width: 136
    height: 20
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: "Baseline value: 10"
    }

    Label {
    id: baselineTimeLabel
    y: 74
    color: "#087589"
    text: qsTr("Baseline time (min)")
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: 0
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
}
