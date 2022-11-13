import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
    property string color: baselineColor.text
    property string time: baselineValue.text
    property bool display: displayBaseline.checked

    Connections {
        target: settingsPage1
        function onBaselineSettings(color, time, display) {
            console.log(`BASELINE: ${display}`)
            if(color !== "") {
                baselineColor.text = color
            }
            if(time !== "") {
                baselineValue.text = time
            }
            displayBaseline.checked = display
        }
        function onReset() {
            baselineColor.text = ""
            baselineValue.text = ""
            displayBaseline.checked = true
        }
    }

    Connections {
        target: settingsPage2
        function onBaselineSettings(color, time, display) {
            if(color !== "") {
                baselineColor.text = color
            }
            if(time !== "") {
                baselineValue.text = time
            }
            displayBaseline.checked = display
        }
        function onReset() {
            baselineColor.text = ""
            baselineValue.text = ""
            displayBaseline.checked = true
        }
    }

    Connections {
        target: settingsPage3
        function onBaselineSettings(color, time, display) {
            if(color !== "") {
                baselineColor.text = color
            }
            if(time !== "") {
                baselineValue.text = time
            }
            displayBaseline.checked = display
        }
        function onReset() {
            baselineColor.text = ""
            baselineValue.text = ""
            displayBaseline.checked = true
        }
    }
        
        
    id: baselineSection
    height: 131 * scaleFactor
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

    CustomSwitch {
    id: displayBaseline
    y: 13 * scaleFactor
    width: 137 * scaleFactor
    height: 26 * scaleFactor
    text: "Display Baseline"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: -7 * scaleFactor
    clip: false
    font.family: "PragmaticaLightC"
    font.pointSize: 8 * scaleFactor
    }

    CustomTextField {
    id: baselineColor
    width: 46 * scaleFactor
    height: 20 * scaleFactor
    anchors.verticalCenter: baselineValueLabel.verticalCenter
    anchors.verticalCenterOffset: 0
    font.pointSize: 8 * scaleFactor
    anchors.horizontalCenterOffset: 60 * scaleFactor
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: "gray"
    }

    CustomTextField {
    id: baselineValue
    width: 46 * scaleFactor
    height: 20 * scaleFactor
    anchors.verticalCenter: baselineTimeLabel.verticalCenter
    anchors.verticalCenterOffset: 0
    anchors.horizontalCenterOffset: 60 * scaleFactor
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: "10"
    validator: IntValidator {bottom: 1; top: 100}
    }

    Label {
    id: baselineTimeLabel
    y: 90 * scaleFactor
    color: "#087589"
    text: qsTr("Baseline time (min):")
    font.pointSize: 8 * scaleFactor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: -26 * scaleFactor
    font.family: "PragmaticaLightC"
    }

    Rectangle {
    id: baselineDropShadow
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
        id: baselineBg
        color: backgroundColor
        radius: 10 * scaleFactor
        anchors.fill: parent
        z: -2
    }

    Label {
        id: baselineValueLabel
        y: 50 * scaleFactor
        color: "#087589"
        text: qsTr("Baseline color:")
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "PragmaticaLightC"
        anchors.horizontalCenterOffset: -13 * scaleFactor
        font.pointSize: 8 * scaleFactor
    }
}
