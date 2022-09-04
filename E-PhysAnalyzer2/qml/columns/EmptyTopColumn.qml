import QtQuick 2.0
import QtQuick.Controls 6.2
import "../pages"
import "../controls/buttons"

Item {
    id: emptyTopColumn
    // Make sure the object inherit's the parent's height
    onHeightChanged: if(columnCollapsed === false && programFinishedLaunching) {
                         emptyTopColumn.height = columnHeight2
                     } else if(columnCollapsed === true && programFinishedLaunching) {
                         emptyTopColumn.height = 29
                     }
    //    width: 789
    //    height: 246

    property var columnHeight2: emptyTopColumn.height
    property bool columnCollapsed: false
    property var columnBottomAnchor: emptyTopColumn.bottom
    property bool programFinishedLaunching: false
    clip: false

    function collapseColumn () {
        programFinishedLaunching = true
        if(columnCollapsed === false) {
            backend.send_collapsing_data("topColumnCollapsed")
            topColumnCollapseAnimation.running = true
            columnCollapsed = true
        } else {
            topColumnCollapseAnimation.running = true
            backend.send_collapsing_data("topColumnCollapsed")
            columnCollapsed = false
        }
    }

    function expandHelpPage() {
        helpBtnExpandAnimationX.running = true
        helpBtnExpandAnimationWidth.running = true
        helpBtnExpandAnimationHeight.running = true
    }

    FontLoader {
        id: fixedFont
        source: "../fonts/Segoe UI.ttf"
    }

    Rectangle {
        id: topColumn
        //        height: columnHeight2
        height: 248
        visible: true
        color: "#5ac1d0"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        clip: true

        PropertyAnimation {
            id: topColumnCollapseAnimation
            target: topColumn
            property: "height"
            easing.type: Easing.InOutQuint
            duration: 500
            to: {if(topColumn.height !== 29) return 29; else return columnHeight2}
        }

        Rectangle {
            id: columnBgBorder
            color: "#00000000"
            radius: 10
            border.color: "#5ac1d0"
            border.width: 1
            anchors.fill: parent
            clip: true

            Label {
                id: filesSelectedLabel
                y: 62
                width: 82
                height: 16
                visible: false
                color: "#1926ba"
                text: qsTr("Files selected")
                anchors.left: parent.left
                anchors.leftMargin: 184
            }

            CustomButton {
                id: addToQueueButton
                x: 608
                width: 89
                height: 24
                text: qsTr("Add to Queue")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 91
                font.pointSize: 10
                anchors.topMargin: 216
            }


            CustomRunButton {
                id: runBtn
                x: 707
                y: 216
                width: 74
                height: 24
                text: "Run"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 8
                anchors.topMargin: 216
                font.weight: Font.DemiBold
                font.pointSize: 10
                font.family: fixedFont.font.family
            }


        }
    }

    MouseArea {
        id: topColumnCollapseMouseArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: columnUnderline.top
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        onClicked: collapseColumn ()
        anchors.topMargin: 0
        anchors.leftMargin: 0
    }

    Rectangle {
        id: columnUnderline
        x: 1
        y: 29
        height: 1
        color: "#b8e3ee"
        anchors.left: parent.left
        anchors.right: parent.right
        z: 0
        anchors.rightMargin: -1
        anchors.leftMargin: 1
    }


    Label {
        id: topColumnLogoText
        y: 8
        width: 56
        height: 16
        color: "#ffffff"
        text: qsTr("EMPTY TOP COLUMN")
        anchors.bottom: columnUnderline.top
        font.letterSpacing: 2
        anchors.horizontalCenterOffset: -47
        anchors.horizontalCenter: parent.horizontalCenter
        z: 2
        anchors.bottomMargin: 5
        font.weight: Font.ExtraBold
        clip: false
    }

    HelpButtonFull {
        id: helpBtn
        x: 602
        width: 179
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: columnUnderline.top
        anchors.bottomMargin: -217
        anchors.topMargin: 0
        anchors.rightMargin: 8
        //        onClicked: expandHelpPage()

        Rectangle {
            id: helpInfoPage
            x: 25
            y: 4
            width: 0
            height: 0
            visible: false
            color: "#ffffff"
            radius: 10
            clip: true
            z: 0

            PropertyAnimation {
                id: helpBtnExpandAnimationX
                target: helpInfoPage
                property: "x"
                easing.type: Easing.InOutQuint
                duration: 400
                to: {if(helpInfoPage.x !== -178) return -178; else return 25}
            }

            PropertyAnimation {
                id: helpBtnExpandAnimationWidth
                target: helpInfoPage
                property: "width"
                easing.type: Easing.InOutQuint
                duration: 400
                to: {if(helpInfoPage.width !== 198) return 198; else return 0}
            }

            PropertyAnimation {
                id: helpBtnExpandAnimationHeight
                target: helpInfoPage
                property: "height"
                easing.type: Easing.InOutQuint
                duration: 400
                to: {if(helpInfoPage.height !== 240) return 240; else return 0}
            }

            Rectangle {
                id: helpColumnUnderline
                x: 1
                y: 29
                height: 1
                color: "#5ac1d0"
                anchors.left: parent.left
                anchors.right: parent.right
                z: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
            }

            Label {
                id: helpInfoPageLabel
                y: 8
                width: 21
                height: 16
                color: "#5ac1d0"
                text: qsTr("Help")
                font.letterSpacing: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                id: helpInfoText
                color: "#5ac1d0"
                text: qsTr("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: helpColumnUnderline.bottom
                anchors.bottom: parent.bottom
                wrapMode: Text.WordWrap
                anchors.bottomMargin: 5
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 5
            }
        }


    }

    /*##^##
Designer {
    D{i:0;formeditorZoom:0.9;height:246;width:789}
}
##^##*/
}
