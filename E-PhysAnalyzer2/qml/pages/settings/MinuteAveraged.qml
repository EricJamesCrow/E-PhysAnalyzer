import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
    // Properties
    property string xmin: maXmin.text
    property string xmax: maXmax.text
    property string ymin: maYmin.text
    property string ymax: maYmax.text

    Connections {
        target: settingsPage1
        function onMinuteAveragedSettings(xmin, xmax, ymin, ymax) {
            if(xmin !== "") {
                    maXmin.text = xmin
            }
            if(xmax !== "") {
                    maXmax.text = xmax
            }
            if(ymin !== "") {
                    maYmin.text = ymin
            }
            if(ymax !== "") {
                    maYmax.text = ymax
            }
        }
        function onReset() {
            maXmin.text = ""
            maXmax.text = ""
            maYmin.text = ""
            maYmax.text = ""
        }
        }

    Connections {
        target: settingsPage2
        function onMinuteAveragedSettings(xmin, xmax, ymin, ymax) {
            if(xmin !== "") {
                    maXmin.text = xmin
            }
            if(xmax !== "") {
                    maXmax.text = xmax
            }
            if(ymin !== "") {
                    maYmin.text = ymin
            }
            if(ymax !== "") {
                    maYmax.text = ymax
            }
        }
        function onReset() {
            maXmin.text = ""
            maXmax.text = ""
            maYmin.text = ""
            maYmax.text = ""
        }
        }

    Connections {
        target: settingsPage3
        function onMinuteAveragedSettings(xmin, xmax, ymin, ymax) {
            if(xmin !== "") {
                    maXmin.text = xmin
            }
            if(xmax !== "") {
                    maXmax.text = xmax
            }
            if(ymin !== "") {
                    maYmin.text = ymin
            }
            if(ymax !== "") {
                    maYmax.text = ymax
            }
        }
        function onReset() {
            maXmin.text = ""
            maXmax.text = ""
            maYmin.text = ""
            maYmax.text = ""
        }
        }




id: minuteAveragedSection
width: 177 * scaleFactor
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
    id: minAvgLabel
    y: 8 * scaleFactor
    color: "#087589"
    text: qsTr("Minute Averaged")
    anchors.horizontalCenter: parent.horizontalCenter
    font.family: "PragmaticaLightC"
    font.pointSize: 9 * scaleFactor
    }

    CustomTextField {
    id: maXmin
    y: 34 * scaleFactor
    width: 95 * scaleFactor
    height: 20 * scaleFactor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: 33 * scaleFactor
    placeholderText: "-Baseline"
    validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
    }

    CustomTextField {
    id: maXmax
    y: 60 * scaleFactor
    width: 95 * scaleFactor
    height: 20 * scaleFactor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: 33 * scaleFactor
    placeholderText: "None"
    validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
    }

    CustomTextField {
    id: maYmin
    y: 86 * scaleFactor
    width: 95 * scaleFactor
    height: 20 * scaleFactor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: 33 * scaleFactor
    placeholderText: "25"
    validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
    }

    CustomTextField {
    id: maYmax
    y: 112 * scaleFactor
    width: 95 * scaleFactor
    height: 20 * scaleFactor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: 33 * scaleFactor
    placeholderText: "225"
    validator: RegularExpressionValidator { regularExpression: /^-?\d+$/ }
    }

    Label {
    id: xMinLabel1
    x: 16 * scaleFactor
    color: "#087589"
    text: qsTr("X-Min.")
    anchors.verticalCenter: maXmin.verticalCenter
    anchors.right: maXmin.left
    font.pointSize: 9 * scaleFactor
    anchors.rightMargin: 17 * scaleFactor
    anchors.verticalCenterOffset: 0
    font.family: "PragmaticaLightC"
    }

    Label {
    id: xMaxLabel1
    x: 16 * scaleFactor
    width: 39 * scaleFactor
    height: 14 * scaleFactor
    color: "#087589"
    text: qsTr("X-Max.")
    anchors.verticalCenter: maXmax.verticalCenter
    anchors.right: maXmax.left
    font.pointSize: 9 * scaleFactor
    anchors.rightMargin: 17 * scaleFactor
    anchors.verticalCenterOffset: 0
    font.family: "PragmaticaLightC"
    }

    Label {
    id: yMinLabel1
    x: 26 * scaleFactor
    color: "#087589"
    text: qsTr("Y-Min.")
    anchors.verticalCenter: maYmin.verticalCenter
    anchors.right: maYmin.left
    font.pointSize: 9 * scaleFactor
    anchors.rightMargin: 17 * scaleFactor
    anchors.verticalCenterOffset: 0
    font.family: "PragmaticaLightC"
    }

    Label {
    id: yMaxLabel1
    x: 26 * scaleFactor
    color: "#087589"
    text: qsTr("Y-Max.")
    anchors.verticalCenter: maYmax.verticalCenter
    anchors.right: maYmax.left
    font.pointSize: 9 * scaleFactor
    anchors.rightMargin: 17 * scaleFactor
    anchors.verticalCenterOffset: 0
    font.family: "PragmaticaLightC"
    }

    Rectangle {
    id: maDropShadow
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
    id: maBg
    color: backgroundColor
    radius: 10 * scaleFactor
    anchors.fill: parent
    z: -2
    }
}
