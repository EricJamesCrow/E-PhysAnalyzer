import QtQuick 2.0
import QtQuick.Controls 2.5
import Qt.labs.platform 1.1
import "../../controls/buttons"
import "../../controls/custom"
import "../../javascript/app.js" as App
import "../../javascript/settings.js" as Settings

Item {
    id: settingsPage

    property color colColor:  settings.columnColor //"#5ac1d0"
    property color btnColorDefault:  settings.buttonColorDefault //"#087589"
    property color bckgrndColor:  settings.backgroundColor //"#b8e3ee"
    property color btnColorPressed:  settings.buttonColorPressed //"#357aac"
    property color topBarColor: settings.topBarColor

    //    // Properties for editing
    //    property color colColor: "#5ac1d0"
    //    property color btnColorDefault: "#087589"
    //    property color bckgrndColor: "#b8e3ee"
    //    property color btnColorPressed: "#357aac"
//        property color topBarColor: "#02323a"
//        property int scaleFactor: 1
    //    width: 750
    //    height: 800

    property url btnIconSource: "../../../images/svg_images/close_icon.svg"

    signal changeTheme()

    Rectangle {
        id: settings_page
        x: 689 * scaleFactor
        y: 339 * scaleFactor
        visible: true
        color: colColor
        //        radius: 5
        border.color: colColor
        anchors.fill: parent
        z: 1


        CustomButton {
            id: resetSettingsBtn
            colorDefault: btnColorDefault
            colorMouseOver: bckgrndColor
            colorPressed: btnColorPressed
            fontColorMouseOver: btnColorDefault
            width: 100 * scaleFactor
            height: 25 * scaleFactor
            text: "Reset Settings"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 185 * scaleFactor
            anchors.horizontalCenterOffset: 60 * scaleFactor
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: Settings.resetSettings(App.determineScaleFactor(Qt.platform.os, Screen.devicePixelRatio))

            CustomButton {
                id: pixelDensityBtn
                y: -76 * scaleFactor
                width: 188 * scaleFactor
                height: 36 * scaleFactor
                visible: false
                text: "Screen.pixelDensity"
                anchors.bottom: parent.bottom
                colorDefault: btnColorDefault
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 40 * scaleFactor
                onClicked: Settings.logDeviceInformation()
            }
        }

        Rectangle {
            id: settingsTopBar
            height: 30 * scaleFactor
            color: btnColorDefault
            //            radius: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            SettingsBtn {
                id: closeBtn
                x: 548 * scaleFactor
                width: 37 * scaleFactor
                height: 23 * scaleFactor
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 5 * scaleFactor
                btnIconSource: "../../../images/svg_images/close_icon.svg"
                btnColorDefault: "#00000000"
                onClicked: App.displayDropDownMenuPages("settings")


            }

            Label {
                id: settingsPageTitle
                x: 295 * scaleFactor
                width: 95 * scaleFactor
                height: 14 * scaleFactor
                color: "#ffffff"
                text: qsTr("SETTINGS")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.top: parent.top
                font.letterSpacing: 1 * scaleFactor
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenterOffset: 0
                font.pointSize: 12 * scaleFactor
                anchors.leftMargin: 0
                anchors.topMargin: 5 * scaleFactor
            }
        }

        Rectangle {
            id: settingsSideBar
            width: 185 * scaleFactor
            color: topBarColor
            //            radius: 5
            anchors.left: parent.left
            anchors.top: settingsTopBar.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
        }

        CustomComboBox {
            id: scaleComboBox
            x: 222 * scaleFactor
            width: 240 * scaleFactor
            height: 23 * scaleFactor
            anchors.verticalCenter: parent.verticalCenter
            model: ["50%", "60%", "70%", "80%", "90%", "100% (Recommended for Windows)", "110%", "120%", "130%", "140% (Recommended for Linux)", "150%"]
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 9 * scaleFactor
            currentIndex: Settings.scaleFactorDictFunction()
            onCurrentIndexChanged: settings.scaleFactor = Settings.updateScaleFactor(scaleComboBox.currentIndex)
            comboBoxTheme: settings.buttonColorDefault
            comboBoxThemeClicked: settings.backgroundColor
        }




        //        CustomTextField {
        //            id: customTextField
        //            x: 27 * scaleFactor
        //            y: 176 * scaleFactor
        //            colorDefault: bckgrndColor
        //            fontColorDefault: btnColorDefault
        //            width: 120 * scaleFactor
        //            height: 20 * scaleFactor
        //            clip: true
        //            placeholderText: "topBarColor"
        //            onReleased: settings.topBarColor = customTextField.text
        //        }


        //        CustomTextField {
        //            id: customTextField1
        //            x: 27 * scaleFactor
        //            y: 202 * scaleFactor
        //            width: 120 * scaleFactor
        //            height: 20 * scaleFactor
        //            clip: true
        //            fontColorDefault: btnColorDefault
        //            placeholderText: "topBarSecondaryColor"
        //            colorDefault: bckgrndColor
        //            onReleased: settings.topBarSecondaryColor = customTextField1.text
        //        }


        //        CustomTextField {
        //            id: customTextField2
        //            x: 27 * scaleFactor
        //            y: 228 * scaleFactor
        //            width: 120 * scaleFactor
        //            height: 20 * scaleFactor
        //            clip: true
        //            fontColorDefault: btnColorDefault
        //            placeholderText: "columnColor"
        //            colorDefault: bckgrndColor
        //            onReleased: settings.columnColor = customTextField2.text
        //        }


        //        CustomTextField {
        //            id: customTextField3
        //            x: 27 * scaleFactor
        //            y: 254 * scaleFactor
        //            width: 120 * scaleFactor
        //            height: 20 * scaleFactor
        //            clip: true
        //            fontColorDefault: btnColorDefault
        //            placeholderText: "backgroundColor"
        //            colorDefault: bckgrndColor
        //            onReleased: settings.backgroundColor = customTextField3.text
        //        }


        //        CustomTextField {
        //            id: customTextField4
        //            x: 27 * scaleFactor
        //            y: 280 * scaleFactor
        //            width: 120 * scaleFactor
        //            height: 20 * scaleFactor
        //            clip: true
        //            fontColorDefault: btnColorDefault
        //            placeholderText: "backgroundBorderColor"
        //            colorDefault: bckgrndColor
        //            onReleased: settings.backgroundBorderColor = customTextField4.text
        //        }


        //        CustomTextField {
        //            id: customTextField5
        //            x: 159 * scaleFactor
        //            y: 176 * scaleFactor
        //            width: 120 * scaleFactor
        //            height: 20 * scaleFactor
        //            clip: true
        //            fontColorDefault: btnColorDefault
        //            placeholderText: "buttonColorDefault"
        //            colorDefault: bckgrndColor
        //            onReleased: settings.buttonColorDefault = customTextField5.text
        //        }


        //        CustomTextField {
        //            id: customTextField6
        //            x: 159 * scaleFactor
        //            y: 202 * scaleFactor
        //            width: 120 * scaleFactor
        //            height: 20 * scaleFactor
        //            clip: true
        //            fontColorDefault: btnColorDefault
        //            placeholderText: "buttonColorPressed"
        //            colorDefault: bckgrndColor
        //            onReleased: settings.buttonColorPressed = customTextField6.text
        //        }


        //        CustomTextField {
        //            id: customTextField7
        //            x: 159 * scaleFactor
        //            y: 228 * scaleFactor
        //            width: 120 * scaleFactor
        //            height: 20 * scaleFactor
        //            clip: true
        //            fontColorDefault: btnColorDefault
        //            placeholderText: "checkBoxHighlighted"
        //            colorDefault: bckgrndColor
        //            onReleased: settings.checkBoxHighlighted = customTextField7.text
        //        }


        //        CustomTextField {
        //            id: customTextField8
        //            x: 159 * scaleFactor
        //            y: 254 * scaleFactor
        //            width: 120 * scaleFactor
        //            height: 20 * scaleFactor
        //            clip: true
        //            fontColorDefault: btnColorDefault
        //            placeholderText: "terminalUnderlineColor"
        //            colorDefault: bckgrndColor
        //            onReleased: settings.terminalUnderlineColor = customTextField8.text
        //        }

    }

}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}D{i:8}
}
##^##*/
