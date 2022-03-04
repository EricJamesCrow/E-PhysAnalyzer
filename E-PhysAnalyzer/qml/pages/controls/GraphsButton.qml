import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Button{
    id: btnSettings
    // CUSTOM PROPERTIES
    property color btnColorDefault: "#2c313c"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"
    property color activeMenuColor: "#55aaff"
    property bool isActiveMenu: true
    property bool isNotActiveMenu: false
    flat: true

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnSettings.down){
                                       btnSettings.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnSettings.hovered ? btnColorDefault : btnColorDefault
                                   }

    }

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Rectangle{
            anchors{
                right: parent.right
                left: parent.left
                bottom: parent.bottom
            }
            color: activeMenuColor
            height: 3
            visible: isActiveMenu
        }


    }

    contentItem: Item {
        anchors.fill: parent
        id: content

        Text{
            color: activeMenuColor
            text: qsTr("Graphs")
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            visible: isActiveMenu
        }

        Text{
            color: "#c3cbdd"
            text: qsTr("Graphs")
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            visible: isNotActiveMenu
        }
    }

    implicitWidth: 175
    implicitHeight: 40
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:175}D{i:1}
}
##^##*/
