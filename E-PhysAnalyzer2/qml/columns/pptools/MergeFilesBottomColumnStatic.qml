import QtQuick 2.0
import QtQuick.Controls 6.2
import "../../controls/custom"
import "../../controls/buttons"

Item {
    id: emptyBottomColumn

    property bool columnCollapsed: false
    property var columnHeight: emptyBottomColumn.height
    property var columnBottomAnchor: emptyBottomColumn.bottom


    width: 789 * scaleFactor
    height: 246 * scaleFactor

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
        source: "../../fonts/Segoe UI.ttf"
    }

    FontLoader {
        id: pragmaticaFont
        source: "../../fonts/PT Pragmatica Book.ttf"
    }

    Rectangle {
        id: column
        color: columnColor
        radius: 10
        //        height: columnHeight
        height: 246 * scaleFactor// have to set height when editing in Qt Creator
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
            duration: 325
            to: if(column.anchors.bottom === columnBottomAnchor) return undefined; else return columnBottomAnchor
        }

        PropertyAnimation {
            id: bottomColumnCollapseAnimation
            target: column
            property: "height"
            easing.type: Easing.InOutQuint
            duration: 325
            to: {if(column.height !== 29 * scaleFactor) return 29 * scaleFactor; else return 246 * scaleFactor}
        }

        Rectangle {
            id: bottomColumnBgBorder
            color: "#00000000"
            radius: 10
            border.color: columnColor
            border.width: 1
            anchors.fill: parent

            CustomButton {
                id: addToQueueButton
                x: 607 * scaleFactor
                width: 89 * scaleFactor
                text: qsTr("Add to Queue")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 217 * scaleFactor
                anchors.bottomMargin: 5 * scaleFactor
                anchors.rightMargin: 91 * scaleFactor
                font.pointSize: 9 * scaleFactor
            }

            CustomButton {
                id: runButton
                x: 707 * scaleFactor
                width: 74 * scaleFactor
                text: "Run"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.family: "PragmaticaLightC"
                anchors.topMargin: 217 * scaleFactor
                anchors.bottomMargin: 5 * scaleFactor
                anchors.rightMargin: 8 * scaleFactor
                font.pointSize: 9 * scaleFactor
                font.weight: Font.DemiBold
            }
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
        y: 29 * scaleFactor
        height: 1
        color: backgroundColor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 1
        z: 0
        anchors.rightMargin: -1
    }


    Label {
        id: columnText
        x: 328 * scaleFactor
        y: 0
        color: "#ffffff"
        text: qsTr("EMPTY BOTTOM COLUMN")
        anchors.bottom: columnUnderline.top
        font.letterSpacing: 2 * scaleFactor
        font.family: fixedFont.font.family
        font.weight: Font.ExtraBold
        font.pointSize: 9 * scaleFactor
        z: 2
        anchors.bottomMargin: 5 * scaleFactor
        anchors.horizontalCenterOffset: 0
        clip: false
        anchors.horizontalCenter: parent.horizontalCenter
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5;height:246;width:789}
}
##^##*/
