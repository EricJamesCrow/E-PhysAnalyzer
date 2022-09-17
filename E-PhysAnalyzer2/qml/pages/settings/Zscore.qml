import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
    property bool remove: removeOutliers.checked
    property string score: zScoreEntry.text


    Connections {
        target: settingsPage1
        function onZscoreSettings(remove, score) {
            removeOutliers.checked = remove
            if(score !== "") {
                zScoreEntry.text = score
            }
        }
        function onReset() {
            removeOutliers.checked = true
            zScoreEntry.text = ""
        }
    }
    Connections {
        target: settingsPage2
        function onZscoreSettings(remove, score) {
            removeOutliers.checked = remove
            if(score !== "") {
                zScoreEntry.text = score
            }
        }
        function onReset() {
            removeOutliers.checked = true
            zScoreEntry.text = ""
        }
    }
    Connections {
        target: settingsPage3
        function onZscoreSettings(remove, score) {
            removeOutliers.checked = remove
            if(score !== "") {
                zScoreEntry.text = score
            }
        }
        function onReset() {
            removeOutliers.checked = true
            zScoreEntry.text = ""
        }
    }
id: zScoreSection
height: 91 * scaleFactor
color: "#ffffff"
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
    id: removeOutliers
    y: 11 * scaleFactor
    width: 150 * scaleFactor
    height: 26 * scaleFactor
    text: "Remove Outliers"
    anchors.horizontalCenter: parent.horizontalCenter
    clip: false
    font.family: "PragmaticaLightC"
    font.pointSize: 8 * scaleFactor
    }

    CustomTextField {
    id: zScoreEntry
    x: 101 * scaleFactor
    y: 57 * scaleFactor
    width: 38 * scaleFactor
    height: 20 * scaleFactor
    placeholderText: "2.5"
    validator: RegularExpressionValidator { regularExpression: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/ }
    }

    Label {
    id: zScoreLabel
    x: 31 * scaleFactor
    width: 59 * scaleFactor
    height: 16 * scaleFactor
    font.pointSize: 9 * scaleFactor
    color: "#087589"
    text: qsTr("Z-Score >")
    anchors.verticalCenter: zScoreEntry.verticalCenter
    anchors.right: zScoreEntry.left
    font.bold: true
    anchors.rightMargin: 5 * scaleFactor
    }

    Rectangle {
    id: zScoreDropShadow
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
    id: zScoreBg
    color: backgroundColor
    radius: 10 * scaleFactor
    anchors.fill: parent
    z: -2
    }
}
