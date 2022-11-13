import QtQuick 2.0
import QtQuick.Controls 2.5
import "../../controls/buttons"
import "../../javascript/app.js" as App

Item {
    id: helpPage
    width: 396 * scaleFactor
    height: 660 * scaleFactor

    property url btnIconSource:"../../../images/svg_images/close_icon.svg"


    Rectangle {
        id: help
        x: 689 * scaleFactor
        y: 339 * scaleFactor
        visible: true
        color: settings.columnColor
        radius: 5 * scaleFactor
        border.color: settings.columnColor
        anchors.fill: parent
        z: 1

        Label {
            id: helpPageText
            width: 287 * scaleFactor
            height: 488 * scaleFactor
            color: "#ffffff"
            text: "Nascetur primis aliquam fringilla eros consectetuer lectus dis. Urna aliquam potenti curabitur. Tempus habitant arcu diam luctus donec commodo.\n\nGravida ridiculus fames, quis orci ridiculus tellus gravida penatibus adipiscing hymenaeos facilisi purus.\n\nVitae aliquet aliquet a. Scelerisque phasellus. Ornare varius ipsum sapien, ad luctus et volutpat sed tincidunt habitasse convallis."
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: helpTopBar
            height: 30 * scaleFactor
            color: settings.buttonColorDefault
            anchors.left: parent.left
            anchors.right: parent.right
            radius: 5 * scaleFactor
            anchors.top: parent.top

            Rectangle {
                id: helpTopBarBottom
                width: helpTopBar.width
                height: 12 * scaleFactor
                color: settings.buttonColorDefault
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
            }


            SettingsBtn {
                id: closeBtn
                x: 548 * scaleFactor
                width: 37 * scaleFactor
                height: 23 * scaleFactor
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 5 * scaleFactor
                onClicked: App.displayDropDownMenuPages("help")
                btnIconSource: "../../../images/svg_images/close_icon.svg"
                btnColorDefault: "#00000000"
            }

            Label {
                id: helpPageTitle
                x: 295 * scaleFactor
                width: 95 * scaleFactor
                height: 14 * scaleFactor
                color: "#ffffff"
                text: qsTr("HELP")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.top: parent.top
                font.letterSpacing: 1 * scaleFactor
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12 * scaleFactor
                anchors.verticalCenterOffset: 0
                anchors.topMargin: 5 * scaleFactor
                anchors.leftMargin: 0
            }
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }
    }
}




/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:3}
}
##^##*/
