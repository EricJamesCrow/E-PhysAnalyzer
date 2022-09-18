import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/buttons"
import "../../controls/custom"
import "../../controls"
import "../../javascript/region.js" as Region
import "../../javascript/graph-settings.js" as GraphSettings
import "../../javascript/settings.js" as Settings
import "../../javascript/run-analysis.js" as Analysis
import "../../javascript/startup.js" as Startup

Rectangle {
    id: regions
    width: 230 * scaleFactor
    height: 518 * scaleFactor
    color: "#00000000"

    property var regionObjects: []
    property var objectsToMove: []
    property var currentRegionObject: []
    property int currentRegionY : 0
    property int regionAxis: 5 * scaleFactor
    property string chosenRegionColor: "#FF0000"
    property string chosenRegionColorName: "#FF0000"

    signal emitRegionErrorMessage(string msg, string region) // Sends this to NewRegion.qml
    signal emitSerializedObjects1(var objects, int axis)
    signal emitSerializedObjects2(var objects, int axis)
    signal emitSerializedObjects3(var objects, int axis)

    property var serializedObjects: []

    Connections {
        target: mainWindow
        function onAdjustHeight(scale) {
            Settings.adjustRegionHeight(scale)
        }
    }

    Connections {
        target: content
        function onGetRegions() {
            Analysis.runGrabRegions(regionObjects)
        }
    }

    Connections {
        target: backend
        function onStartupClearRegions() {
            resetRegionsBtn.focus = true
            Region.clearRegions()
            resetRegionsBtn.focus = false
        }
    }

    Connections {
        target: settingsPage1
        function onRunSerialization() {
            if(regionObjects.length === 0) {
                return emitSerializedObjects1([], 5)
            }
            GraphSettings.serialize()
            emitSerializedObjects1(serializedObjects, regionAxis)
        }
        function onRunDeserialization(objects1, axis) {
            GraphSettings.deserialize(objects1)
            regionAxis = axis
        }
    }

    Connections {
        target: settingsPage2
        function onRunSerialization() {
            if(regionObjects.length === 0) {
                return emitSerializedObjects2([], 5)
            }
            GraphSettings.serialize()
            emitSerializedObjects2(serializedObjects, regionAxis)
        }
        function onRunDeserialization(objects2, axis) {
            GraphSettings.deserialize(objects2)
            regionAxis = axis
        }
    }

    Connections {
        target: settingsPage3
        function onRunSerialization3() {
            if(regionObjects.length === 0) {
                return emitSerializedObjects3([], 5)
            }
            GraphSettings.serialize()
            emitSerializedObjects3(serializedObjects, regionAxis)
        }
        function onRunDeserialization3(objects3, axis) {
            GraphSettings.deserialize(objects3)
            regionAxis = axis
        }
    }

    Rectangle {
        id: regionsTopBar
        y: 0
        height: 29 * scaleFactor
        opacity: 1
        color: "#02323a"
        radius: 10 * scaleFactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 0
        Rectangle {
            id: regionsTopBarBottom
            height: 18 * scaleFactor
            opacity: 1
            color: "#02323a"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 11 * scaleFactor
            z: 0
            anchors.rightMargin: 0
        }

        Label {
            id: regionsLabel
            width: 195 * scaleFactor
            height: 14 * scaleFactor
            color: "#ffffff"
            text: qsTr("Regions")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 9 * scaleFactor
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "PragmaticaLightC"
        }
        anchors.rightMargin: 0
    }

    Rectangle {
        id: regionsDropShadow
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
        clip: true
        anchors.topMargin: 2 * scaleFactor
        anchors.leftMargin: 2 * scaleFactor
        anchors.rightMargin: -2 * scaleFactor
        anchors.bottomMargin: 2 * scaleFactor
        z: -4
    }

    Rectangle {
        id: regionsBg
        x: 0
        height: 496 * scaleFactor
        color: "#ffffff"
        radius: 10 * scaleFactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: regionsTopBar.bottom
        anchors.topMargin: -10 * scaleFactor
        anchors.leftMargin: 0
        Rectangle {
            id: regionsBg1
            visible: true
            color: backgroundColor
            radius: 10 * scaleFactor
            anchors.fill: parent
            z: -1
        }
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#7f89f7fe"
            }

            GradientStop {
                position: 1
                color: "#8066a6ff"
            }
            orientation: Gradient.Vertical
        }
        z: -1
        anchors.rightMargin: 0
    }

    Flickable {
        id: regionsFlickable
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: regionsTopBar.bottom
        anchors.bottom: parent.bottom
        clip: true
        anchors.bottomMargin: 45 * scaleFactor
        anchors.topMargin: 0
        contentHeight: 444 * scaleFactor
        ScrollBar.vertical: CustomScrollBar {
            width: 10 * scaleFactor
            opacity: 0
        }

        Rectangle {
            id: regionsLoader
            color: "#00000000"
            anchors.fill: parent
            clip: true
        }
    }

    CustomButton {
        id: resetRegionsBtn
        y: 480 * scaleFactor
        width: 78 * scaleFactor
        height: 20 * scaleFactor
        text: "Reset"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: Region.clearRegions()
    }

    Connections {
        target: newRegionBtn1 // Recieves the signal from NewRegion.qml
        function onNewRegion(greaterThan, lessThan, regionColor, regionColorName) {
            chosenRegionColor = regionColor
            chosenRegionColorName = regionColorName
            Region.createNewRegion(greaterThan, lessThan)
        }
    }

    Connections {
        target: generatePatternBnt
        function onGPclearRegions(){
            Region.clearRegions()
            chosenRegionColor = "#FF0000"
        }
    }

    Connections {
        target: backend
        function onNewRegion(greaterThan, lessThan) {
            Region.createNewRegion(greaterThan, lessThan)
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
