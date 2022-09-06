import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
id: postAnalysisSection
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
        id: postAnalysisLabel
        y: 8
        color: "#087589"
        text: qsTr("Post Analysis")
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "PragmaticaLightC"
        }

        CustomTextField {
        id: paXmin
        y: 34
        width: 95
        height: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 33
        placeholderText: "-Baseline"
        }

        CustomTextField {
        id: paXmax
        y: 60
        width: 95
        height: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 33
        placeholderText: "None"
        }

        CustomTextField {
        id: paYmin
        y: 86
        width: 95
        height: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 33
        placeholderText: "25"
        RegularExpressionValidator { regularExpression: /^-?\d+$/ }
        }

        CustomTextField {
        id: paYmax
        y: 112
        width: 95
        height: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 33
        placeholderText: "225"
        RegularExpressionValidator { regularExpression: /^-?\d+$/ }
        }

        Label {
        id: xMinLabel
        x: 18
        color: "#087589"
        text: qsTr("X-Min.")
        anchors.verticalCenter: paXmin.verticalCenter
        anchors.right: paXmin.left
        anchors.rightMargin: 17
        anchors.verticalCenterOffset: 0
        font.family: "PragmaticaLightC"
        }

        Label {
        id: xMaxLabel
        x: 18
        width: 39
        height: 14
        color: "#087589"
        text: qsTr("X-Max.")
        anchors.verticalCenter: paXmax.verticalCenter
        anchors.right: paXmax.left
        anchors.rightMargin: 17
        anchors.verticalCenterOffset: 0
        font.family: "PragmaticaLightC"
        }

        Label {
        id: yMinLabel
        x: 19
        color: "#087589"
        text: qsTr("Y-Min.")
        anchors.verticalCenter: paYmin.verticalCenter
        anchors.right: paYmin.left
        anchors.rightMargin: 17
        anchors.verticalCenterOffset: 0
        font.family: "PragmaticaLightC"
        }

        Label {
        id: yMaxLabel
        x: 16
        color: "#087589"
        text: qsTr("Y-Max.")
        anchors.verticalCenter: paYmax.verticalCenter
        anchors.right: paYmax.left
        anchors.rightMargin: 17
        anchors.verticalCenterOffset: 0
        font.family: "PragmaticaLightC"
        }

        Rectangle {
        id: paDropShadow
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
        id: paBg
        color: backgroundColor
        radius: 10
        anchors.fill: parent
        z: -2
        }
}
