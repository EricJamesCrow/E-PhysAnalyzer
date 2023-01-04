import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
        // Properties
        property string xmin: paXmin.text
        property string xmax: paXmax.text
        property string ymin: paYmin.text
        property string ymax: paYmax.text

        Connections {
           target: settingsPage1
           function onPostAnalysisSettings(xmin, xmax, ymin, ymax) {
                if(xmin !== "") {
                        paXmin.text = xmin
                }
                if(xmax !== "") {
                        paXmax.text = xmax
                }
                if(ymin !== "") {
                        paYmin.text = ymin
                }
                if(ymax !== "") {
                        paYmax.text = ymax
                }
           }
        function onReset() {
            paXmin.text = ""
            paXmax.text = ""
            paYmin.text = ""
            paYmax.text = ""
        }
        }

        Connections {
           target: settingsPage2
           function onPostAnalysisSettings(xmin, xmax, ymin, ymax) {
                if(xmin !== "") {
                        paXmin.text = xmin
                }
                if(xmax !== "") {
                        paXmax.text = xmax
                }
                if(ymin !== "") {
                        paYmin.text = ymin
                }
                if(ymax !== "") {
                        paYmax.text = ymax
                }
           }
        function onReset() {
            paXmin.text = ""
            paXmax.text = ""
            paYmin.text = ""
            paYmax.text = ""
        }
        }

        Connections {
           target: settingsPage3
           function onPostAnalysisSettings(xmin, xmax, ymin, ymax) {
                if(xmin !== "") {
                        paXmin.text = xmin
                }
                if(xmax !== "") {
                        paXmax.text = xmax
                }
                if(ymin !== "") {
                        paYmin.text = ymin
                }
                if(ymax !== "") {
                        paYmax.text = ymax
                }
           }
        function onReset() {
            paXmin.text = ""
            paXmax.text = ""
            paYmin.text = ""
            paYmax.text = ""
        }
        }
id: postAnalysisSection
height: 140 * scaleFactor
color: "#4089f7fe"
radius: 10 * scaleFactor
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
        y: 8 * scaleFactor
        font.pointSize: 9 * scaleFactor
        color: "#087589"
        text: qsTr("Post Analysis")
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "PragmaticaLightC"
        }

        CustomTextField {
        id: paXmin
        y: 34 * scaleFactor
        width: 95 * scaleFactor
        height: 20 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 33 * scaleFactor
        placeholderText: "-Baseline"
        validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
        }

        CustomTextField {
        id: paXmax
        y: 60 * scaleFactor
        width: 95 * scaleFactor
        height: 20 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 33 * scaleFactor
        placeholderText: "None"
        validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
        }

        CustomTextField {
        id: paYmin
        y: 86 * scaleFactor
        width: 95 * scaleFactor
        height: 20 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 33 * scaleFactor
        placeholderText: "None"
        validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
        }

        CustomTextField {
        id: paYmax
        y: 112 * scaleFactor
        width: 95 * scaleFactor
        height: 20 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 33 * scaleFactor
        placeholderText: "None"
        validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
        }

        Label {
        id: xMinLabel
        x: 18 * scaleFactor
        color: "#087589"
        text: qsTr("X-Min.")
        anchors.verticalCenter: paXmin.verticalCenter
        anchors.right: paXmin.left
        font.pointSize: 9 * scaleFactor
        anchors.rightMargin: 17 * scaleFactor
        anchors.verticalCenterOffset: 0
        font.family: "PragmaticaLightC"
        }

        Label {
        id: xMaxLabel
        x: 18 * scaleFactor
        width: 39 * scaleFactor
        height: 14 * scaleFactor
        color: "#087589"
        text: qsTr("X-Max.")
        font.pointSize: 9 * scaleFactor
        anchors.verticalCenter: paXmax.verticalCenter
        anchors.right: paXmax.left
        anchors.rightMargin: 17 * scaleFactor
        anchors.verticalCenterOffset: 0
        font.family: "PragmaticaLightC"
        }

        Label {
        id: yMinLabel
        x: 19 * scaleFactor
        color: "#087589"
        text: qsTr("Y-Min.")
        font.pointSize: 9 * scaleFactor
        anchors.verticalCenter: paYmin.verticalCenter
        anchors.right: paYmin.left
        anchors.rightMargin: 17 * scaleFactor
        anchors.verticalCenterOffset: 0
        font.family: "PragmaticaLightC"
        }

        Label {
        id: yMaxLabel
        x: 16 * scaleFactor
        color: "#087589"
        text: qsTr("Y-Max.")
        font.pointSize: 9 * scaleFactor
        anchors.verticalCenter: paYmax.verticalCenter
        anchors.right: paYmax.left
        anchors.rightMargin: 17 * scaleFactor
        anchors.verticalCenterOffset: 0
        font.family: "PragmaticaLightC"
        }

        Rectangle {
        id: paDropShadow
        x: 2 * scaleFactor
        y: 2 * scaleFactor
        height: 740 * scaleFactor
        opacity: 0.25
        visible: true
        color: "#000000"
        radius: 10 * scaleFactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 2 * scaleFactor
        anchors.rightMargin: -2 * scaleFactor
        anchors.bottomMargin: -2 * scaleFactor
        anchors.leftMargin: 2 * scaleFactor
        z: -3
        clip: true
        }

        Rectangle {
        id: paBg
        color: backgroundColor
        radius: 10 * scaleFactor
        anchors.fill: parent
        z: -2
        }
}
