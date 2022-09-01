import QtQuick 2.15
import QtQuick.Controls 2.15
//import Qt5Compat.GraphicalEffects

Button{
    id: btnToggle
    // CUSTOM PROPERTIES
    property url btnIconSource: "../../../images/svg_images/settings_icon.svg"
    property color btnColorDefault: "#087589"
    property color btnColorMouseOver: "#b8e3ee"
    property color btnColorClicked: "#191818"
    property color fontColorDefault: "#ffffff"
    property color fontColorMouseOver: "#087589"
    property color fontColorPressed: "#087589"

    flat: true

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnToggle.down){
                                       btnToggle.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnToggle.hovered ? btnColorMouseOver : btnColorDefault
                                   }

        property var dynamicFontColor: if(btnToggle.down){
                                           btnToggle.down ? fontColorPressed : fontColorDefault
                                       }else{
                                           btnToggle.hovered ? fontColorMouseOver : fontColorDefault
                                       }

    }

    text: qsTr("Button")
    contentItem: Item{

        Image {
            id: iconBtn
            anchors.fill: parent
            source: btnIconSource
            anchors.leftMargin: -2
            anchors.topMargin: -2
            anchors.rightMargin: -2
            anchors.bottomMargin: -2
            fillMode: Image.PreserveAspectFit
        }
    }

    background: Rectangle{
        color: internal.dynamicColor
    }
    }






/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}D{i:3}
}
##^##*/
