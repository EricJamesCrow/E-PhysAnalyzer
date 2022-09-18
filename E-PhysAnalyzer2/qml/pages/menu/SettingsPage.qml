import QtQuick
import QtQuick 2.0
import QtQuick.Controls 2.5
import Qt.labs.platform 1.1
import "../../controls/buttons"
import "../../controls/custom"
import "../../pages/startup"
import "../../javascript/app.js" as App
import "../../javascript/settings.js" as Settings

Item {
    id: settingsPage

        property color colColor:  settings.columnColor //"#5ac1d0"
        property color btnColorDefault:  settings.buttonColorDefault //"#087589"
        property color bckgrndColor:  settings.backgroundColor //"#b8e3ee"
        property color btnColorPressed:  settings.buttonColorPressed //"#357aac"
        property color topBarColor: settings.topBarColor //"#02323a"

//    // Properties for editing
//    property color colColor: "#5ac1d0"
//    property color btnColorDefault: "#087589"
//    property color bckgrndColor: "#b8e3ee"
//    property color btnColorPressed: "#357aac"
//    property color topBarColor: "#02323a"
//    property int scaleFactor: 1
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
        radius: 5 * scaleFactor
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
            onClicked: Settings.resetSettings(App.determineScaleFactor(Qt.platform.os, Screen.devicePixelRatio), StandardPaths.writableLocation(StandardPaths.DocumentsLocation).toString().substring(8))
        }

        Rectangle {
            id: settingsTopBar
            height: 30 * scaleFactor
            color: btnColorDefault
            radius: 5 * scaleFactor
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            z: 1

            Rectangle {
                id: settingsTopBarBottom
                width: settingsTopBar.width
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
            radius: 5 * scaleFactor
            anchors.left: parent.left
            anchors.top: settingsTopBar.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: -5 * scaleFactor
            Rectangle {
                id: settingsSideBarBottom
                width: 12 * scaleFactor
                color:topBarColor
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
            }

            Rectangle {
                id: rectangle
                x: 0
                width: 185 * scaleFactor
                height: 32 * scaleFactor
                color: topBarColor
                anchors.top: parent.top
                anchors.topMargin: 25 * scaleFactor

                Rectangle {
                    id: rectangle1
                    width: 3 * scaleFactor
                    color: "#ffffff"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                }

                Label {
                    id: label
                    color: "#ffffff"
                    text: qsTr("General")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 9 * scaleFactor
                    anchors.leftMargin: 25 * scaleFactor
                    font.family: "PragmaticaLightC"
                }
            }
        }


        CustomComboBox {
            id: scaleComboBox
            width: 240 * scaleFactor
            height: 23 * scaleFactor
            anchors.verticalCenter: frame.verticalCenter
            anchors.verticalCenterOffset: -225 * scaleFactor
            model: ["50%", "60%", "70%", "80%", "90%", "100% (Recommended for Windows)", "110%", "120%", "130%", "140% (Recommended for Linux)", "150%"]
            anchors.horizontalCenterOffset: 100 * scaleFactor
            anchors.horizontalCenter: frame.horizontalCenter
            font.pointSize: 9 * scaleFactor
            currentIndex: Settings.scaleFactorDictFunction()
            onCurrentIndexChanged: settings.scaleFactor = Settings.updateScaleFactor(scaleComboBox.currentIndex)
            comboBoxTheme: settings.buttonColorDefault
            comboBoxThemeClicked: settings.backgroundColor
        }


        ToolTip {
        id: scaleComboBoxTip
        anchors.top:scaleComboBox.bottom
        anchors.topMargin: 5  * scaleFactor
        anchors.left: scaleComboBox.left
        anchors.leftMargin: -5 * scaleFactor
        width: 150 * scaleFactor
        height: 150 * scaleFactor
        textInfo: "Click here or hold Ctrl + Shift + (_ or +) to change the size of the program"
        toolTipColor: topBarColor
        z: 3
        visible: startup === 19
        opacity: 0

        OpacityAnimator on opacity {
        id: scaleComboBoxAnimation
        from: 0
        to: 1.0
        duration: 250
        running: startup === 19
        }
        }

        ToolTip {
        id: useSameDrugNamesTip
        anchors.top:useSameDrugNames.bottom
        anchors.topMargin: 5  * scaleFactor
        anchors.left: useSameDrugNames.left
        anchors.leftMargin: -5 * scaleFactor
        width: 150 * scaleFactor
        height: 170 * scaleFactor
        textInfo: "Click here to choose whether to repeat the same drug names in all of the input fields"
        toolTipColor: topBarColor
        z: 3
        visible: startup === 20
        opacity: 0

        OpacityAnimator on opacity {
        id: useSameDrugNamesTipAnimation
        from: 0
        to: 1.0
        duration: 250
        running: startup === 20
        }
        }


        ToolTip {
        id: graphFormatTip
        anchors.top:graphFormatComboBox.bottom
        anchors.topMargin: 5  * scaleFactor
        anchors.left: graphFormatComboBox.left
        anchors.leftMargin: -5 * scaleFactor
        width: 150 * scaleFactor
        height: 150 * scaleFactor
        textInfo: "Choose to output the graphs in PNG or PDF format (PDF is twice as fast)"
        toolTipColor: topBarColor
        z: 3
        visible: startup === 21
        opacity: 0

        OpacityAnimator on opacity {
        id: graphFormatTipAnimation
        from: 0
        to: 1.0
        duration: 250
        running: startup === 21
        }
        }


        ToolTip {
        id: directorySwitchTip
        anchors.top:directorySwitch.bottom
        anchors.topMargin: 5  * scaleFactor
        anchors.left: directorySwitch.left
        anchors.leftMargin: -5 * scaleFactor
        width: 150 * scaleFactor
        height: 110 * scaleFactor
        textInfo: "Choose to output your files to a specific directory"
        toolTipColor: topBarColor
        z: 3
        visible: startup === 22
        opacity: 0

        OpacityAnimator on opacity {
        id: directorySwitchTipAnimation
        from: 0
        to: 1.0
        duration: 250
        running: startup === 22
        }
        }


        Rectangle {
            id: frame
            color: "#00000000"
            anchors.left: settingsSideBar.right
            anchors.right: parent.right
            anchors.top: settingsTopBar.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }

        Label {
            id: scalingLabel
            x: 197 * scaleFactor
            width: 117 * scaleFactor
            height: 16 * scaleFactor
            text: qsTr("Adjust Scaling")
            anchors.verticalCenter: scaleComboBox.verticalCenter
            color: "#ffffff"
            anchors.right: scaleComboBox.left
            font.family: "PragmaticaLightC"
            font.pointSize: 12 * scaleFactor
            anchors.rightMargin: 125 * scaleFactor
        }

        CustomSwitch {
            id: useSameDrugNames
            y: 235 * scaleFactor
            width: 250 * scaleFactor
            height: 38 * scaleFactor
            anchors.top: scaleComboBox.bottom
            anchors.horizontalCenter: scaleComboBox.horizontalCenter
            anchors.topMargin: 25 * scaleFactor
            checked: settings.repeatDrugNames
            onCheckedChanged: if(useSameDrugNames.checked) return settings.repeatDrugNames = true; else return settings.repeatDrugNames = false
        }

        CustomComboBox{
            id: graphFormatComboBox
            y: 282 * scaleFactor
            width: 87 * scaleFactor
            height: 31 * scaleFactor
            anchors.top: useSameDrugNames.bottom
            font.pointSize: 9 * scaleFactor
            anchors.horizontalCenterOffset: -76 * scaleFactor
            anchors.horizontalCenter: useSameDrugNames.horizontalCenter
            anchors.topMargin: 26 * scaleFactor
            model: ["PNG", "PDF"]
            comboBoxTheme: settings.buttonColorDefault
            comboBoxThemeClicked: settings.backgroundColor
            currentIndex: settings.outputFormat
            onCurrentIndexChanged: settings.outputFormat = graphFormatComboBox.currentIndex
        }

        Label {
            id: graphOutputFormatLabel
            width: 117 * scaleFactor
            height: 16 * scaleFactor
            color: "#ffffff"
            text: "Graph Output Format"
            anchors.verticalCenter: graphFormatComboBox.verticalCenter
            anchors.horizontalCenter: scalingLabel.horizontalCenter
            font.pointSize: 12 * scaleFactor
            font.family: "PragmaticaLightC"
        }

        Label {
            id: repeatDrugNamesLabel
            width: 117 * scaleFactor
            height: 16 * scaleFactor
            color: "#ffffff"
            text: "Repeat Drug Names"
            anchors.verticalCenter: useSameDrugNames.verticalCenter
            anchors.horizontalCenter: scalingLabel.horizontalCenter
            font.pointSize: 12 * scaleFactor
            font.family: "PragmaticaLightC"
        }

        Label {
            id: directoryLabel
            width: 166 * scaleFactor
            height: 22 * scaleFactor
            color: "#ffffff"
            text: qsTr("Custom Output Directory")
            anchors.verticalCenter: directorySwitch.verticalCenter
            font.family: "PragmaticaLightC"
            anchors.horizontalCenterOffset: 24 * scaleFactor
            anchors.horizontalCenter: scalingLabel.horizontalCenter
            font.pointSize: 12 * scaleFactor
        }

        CustomSwitch {
            id: directorySwitch
            anchors.top: graphFormatComboBox.bottom
            anchors.topMargin: 25 * scaleFactor
            anchors.horizontalCenterOffset: -92 * scaleFactor
            anchors.horizontalCenter: scaleComboBox.horizontalCenter
            checked: settings.customDirectory
            onCheckedChanged: if(directorySwitch.checked) return settings.customDirectory = true; else return settings.customDirectory = false

        }


        CustomButton {
            id: changeDefaultOutputDirectoryBtn
            colorDefault: btnColorDefault
            colorMouseOver: bckgrndColor
            colorPressed: settings.buttonColorPressed
            fontColorMouseOver: btnColorDefault
            anchors.top: directoryLabel.top
            anchors.topMargin: 50 * scaleFactor
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -75 * scaleFactor
            width: 216 * scaleFactor
            height: 25 * scaleFactor
            text: "Change Custom Output Directory"
            font.family: "PragmaticaLightC"
            onClicked: backend.change_default_directory()
            visible: settings.customDirectory

            CustomTextField {
                id: currentDirectoryTextField
                x: 233 * scaleFactor
                y: 3 * scaleFactor
                width: 327 * scaleFactor
                height: 20 * scaleFactor
                clip: true
                placeholderText: settings.mtkDefaultOutputPath
                colorDefault: bckgrndColor
                fontColorDefault: btnColorDefault
            }}

            Label {
                id: tutorialLabel
                width: 166 * scaleFactor
                height: 22 * scaleFactor
                color: "#ffffff"
                text: qsTr("Show Tutorial on Startup")
                anchors.verticalCenter: tutorialSwitch.verticalCenter
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 24
                anchors.horizontalCenter: scalingLabel.horizontalCenter
                font.pointSize: 12 * scaleFactor
                font.family: "PragmaticaLightC"
            }

            CustomSwitch {
                id: tutorialSwitch
                anchors.top: directorySwitch.bottom
                anchors.topMargin: 50
                checked: false
                anchors.horizontalCenterOffset: -92 * scaleFactor
                anchors.horizontalCenter: scaleComboBox.horizontalCenter
                onCheckedChanged: if(tutorialSwitch.checked === true) return settings.startup = -1

            }
    }

}









/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}D{i:27}D{i:28}
}
##^##*/
