import QtQuick 2.0
import QtQuick.Controls 2.5
import "../../controls/buttons"
import "../../javascript/app.js" as App

Item {
    id: profilesPage
    width: 396 * scaleFactor
    height: 660 * scaleFactor

    property url btnIconSource: "../../../images/svg_images/close_icon.svg"


    Rectangle {
        id: profiles
        x: 689 * scaleFactor
        y: 339 * scaleFactor
        visible: true
        color: settings.columnColor
//        radius: 5
        border.color: settings.columnColor
        anchors.fill: parent
        z: 1

        Label {
            id: profilesPageText
            width: 287 * scaleFactor
            height: 488 * scaleFactor
            color: "#ffffff"
            text: "Augue Accumsan A Aenean\nNostra Phasellus Nostra Suspendisse\nRhoncus luctus id blandit integer feugiat. Facilisis cum morbi non nibh sagittis sagittis porttitor. Platea interdum tempor penatibus hymenaeos eros nostra vestibulum suspendisse quisque metus. Platea adipiscing. Neque non elit penatibus. Non purus arcu quisque. Quis. Litora potenti.\n\nSuspendisse. Euismod. Luctus quis tortor nullam. Molestie sit vivamus sodales scelerisque Nulla. Dignissim morbi pretium venenatis felis sodales, fringilla Praesent. Accumsan tristique conubia. Eleifend vel mus sagittis torquent nisl orci elit nullam iaculis mattis nonummy porta mus volutpat habitant.\n\nOrci Massa Ut Congue Ipsum Malesuada Cursus Mattis\nPretium curabitur luctus nulla. Habitant tellus lorem cursus, hendrerit porta aliquam facilisis feugiat metus magna quis lobortis libero diam iaculis vestibulum urna at."
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: profilesTopBar
            height: 30 * scaleFactor
            color: settings.buttonColorDefault
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            SettingsBtn {
                id: closeBtn
                x: 548 * scaleFactor
                width: 37 * scaleFactor
                height: 23 * scaleFactor
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 5 * scaleFactor
                onClicked: App.displayDropDownMenuPages("profiles")
                btnIconSource: "../../../images/svg_images/close_icon.svg"
                btnColorDefault: "#00000000"
            }

            Label {
                id: profilesPageTitle
                x: 295 * scaleFactor
                width: 95 * scaleFactor
                height: 14 * scaleFactor
                color: "#ffffff"
                text: qsTr("PROFILES")
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
