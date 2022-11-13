import QtQuick 2.15
import QtQuick.Controls 2.15
//import Qt5Compat.GraphicalEffects

Button{
    id: btnSettings
    // CUSTOM PROPERTIES
    property color btnColorDefault: "#02323a"
    property color btnColorMouseOver: settings.menuDropDownMouseOverColor
    property color btnColorClicked: "#00a1f1"
    property color activeMenuColor: "#55aaff"
    property bool isActiveMenu: false
    property bool isNotActiveMenu: true

    down: false
    flat: true

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: (btnSettings.hovered || (btnSettings.focus == true)) ? btnColorMouseOver : btnColorDefault

    }

    FontLoader {
        id: fixedFont
        source: "../../fonts/Segoe UI.ttf"
//        source:"../fonts/LDFComicSans.ttf"
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
            height: 3 * scaleFactor
            visible: isActiveMenu
        }


    }

    contentItem: Item {
        anchors.fill: parent
        id: content

        Text{
            width: 62 * scaleFactor
            height: 22 * scaleFactor
            color: activeMenuColor
            text: btnSettings.text
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 15 * scaleFactor
            anchors.verticalCenterOffset: 0
            font.family: fixedFont.font.family
            font.pointSize: 11 * scaleFactor
            visible: isActiveMenu
        }

        Text{
            color: "#ffffff"
            text: btnSettings.text
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 15 * scaleFactor
            anchors.verticalCenterOffset: 0
            font.family: fixedFont.font.family
            font.pointSize: 11 * scaleFactor
            visible: isNotActiveMenu
        }
    }

    implicitWidth: 175 * scaleFactor
    implicitHeight: 40 * scaleFactor
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:175}
}
##^##*/
