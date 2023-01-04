import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
    property bool single: colorCode.checked
    property int quality: graphQuality.currentIndex
    property string dpi: dpiEntry.text
    property string defaultColor: defaultColor.text

    Connections {
        target: settingsPage1
        function onGraphQualitySettings(single, quality, dpi, color) {
            colorCode.checked = single
            if(dpi !== "") {
                dpiEntry.text = dpi
            }
            if(color !== "") {
                defaultColor.text = color
            }
            graphQuality.currentIndex = quality
        }
        function onReset() {
            colorCode.checked = false
            graphQuality.currentIndex = 1
            dpiEntry.text = ""
            defaultColor.text = ""
        }
    }

    Connections {
        target: settingsPage2
        function onGraphQualitySettings(single, quality, dpi, color) {
            colorCode.checked = single
            if(dpi !== "") {
                dpiEntry.text = dpi
            }
            if(color !== "") {
                defaultColor.text = color
            }
            graphQuality.currentIndex = quality
        }
        function onReset() {
            colorCode.checked = false
            graphQuality.currentIndex = 1
            dpiEntry.text = ""
            defaultColor.text = ""
        }
    }

    Connections {
        target: settingsPage3
        function onGraphQualitySettings(single, quality, dpi, color) {
            colorCode.checked = single
            if(dpi !== "") {
                dpiEntry.text = dpi
            }
            if(color !== "") {
                defaultColor.text = color
            }
            graphQuality.currentIndex = quality
        }
        function onReset() {
            colorCode.checked = false
            graphQuality.currentIndex = 1
            dpiEntry.text = ""
            defaultColor.text = ""
        }
    }


    id: colorCodeSection
    height: 131 * scaleFactor
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
        id: colorCode
        x: -191 * scaleFactor
        y: 8 * scaleFactor
        width: 118 * scaleFactor
        height: 26 * scaleFactor
        text: "Single Color"
        anchors.horizontalCenterOffset: -5 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        clip: false
        font.family: "PragmaticaLightC"
        font.pointSize: 8 * scaleFactor
    }

    CustomComboBox {
        id: graphQuality
        x: -186 * scaleFactor
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 83 * scaleFactor
        font.pointSize: 9*scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        currentIndex: 1
        model: ["Low", "Medium", "High", "Ultra", "Custom"]
    }

    Label {
        id: graphQualityLabel
        y: 49 * scaleFactor
        width: 75 * scaleFactor
        height: 16 * scaleFactor
        font.pointSize: 9 * scaleFactor
        color: "#087589"
        text: qsTr("Graph Quality")
        anchors.bottom: graphQuality.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 2 * scaleFactor
        font.family: "PragmaticaLightC"
    }

    CustomTextField {
        id: dpiEntry
        x: 44 * scaleFactor
        width: 53 * scaleFactor
        height: 20 * scaleFactor
        visible: graphQuality.currentIndex === 4
        anchors.top: graphQuality.bottom
        anchors.topMargin: 7 * scaleFactor
        validator: IntValidator {bottom: 1; top: 1000}
        Label {
            id: dpiLabel
            width: 25 * scaleFactor
            height: 14 * scaleFactor
            color: "#087589"
            text: qsTr("DPI")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 69 * scaleFactor
            anchors.verticalCenterOffset: 0
            font.family: "PragmaticaLightC"
        }
    }

    Rectangle {
        id: ccDropShadow
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
        id: ccBg
        color: backgroundColor
        radius: 10 * scaleFactor
        anchors.fill: parent
        z: -2
    }

    CustomTextField {
        id: defaultColor
        y: 42 * scaleFactor
        width: 52 * scaleFactor
        height: 18 * scaleFactor
        font.pointSize: 7 * scaleFactor
        placeholderText: "gray"
        anchors.horizontalCenterOffset: 19 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        id: defaultColorLabel
        x: -45 * scaleFactor
        y: 40 * scaleFactor
        width: 42 * scaleFactor
        height: 16 * scaleFactor
        color: "#087589"
        text: qsTr("Color:")
        anchors.verticalCenter: defaultColor.verticalCenter
        anchors.right: defaultColor.left
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: 0
        font.pointSize: 8 * scaleFactor
        anchors.rightMargin: 3 * scaleFactor
        font.family: "PragmaticaLightC"
    }
}
