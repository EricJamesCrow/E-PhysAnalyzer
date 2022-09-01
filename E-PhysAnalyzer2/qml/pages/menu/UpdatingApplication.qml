import QtQuick 2.0
import QtQuick.Controls 2.5
import "../../controls"
import "../../controls/buttons"

Item {
    id: updatingApplicationPage
    width: 600
    height: 300

    property url btnIconSource: "../../images/svg_images/close_icon.svg"

    Rectangle {
        id: updatingApplication
        x: 689
        y: 339
        visible: true
        color: "#5ac1d0"
        radius: 5
        border.color: "#5ac1d0"
        anchors.fill: parent
        z: 1

        BusyIndicator {
            id: busyIndicator
            visible: true
            spacing: 0
            hoverEnabled: true
            wheelEnabled: true
            focusPolicy: Qt.WheelFocus
            anchors.fill: parent
            z: 1
            anchors.rightMargin: 30
            anchors.leftMargin: 30
            anchors.bottomMargin: 30
            anchors.topMargin: 100
            running: true
        }


        Label {
            id: updatingLabel
            visible: true
            color: "#fffcfc"
            text: qsTr("Updating")
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 18
            anchors.verticalCenterOffset: -115
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }


        Label {
            id: updatingFinished
            visible: false
            color: "#fffcfc"
            text: qsTr("Update Finished!")
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 18
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: -115
        }

        SettingsBtn {
            id: closeBtn
            x: 555
            width: 37
            height: 23
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.rightMargin: 8
            btnIconSource: "../../images/svg_images/close_icon.svg"
            btnColorDefault: "#00000000"
            onClicked: {updatingApplication.visible = false
                        settingsPageOverlay.visible = false
                        closeUpdatePage.visible = false}
        }

        Label {
            id: restartApplicationText
            visible: false
            color: "#fffcfc"
            text: qsTr("Please restart the application.")
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 18
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomRunButton {
            id: restartButton
            width: 123
            height: 43
            visible: false
            text: "Restart"
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 16
            anchors.verticalCenterOffset: 78
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: backend.restart_program()
        }

    }

}




/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}D{i:4}D{i:6}
}
##^##*/
