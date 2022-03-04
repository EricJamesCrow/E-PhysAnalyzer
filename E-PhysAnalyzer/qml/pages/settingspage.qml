import QtQuick 2.0
import QtQuick.Controls 6.2
import "controls"

Item {
    id: item1
    width: 499
    height: 394
    clip: false
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent
        clip: false

        Rectangle {
            id: menu
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: true
            anchors.bottomMargin: 366
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            GraphsButton {
                id: graphsButton
                width: 175
                height: 28
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.horizontalCenterOffset: -92
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    graphsButton.isActiveMenu = true
                    graphsButton.isNotActiveMenu = false
                    colorsButton.isActiveMenu = false
                    colorsButton.isNotActiveMenu = true
                    pageLoader.push(Qt.resolvedUrl("graphSettings.qml"))
                }
            }

            ColorsButton {
                id: colorsButton
                width: 175
                height: 28
                anchors.left: graphsButton.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 0
                onClicked: {
                    graphsButton.isActiveMenu = false
                    graphsButton.isNotActiveMenu = true
                    colorsButton.isActiveMenu = true
                    colorsButton.isNotActiveMenu = false
                    pageLoader.push(Qt.resolvedUrl("ShowColors.qml"))
                    backend.gettingWindowMargins()
                }
            }

        }

        StackView {
            id: pageLoader
            width: 499
            height: 366
            anchors.top: menu.bottom
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            initialItem: Qt.resolvedUrl("graphSettings.qml")
            clip: true

        }

        Connections {
            target: backend
            function onSetGraphsStackView() {
                pageLoader.push(Qt.resolvedUrl("graphSettings.qml"))
            }
            function onSetColorsBar(num) {
                if (num === 303) {
                    menu.clip = false
                    pageLoader.clip = false
                } else {
                    menu.clip = true
                    pageLoader.clip = true
                }

            }
        }
    }

}
