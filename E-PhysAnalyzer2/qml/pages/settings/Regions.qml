import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/buttons"
import "../../controls/custom"
import "../../controls"
import "../../javascript/region.js" as Region
import "../../javascript/graph-settings.js" as GraphSettings

Rectangle {
    id: regions
    width: 230
    height: 518
    color: "#00000000"

    property var regionObjects: []
    property var objectsToMove: []
    property var currentRegionObject: []
    property int currentRegionY : 0
    property int regionAxis: 5
    property string chosenRegionColor: "#FF0000"
    property string chosenRegionColorName: "#FF0000"

    signal emitRegionErrorMessage(string msg) // Sends this to NewRegion.qml
    signal emitSerializedObjects1(var objects, int axis)
    signal emitSerializedObjects2(var objects, int axis)
    signal emitSerializedObjects3(var objects, int axis)

    property var serializedObjects: []

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
        height: 29
        opacity: 1
        color: "#02323a"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 0
        Rectangle {
            id: regionsTopBarBottom
            height: 18
            opacity: 1
            color: "#02323a"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 11
            z: 0
            anchors.rightMargin: 0
        }

        Label {
            id: regionsLabel
            width: 195
            height: 14
            color: "#ffffff"
            text: qsTr("Regions")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "PragmaticaLightC"
        }
        anchors.rightMargin: 0
    }

    Rectangle {
        id: regionsDropShadow
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
        clip: true
        anchors.topMargin: 2
        anchors.leftMargin: 2
        anchors.rightMargin: -2
        anchors.bottomMargin: 2
        z: -4
    }

    Rectangle {
        id: regionsBg
        x: 0
        height: 496
        color: "#ffffff"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: regionsTopBar.bottom
        anchors.topMargin: -10
        anchors.leftMargin: 0
        Rectangle {
            id: regionsBg1
            visible: true
            color: backgroundColor
            radius: 10
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
        anchors.bottomMargin: 45
        anchors.topMargin: 0
        contentHeight: 444
        ScrollBar.vertical: CustomScrollBar {
            width: 10
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
        y: 480
        width: 78
        height: 20
        text: "Reset"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
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
    D{i:0;formeditorZoom:0.9}D{i:12}D{i:13}
}
##^##*/
