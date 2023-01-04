import QtQuick 2.0
import QtQuick.Controls 2.5
import "../../controls/buttons"
import "../../javascript/app.js" as App

Item {
    id: logoutPage
    width: 500 * scaleFactor
    height: 150 * scaleFactor

    property url btnIconSource: "../../../images/svg_images/close_icon.svg"


    Rectangle {
        id: logout
        x: 689 * scaleFactor
        y: 339 * scaleFactor
        visible: true
        color: settings.columnColor
        radius: 5
        border.color: settings.columnColor
        anchors.fill: parent
        z: 1

        Label {
            id: logoutPageTitle
            width: 95 * scaleFactor
            height: 40 * scaleFactor
            color: "#ffffff"
            text: qsTr("LOGOUT?")
            anchors.top: parent.top
            font.letterSpacing: 1
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 5 * scaleFactor
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 15 * scaleFactor
            anchors.topMargin: 20 * scaleFactor
        }

        SettingsBtn {
            id: closeBtn
            x: 592 * scaleFactor
            y: 8 * scaleFactor
            width: 37 * scaleFactor
            height: 23 * scaleFactor
            btnIconSource: "../../../images/svg_images/close_icon.svg"
            btnColorDefault: "#00000000"
            onClicked: App.displayDropDownMenuPages("logout")
        }

        CustomButton {
            id: yesLogout
            x: 128 * scaleFactor
            y: 78 * scaleFactor
            width: 91 * scaleFactor
            height: 22 * scaleFactor
            text: "Yes"
            colorDefault: settings.buttonColorDefault
            colorMouseOver: settings.backgroundColor
            colorPressed: settings.buttonColorPressed
            fontColorMouseOver: settings.buttonColorDefault
        }

        CustomButton {
            id: noLogout
            x: 289 * scaleFactor
            y: 78 * scaleFactor
            width: 91 * scaleFactor
            height: 22 * scaleFactor
            text: "No"
            colorDefault: settings.buttonColorDefault
            colorMouseOver: settings.backgroundColor
            colorPressed: settings.buttonColorPressed
            fontColorMouseOver: settings.buttonColorDefault
            onClicked: App.displayDropDownMenuPages("logout")
        }
    }
}




/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:5}
}
##^##*/
