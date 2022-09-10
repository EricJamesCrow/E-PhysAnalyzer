import QtQuick
import QtQuick.Controls

ComboBox {
    id: control

    property var modelValues: []
    property string comboBoxTheme: buttonColorDefault//"#087589"
    property string comboBoxThemeClicked: backgroundColor
    width: 90 * scaleFactor
    height: 26 * scaleFactor

    model: modelValues

    function returnComboBoxTheme(){
       return buttonColorDefault
    }

    function returnComboBoxThemeClicked(){
        return backgroundColor
    }

    delegate: ItemDelegate {
        id: controlDelegate
        width: control.width
        contentItem: Text {
            id: modelText
            text: modelData // dont change this, it'll populate the model correctly
            color: controlDelegate.highlighted ? comboBoxThemeClicked : comboBoxTheme
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter

        }
        highlighted: {control.highlightedIndex === index}

        required property int index
        required property var modelData
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12*scaleFactor
        height: 8*scaleFactor
        contextType: "2d"

        Connections {
            target: control
            function onPressedChanged() { canvas.requestPaint(); }
        }

        Connections {
            target: settingsPage
            function onChangeTheme() { canvas.requestPaint(); }
        }

        onPaint: {
            // the little indicator arrow
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.pressed ? comboBoxThemeClicked : comboBoxTheme;
            context.fill();
        }
    }

    contentItem: Text {
        leftPadding: 4*scaleFactor
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        font: control.font
        color: control.pressed ? comboBoxThemeClicked : comboBoxTheme
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 120*scaleFactor
        implicitHeight: 40*scaleFactor
        border.color: control.pressed ? comboBoxThemeClicked : comboBoxTheme
        border.width: control.visualFocus ? 2 : 1
        radius: 2 * scaleFactor
    }

    popup: Popup {
        y: control.height - 1
        width: control.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            border.color: comboBoxTheme
            radius: 2 * scaleFactor
        }
    }

    Rectangle {
        id: comboBoxDropShadow
        x: 2 * scaleFactor
        y: 2 * scaleFactor
        height: 740 * scaleFactor
        opacity: 0.25
        visible: true
        color: "#000000"
        radius: 2 * scaleFactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        anchors.topMargin: 1 * scaleFactor
        anchors.leftMargin: 1 * scaleFactor
        anchors.rightMargin: -1 * scaleFactor
        anchors.bottomMargin: -1 * scaleFactor
        z: -3
    }
}
