import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.5
import "../../javascript/input-fields.js" as InputFields

Rectangle {

    property string file: ""
    property string drugName: ""
    property string traceNumber: ""
    property string excludedTraces: ""
    property bool error: false
    property bool success: false
    onSuccessChanged: if(success) return successAnimation.running = true
    onErrorChanged: if(error) return errorAnimation.running = true


    property var dynamicColor : if(error) {
                                    return "red"
                                } else if(success) {
                                    return "green"
                                } else {
                                    return columnColor
                                }

    id: objectBg
    height: 35 * scaleFactor
    color: columnColor /*dynamicColor*/
    radius: 5 * scaleFactor
    border.color: topBarColor
    border.width: 0
    onDrugNameChanged: {if(settings.repeatDrugNames === true) return InputFields.repeatDrugNames();}

    ColorAnimation on color {
        id: successAnimation
        to: "green"
        duration: 250
        running: false
    }

    ColorAnimation on color {
        id: errorAnimation
        to: "red"
        duration: 250
        running: false
    }

    Label {
        id: fileName
        width: 195 * scaleFactor
        height: 22 * scaleFactor
        color: "#f9f9f9"
        clip: true
        text: file
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 5 * scaleFactor
        font.pointSize: 10 * scaleFactor
        anchors.verticalCenterOffset: 0
            }

    CustomTextField {
        id: drugNameTextField
        x: 213 * scaleFactor
        width: 128 * scaleFactor
        height: 20 * scaleFactor
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        onTextChanged: drugName = drugNameTextField.text
        text: drugName
                    }

    CustomTextField {
        id: traceNumberTextField
        x: 405 * scaleFactor
        width: 128 * scaleFactor
        height: 20 * scaleFactor
        text: traceNumber
        anchors.verticalCenter: parent.verticalCenter
        onTextChanged: traceNumber = traceNumberTextField.text
        validator: RegularExpressionValidator { regularExpression: /^[0-9]+$/ }
                    }

    CustomTextField {
        id: excludedTracesTextField
        x: 574 * scaleFactor
        width: 230 * scaleFactor
        height: 20 * scaleFactor
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20 * scaleFactor
        anchors.verticalCenterOffset: 0
        onTextChanged: excludedTraces = excludedTracesTextField.text
        validator: RegularExpressionValidator { regularExpression: /^[,0-9]+$/ }
                    }
}
