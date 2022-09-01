import QtQuick 2.0
import QtQuick.Controls 6.2
import "../controls/buttons"

Item {
    id: emptyMiddleColumn
    onHeightChanged: if(columnCollapsed === false && programFinishedLaunching) {
                        column.height = currentMiddleColumnHeight
                    } else if (programFinishedLaunching) {
                         column.height = 29
                     }

    property var currentMiddleColumnHeight: emptyMiddleColumn.height
    property bool columnCollapsed: false
    property var columnBottomAnchor: emptyMiddleColumn.bottom
    property bool programFinishedLaunching: false

    function collapseMiddleColumn () {
        programFinishedLaunching = true
        if(columnCollapsed === false) {
        middleColumnCollapseAnimation.running = true
        backend.send_collapsing_data("middleColumnCollapsed")
        columnCollapsed = true
        } else {
            middleColumnCollapseAnimation.running = true
            backend.send_collapsing_data("middleColumnCollapsed")
            columnCollapsed = false
        }
    }

    FontLoader {
        id: fixedFont
        source: "../fonts/Segoe UI.ttf"
    }

    Rectangle {
        id: column
        color: "#5ac1d0"
        radius: 10
//        height: currentMiddleColumnHeight
        height: 248
        anchors.left: parent.left
        anchors.right: parent.right
        clip: true

        PropertyAnimation {
            id: middleColumnCollapseAnimation
            target: column
            property: "height"
            easing.type: Easing.InOutQuint
            duration: 500
            to: {if(column.height !== 29) return 29; else return currentMiddleColumnHeight}
        }

        MouseArea {
            id: middleColumnCollapseMouseArea
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: middleColumnUnderline.top
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            onClicked: collapseMiddleColumn()
            anchors.topMargin: 0
            anchors.rightMargin: 0
        }

        Rectangle {
            id: middleColumnUnderline
            y: 29
            height: 1
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 1
            z: 0
            anchors.rightMargin: -1
        }

        Rectangle {
            id: middleColumnBgBorder
            color: "#00000000"
            radius: 10
            border.color: "#5ac1d0"
            border.width: 1
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            CustomButton {
                id: addToQueueButton
                x: 609
                width: 89
                height: 24
                text: qsTr("Add to Queue")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 91
                font.pointSize: 10
                anchors.topMargin: 216
            }
        }

        Label {
            id: contextLogoText
            color: "#ffffff"
            text: qsTr("EMPTY MIDDLE COLUMN")
            anchors.bottom: middleColumnUnderline.top
            font.letterSpacing: 2
            font.family: fixedFont.font.family
            font.weight: Font.ExtraBold
            z: 2
            anchors.bottomMargin: 5
            anchors.horizontalCenterOffset: 0
            clip: false
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomRunButton {
            id: submitButton
            x: 692
            width: 74
            height: 24
            text: "Run"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 8
            anchors.topMargin: 216
            font.pointSize: 10
            font.family: fixedFont.font.family
            font.weight: Font.DemiBold
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:246;width:789}
}
##^##*/
