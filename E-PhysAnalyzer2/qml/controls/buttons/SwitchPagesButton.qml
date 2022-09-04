import QtQuick 2.15
import QtQuick.Controls 2.15
//import Qt5Compat.GraphicalEffects

Button{
    id: btnToggle
    // CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/menu_icon.svg"
    property color btnColorDefault: settings.buttonColorDefault
    property color btnColorMouseOver: settings.backgroundColor
    property color btnColorClicked: "#ffffff"
    property color fontColorDefault: "#ffffff"
    property color fontColorMouseOver: settings.buttonColorDefault
    property color fontColorPressed: settings.buttonColorDefault
    property bool checkedState: false
    width: 167 * scaleFactor
    height: 24 * scaleFactor

    hoverEnabled: true
    down: false
    flat: true

    function returnDefaultColor(){
        if(checkedState) {
            return settings.backgroundColor
        } else {
            return settings.buttonColorDefault
        }
    }

    function returnFontColor(){
        if(checkedState) {
            return settings.buttonColorDefault
        } else {
            return "#ffffff"
        }
    }

    FontLoader {
        id: fixedFont
        source: "../../fonts/Pragmatica Bold.ttf"
//        source:"../fonts/LDFComicSans.ttf"
    }


    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnToggle.down){
                                       btnToggle.down ? btnColorClicked : returnDefaultColor()
                                   }
                                   else {
                                       btnToggle.hovered ? btnColorMouseOver : returnDefaultColor()
                                   }

        property var dynamicFontColor: if(btnToggle.down){
                                           btnToggle.down ? fontColorPressed : returnFontColor()
                                       }else{
                                           btnToggle.hovered ? fontColorMouseOver : returnFontColor()
                                       }

    }

    text: qsTr("Button")
    contentItem: Item{


        Text {
            id: name
            text: btnToggle.text
            font.family: fixedFont.font.family
            color: internal.dynamicFontColor
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 9 *scaleFactor
            font.weight: Font.ExtraBold
            anchors.horizontalCenter: parent.horizontalCenter
            z: 1
        }
    }

    background: Rectangle {
        id: roundRect
        radius: 10
        color: internal.dynamicColor
      }

      Rectangle {
        id: squareRect
        color: internal.dynamicColor
        height: roundRect.radius
        anchors.bottom: roundRect.bottom
        anchors.left: roundRect.left
        anchors.right: roundRect.right
        z: -1
      }
    }




/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}
}
##^##*/
