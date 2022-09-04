import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
id: minuteAveragedSection
width: 177
height: 140
color: "#4089f7fe"
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

    Label {
    id: minAvgLabel
    y: 8
    color: "#087589"
    text: qsTr("Minute Averaged")
    anchors.horizontalCenter: parent.horizontalCenter
    font.family: "PragmaticaLightC"
    }

    CustomTextField {
    id: maXmin
    y: 34
    width: 95
    height: 20
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: 33
    placeholderText: "-Baseline"
    }

    CustomTextField {
    id: maXmax
    y: 60
    width: 95
    height: 20
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: 33
    placeholderText: "None"
    }

    CustomTextField {
    id: maYmin
    y: 86
    width: 95
    height: 20
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: 33
    placeholderText: "25"
    }

    CustomTextField {
    id: maYmax
    y: 112
    width: 95
    height: 20
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: 33
    placeholderText: "225"
    }

    Label {
    id: xMinLabel1
    x: 16
    color: "#087589"
    text: qsTr("X-Min.")
    anchors.verticalCenter: maXmin.verticalCenter
    anchors.right: maXmin.left
    anchors.rightMargin: 17
    anchors.verticalCenterOffset: 0
    font.family: "PragmaticaLightC"
    }

    Label {
    id: xMaxLabel1
    x: 16
    width: 39
    height: 14
    color: "#087589"
    text: qsTr("X-Max.")
    anchors.verticalCenter: maXmax.verticalCenter
    anchors.right: maXmax.left
    anchors.rightMargin: 17
    anchors.verticalCenterOffset: 0
    font.family: "PragmaticaLightC"
    }

    Label {
    id: yMinLabel1
    x: 26
    color: "#087589"
    text: qsTr("Y-Min.")
    anchors.verticalCenter: maYmin.verticalCenter
    anchors.right: maYmin.left
    anchors.rightMargin: 17
    anchors.verticalCenterOffset: 0
    font.family: "PragmaticaLightC"
    }

    Label {
    id: yMaxLabel1
    x: 26
    color: "#087589"
    text: qsTr("Y-Max.")
    anchors.verticalCenter: maYmax.verticalCenter
    anchors.right: maYmax.left
    anchors.rightMargin: 17
    anchors.verticalCenterOffset: 0
    font.family: "PragmaticaLightC"
    }

    Rectangle {
    id: maDropShadow
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
    id: maBg
    color: backgroundColor
    radius: 10
    anchors.fill: parent
    z: -2
    }
}
