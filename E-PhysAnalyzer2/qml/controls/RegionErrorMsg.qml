import QtQuick 2.0
import QtQuick.Controls 6.2

Rectangle {
    property string errorMessageString: "Please enter your values."

    id: errorMessage
    width: 168 * scaleFactor
    height: 36 * scaleFactor
    color: "#ff9e9e"
    radius: 5 * scaleFactor



    Label {
        id: errorLabel
        text: qsTr("Error")
        color: "red"
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 9 * scaleFactor
        anchors.verticalCenterOffset: -8 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        id: errorMsg
        text: errorMessageString
        color: "red"
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 9 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 7 * scaleFactor
    }
}
