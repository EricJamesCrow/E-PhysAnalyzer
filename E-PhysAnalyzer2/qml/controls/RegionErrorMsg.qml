import QtQuick 2.0
import QtQuick.Controls 6.2

Rectangle {
    property string errorMessageString: "Please enter your values."

    id: errorMessage
    width: 168
    height: 36
    color: "#ff9e9e"
    radius: 5



    Label {
        id: errorLabel
        text: qsTr("Error")
        color: "red"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -12
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        id: errorMsg
        text: errorMessageString
        color: "red"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 3
    }
}
