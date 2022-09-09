import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
id: zScoreSection
height: 91
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
    id: removeOutliers
    y: 11
    width: 150
    height: 26
    text: "Remove Outliers"
    anchors.horizontalCenter: parent.horizontalCenter
    clip: false
    }

    CustomTextField {
    id: zScoreEntry
    x: 101
    y: 57
    width: 38
    height: 20
    placeholderText: "2.5"
    validator: RegularExpressionValidator { regularExpression: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/ }
    }

    Label {
    id: zScoreLabel
    x: 31
    width: 59
    height: 16
    color: "#087589"
    text: qsTr("Z-Score >")
    anchors.verticalCenter: zScoreEntry.verticalCenter
    anchors.right: zScoreEntry.left
    font.bold: true
    anchors.rightMargin: 5
    }

    Rectangle {
    id: zScoreDropShadow
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
    id: zScoreBg
    color: backgroundColor
    radius: 10
    anchors.fill: parent
    z: -2
    }
}
