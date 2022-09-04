import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../controls/buttons"
import "../../controls/custom"
import "../../controls"
import "../../javascript/new-region.js" as NewRegion

Rectangle {
    id: regions
    //x: 26
    //y: 61
    width: 230
    height: 518
    color: "#00000000"

    property var regionObjects: []
    property int regionAxis: 5

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
        onClicked: NewRegion.clearRegions()
    }

    Connections {
        target: newRegionBtn1
        function onNewRegion(greaterThan, lessThan) {
            NewRegion.newRegion(greaterThan, lessThan)
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:12}D{i:13}
}
##^##*/
