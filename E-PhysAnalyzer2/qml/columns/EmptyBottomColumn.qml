import QtQuick 2.0
import QtQuick.Controls 6.2
import "../controls/buttons"

Item {
    id: emptyBottomColumn

    property bool columnCollapsed: false
    property var columnHeight: emptyBottomColumn.height
    property var columnBottomAnchor: emptyBottomColumn.bottom

    function collapseColumn () {
        if(columnCollapsed === false) {
            columnHeight = 29
            column.anchors.bottom = undefined
            bottomColumnCollapseAnimation.running = true
            columnCollapsed = true
        } else {
            columnHeight = emptyBottomColumn.height
             bottomColumnCollapseAnimation.running = true
            bottomColumnAnchorsAnimation.running = true
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
        height: columnHeight
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: columnBottomAnchor
        anchors.top: parent.top
        clip: true

        PropertyAnimation {
            id: bottomColumnAnchorsAnimation
            target: column
            property: "anchors.bottom"
            easing.type: Easing.InOutQuint
            duration: 500
            to: if(column.anchors.bottom === columnBottomAnchor) return undefined; else return columnBottomAnchor
        }

        PropertyAnimation {
            id: bottomColumnCollapseAnimation
            target: column
            property: "height"
            easing.type: Easing.InOutQuint
            duration: 500
            to: {if(column.height !== 29) return 29; else return columnHeight}
        }

        Rectangle {
            id: bottomColumnBgBorder
            color: "#00000000"
            radius: 10
            border.color: "#5ac1d0"
            border.width: 1
            anchors.fill: parent

            CustomButton {
                id: addToQueueButton
                x: 607
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



        CustomButton {
            id: runButton
            width: 74
            height: 24
            text: "Run"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 8
            anchors.topMargin: 216
            font.pointSize: 10
            font.weight: Font.DemiBold
        }
    }


    MouseArea {
        id: columnCollapseArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: columnUnderline.top
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        onClicked: collapseColumn()
        anchors.topMargin: 0
        anchors.rightMargin: 0
    }

    Rectangle {
        id: columnUnderline
        x: 1
        y: 29
        height: 1
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 1
        z: 0
        anchors.rightMargin: -1
    }


    Label {
        id: columnText
        x: 328
        y: 0
        color: "#ffffff"
        text: qsTr("EMPTY BOTTOM COLUMN")
        anchors.bottom: columnUnderline.top
        font.letterSpacing: 2
        font.family: fixedFont.font.family
        font.weight: Font.ExtraBold
        z: 2
        anchors.bottomMargin: 5
        anchors.horizontalCenterOffset: 0
        clip: false
        anchors.horizontalCenter: parent.horizontalCenter
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:246;width:789}
}
##^##*/
