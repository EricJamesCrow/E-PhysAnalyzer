import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/custom"

Rectangle {
    property bool single: colorCode.checkedState
    property int quality: graphQuality.currentIndex
    property string dpi: dpiEntry.text
    property string defaultColor: defaultColor.text

    Connections {
        target: settingsPage1
        function onGraphQualitySettings(single, quality, dpi, color) {
            colorCode.checkedState = single
            if(dpi !== "") {
                dpiEntry.text = dpi
            }
            if(color !== "") {
                defaultColor.text = color
            }
            graphQuality.currentIndex = quality
        }
        function onReset() {
            colorCode.checkedState = false
            graphQuality.currentIndex = 1
            dpiEntry.text = ""
            defaultColor.text = ""
        }
    }

    Connections {
        target: settingsPage2
        function onGraphQualitySettings(single, quality, dpi, color) {
            colorCode.checkedState = single
            if(dpi !== "") {
                dpiEntry.text = dpi
            }
            if(color !== "") {
                defaultColor.text = color
            }
            graphQuality.currentIndex = quality
        }
        function onReset() {
            colorCode.checkedState = false
            graphQuality.currentIndex = 1
            dpiEntry.text = ""
            defaultColor.text = ""
        }
    }

    Connections {
        target: settingsPage3
        function onGraphQualitySettings(single, quality, dpi, color) {
            colorCode.checkedState = single
            if(dpi !== "") {
                dpiEntry.text = dpi
            }
            if(color !== "") {
                defaultColor.text = color
            }
            graphQuality.currentIndex = quality
        }
        function onReset() {
            colorCode.checkedState = false
            graphQuality.currentIndex = 1
            dpiEntry.text = ""
            defaultColor.text = ""
        }
    }


    id: colorCodeSection
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
        id: colorCode
        x: -191
        y: 8
        width: 118
        height: 26
        text: "Single Color"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        clip: false
        font.family: "PragmaticaLightC"
    }

    CustomComboBox {
        id: graphQuality
        x: -186
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 83
        anchors.horizontalCenter: parent.horizontalCenter
        currentIndex: 1
        model: ["Low", "Medium", "High", "Ultra", "Custom"]
    }

    Label {
        id: graphQualityLabel
        y: 49
        width: 75
        height: 16
        color: "#087589"
        text: qsTr("Graph Quality")
        anchors.bottom: graphQuality.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 5
        font.family: "PragmaticaLightC"
    }

    CustomTextField {
        id: dpiEntry
        x: 44
        width: 53
        height: 20
        visible: graphQuality.currentIndex === 4
        anchors.top: graphQuality.bottom
        anchors.topMargin: 7
        validator: IntValidator {bottom: 1; top: 1000}
        Label {
            id: dpiLabel
            width: 25
            height: 14
            color: "#087589"
            text: qsTr("DPI")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 69
            anchors.verticalCenterOffset: 0
            font.family: "PragmaticaLightC"
        }
    }

    Rectangle {
        id: ccDropShadow
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
        id: ccBg
        color: backgroundColor
        radius: 10
        anchors.fill: parent
        z: -2
    }

    CustomTextField {
        id: defaultColor
        y: 42
        width: 52
        height: 15
        clip: true
        font.pointSize: 7
        placeholderText: "gray"
        anchors.horizontalCenterOffset: 19
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        id: defaultColorLabel
        x: -45
        y: 40
        width: 42
        height: 16
        color: "#087589"
        text: qsTr("Color:")
        anchors.verticalCenter: defaultColor.verticalCenter
        anchors.right: defaultColor.left
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: 0
        font.pointSize: 8
        anchors.rightMargin: 3
        font.family: "PragmaticaLightC"
    }
}
