import QtQuick 2.0
import QtQuick.Controls 6.2

Item {
    width: 499
    height: 366
    property int flickableContentHeight : 496
    property real scrollBar: ScrollBar.AsNeeded

    ScrollView {
        id: scrollView
        anchors.fill: parent

        Flickable {
            id: flickable
            width: parent.width
            contentHeight: flickableContentHeight
            ScrollBar.vertical: ScrollBar {
                id: theScrollBar
                hoverEnabled: true
                active: hovered || pressed
                policy: scrollBar
                parent: flickable.parent
                anchors.top: flickable.top
                anchors.left: flickable.right
                anchors.bottom: flickable.bottom
            }

            Rectangle {
                id: bg
                color: "#2c313c"
                anchors.fill: parent

                Image {
                    id: image
                    x: -50
                    y: 0
                    width: 599
                    height: 496
                    source: "../../images/available_colors.png"
                    fillMode: Image.PreserveAspectFit
                }

            }
        }
    }

    Connections {
        target: backend
        function onSetColorsBar(num) {
            flickableContentHeight = num
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:5}D{i:4}D{i:2}D{i:1}D{i:6}
}
##^##*/
