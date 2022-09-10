import QtQuick
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import "controls"
import "controls/buttons"
import "controls/custom"
import "pages"
import "pages/menu"
//import Qt5Compat.GraphicalEffects
import Qt.labs.platform 1.1
import Qt.labs.settings 1.1
import "javascript/app.js" as App

Window {
    // Scale Factor
    signal adjustHeight(var scale)
    property var scaleFactor: settings.scaleFactor
    onScaleFactorChanged: adjustHeight(scaleFactor)

    Settings {
        id: settings
        // Functionality
        property string mtkDefaultOutputPath : Qt.resolvedUrl("./../").toString().slice(8)
        property double scaleFactor: App.determineScaleFactor(Qt.platform.os, Screen.devicePixelRatio)

        // Images
        property string addFilterSvgIcon: "../../images/svg_images/plus_icon_087589.svg"
        property string closeBtnSvgIcon: "../../images/svg_images/close_icon.svg"
        property string checkBoxIcon: "../../images/svg_images/checkmark_icon_087589.svg"

//        // Colors
//        property color topBarColor: "#02323a"/*"#001434"*/
//        property color topBarSecondaryColor: "#015967"
//        property color columnColor: "#304876"
//        property color backgroundColor: "#b8e3ee"//"#4E7CFF"
//        property color backgroundBorderColor: "#e9efec"
//        property color buttonColorDefault: "#4E7CFF"
//        property color buttonColorPressed: "#357aac"
//        property color checkBoxHighlighted: "#33aac0"
//        property color terminalUnderlineColor: "#51abb9"
//        property color terminalText: "#2aafd3"
//        property color menuDropDownMouseOverColor: "#af025967"
        // Colors
        property color topBarColor: "#02323a"
        property color topBarSecondaryColor: "#015967"
        property color columnColor: "#5ac1d0"
        property color backgroundColor: "#b8e3ee"
        property color backgroundBorderColor: "#e9efec"
        property color buttonColorDefault: "#087589"
        property color buttonColorPressed: "#357aac"
        property color checkBoxHighlighted: "#33aac0"
        property color terminalUnderlineColor: "#51abb9"
        property color terminalText: "#2aafd3"
        property color menuDropDownMouseOverColor: "#af025967"

    }

    id: mainWindow
    width: 1600 * scaleFactor
    height: 900 * scaleFactor
    minimumWidth: 1600 * scaleFactor
    minimumHeight: 900 * scaleFactor
    visible: true
    color: "#00000000"
    title: qsTr("E-Phys Analyzer 2.0")


    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Properties
    property int windowStatus: 0
    property int windowMargin: 10
    property var selectedProgram: qsTr("Post Processing")
    property var terminalTabSelected: true
    property var plotTabSelected: false
    property bool dragHandlerActivated : false

    FontLoader {
        id: fixedFont
        source: "fonts/Segoe UI.ttf"
//        source:"fonts/LDFComicSans.ttf"
    }

    FontLoader {
        id: pragmaticaFont
        source: "fonts/PT Pragmatica Book.ttf"
    }

    Rectangle {
        id: bg
        color: settings.backgroundColor
        radius: 10
        border.color: settings.backgroundColor
        border.width: 1  * scaleFactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: false
        anchors.rightMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.topMargin: windowMargin

        Rectangle {
            id: appContainer
            visible: true
            color: "#00000000"
            radius: 0
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            clip: true

            Content {
                id: content
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: bottomBar.top
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }


            Rectangle {
                id: bottomBar
                x: 0
                y: 36 * scaleFactor
                height: 24 * scaleFactor
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                z: 0
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0

                MouseArea {
                    id: resizeWindow
                    x: 951 * scaleFactor
                    y: 0
                    width: 25 * scaleFactor
                    height: 25 * scaleFactor
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    cursorShape: Qt.SizeFDiagCursor
                    // All of these functions are necessary for the drag handler to only activate when held down
                    onPressed: {dragHandlerActivated = true
                        bottomRightCornerHandler.enabled = true}
                    onReleased: {dragHandlerActivated = false
                        bottomRightCornerHandler.enabled = false
                    }
                    onCanceled: {dragHandlerActivated = false
                        bottomRightCornerHandler.enabled = false
                    }

                    DragHandler{
                        id: bottomRightCornerHandler
                        target: resizeWindow
                        enabled: false // Make sure enabled is set to false
                        onEnabledChanged: if (dragHandlerActivated === true){
                                              mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                          }
                    }

                    Image {
                        id: resizeImage
                        width: 16 * scaleFactor
                        height: 16 * scaleFactor
                        anchors.fill: parent
                        source: "../images/svg_images/resize_icon.svg"
                        anchors.leftMargin: 5 * scaleFactor
                        anchors.topMargin: 5 * scaleFactor
                        sourceSize.height: 16 * scaleFactor
                        sourceSize.width: 16 * scaleFactor
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
                    }
                }
            }




            Rectangle {
                id: topBar
                height: 36 * scaleFactor
                color: settings.topBarColor
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                clip: false
                radius: 10
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0


                Rectangle {
                    id: topBarDescription
                    y: 21 * scaleFactor
                    height: 24 * scaleFactor
                    color: settings.topBarColor
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0

                }

                Rectangle {
                    id: titleBar
                    height: 35 * scaleFactor
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    z: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 5  * scaleFactor
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if(active){
                                             mainWindow.startSystemMove()
                                             App.ifMaximizedWindowRestore()
                                         }
                    }

                    MenuButton {
                        id: menuDropDownButton
                        width: 40 * scaleFactor
                        text: qsTr("Button")
                        anchors.left: iconImage.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.leftMargin: 5  * scaleFactor
                        onClicked: App.runMenuDropDown()
                    }

                    Rectangle {
                        id: menuDropDown
                        y: 37 * scaleFactor
                        visible: false
                        width: 164 * scaleFactor
                        height: 144 * scaleFactor
                        opacity: 0
                        color: settings.topBarColor
                        anchors.left: parent.left
                        anchors.top: parent.bottom
                        z: 1
                        anchors.leftMargin: 31 * scaleFactor
                        anchors.topMargin: 0
                        clip: true
                        onOpacityChanged: if(menuDropDown.opacity <= 0) return menuDropDown.visible = false

                        TapHandler {
                            id: menuDropDownTapHandler
                            acceptedButtons: Qt.AllButtons
                            gesturePolicy: TapHandler.ReleaseWithinBounds
                            onTapped: menuDropDownAnimation.running = true
                            margin: 10000

                        }

                        OpacityAnimator on opacity{
                            id: menuDropDownAnimation
                            from: 0
                            to: 1.0
                            duration:100
                            target: menuDropDown
                            running: false
                        }

                        OpacityAnimator on opacity{
                            id: menuDropDownAnimation2
                            from:1.0
                            to: 0
                            duration:100
                            target:menuDropDown
                            running: false
                        }

                        HelpButton {
                            id: aboutMenuButton
                            height: 36 * scaleFactor
                            text: "About"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            z: 0
                            btnColorDefault: settings.topBarColor
                            anchors.rightMargin: 0
                            anchors.leftMargin: 0
                            anchors.topMargin: 0
                            onClicked: {App.displayDropDownMenuPages("about"); backend.get_recent_commits()}

                        }

                        HelpButton {
                            id: settingsMenuButton
                            height: 36 * scaleFactor
                            text: "Settings"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: aboutMenuButton.bottom
                            z: 0
                            btnColorDefault: settings.topBarColor
                            anchors.rightMargin: 0
                            anchors.leftMargin: 0
                            anchors.topMargin: 0
                            onClicked: App.displayDropDownMenuPages("settings")

                        }

                        HelpButton {
                            id: helpMenuButton
                            height: 36 * scaleFactor
                            text: "Help"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: settingsMenuButton.bottom
                            z: 0
                            btnColorDefault: settings.topBarColor
                            anchors.rightMargin: 0
                            anchors.leftMargin: 0
                            anchors.topMargin: 0
                            onClicked: App.displayDropDownMenuPages("help")

                        }

                        HelpButton {
                            id: exitMenuButton
                            height: 36 * scaleFactor
                            text: "Exit"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: helpMenuButton.bottom
                            z: 0
                            btnColorDefault: settings.topBarColor
                            anchors.rightMargin: 0
                            anchors.leftMargin: 0
                            anchors.topMargin: 0
                            onClicked: App.displayDropDownMenuPages("exit")

                        }
                    }

                    MouseArea {
                        id: closeDropDownMenuClickAnywhere
                        x: -5 * scaleFactor
                        y: 0
                        visible: false
                        //                        anchors.left: parent.left
                        //                        anchors.right: parent.right
                        //                        anchors.top: parent.top
                        //                        anchors.bottom: parent.bottom
                        z: 0
                        height: Screen.height * scaleFactor
                        width: Screen.width * scaleFactor
                        //                        anchors.topMargin: 0
                        //                        anchors.bottomMargin: -1414
                        //                        anchors.rightMargin: 0
                        onClicked: App.runMenuDropDown()
                        onPressAndHold: App.runMenuDropDown()
                        onPressed: App.runMenuDropDown()
                    }

                    Image {
                        id: iconImage
                        width: 22 * scaleFactor
                        height: 22 * scaleFactor
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/activity.svg"
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 5  * scaleFactor
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }




                }

                Row {
                    id: row
                    x: 895 * scaleFactor
                    width: 105 * scaleFactor
                    height: 35 * scaleFactor
                    anchors.right: parent.right
                    anchors.top: parent.top
                    clip: true
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    TopBarButton {
                        id: minimizeWindow
                        btnColorDefault: settings.topBarColor
                        width: 35 * scaleFactor; height: 35 * scaleFactor
                        onClicked: {
                            App.restoreMargings()
                            mainWindow.showMinimized()
                        }
                    }

                    TopBarButton {
                        id: btnMaximizeRestore
                        btnColorDefault: settings.topBarColor
                        btnIconSource: "../../../images/svg_images/maximize_icon.svg"
                        width: 35 * scaleFactor; height: 35 * scaleFactor
                        onClicked: App.maximizeRestore()
                    }

                    TopBarCloseButton {
                        id: btnClose
                        btnColorDefault: settings.topBarColor
                        btnIconSource: "../../../images/svg_images/close_icon_white.svg"
                        width: 35 * scaleFactor; height: 35 * scaleFactor
                        onClicked: App.closeWindow() /*mainWindow.close()*/
                    }
                }


            }



            SettingsPage {
                id: settingsPage
                x: 591 * scaleFactor
                y: 127 * scaleFactor
                width: 770 * scaleFactor
                height: 600 * scaleFactor
                anchors.verticalCenter: parent.verticalCenter
                clip: true
                z: 1
                anchors.horizontalCenter: parent.horizontalCenter
                visible: false

                MouseArea {
                    id: settingsPageMouseArea
                    anchors.fill: parent
                }
            }



            AboutPage {
                id: aboutPage
                x: 598 * scaleFactor
                y: 124 * scaleFactor
                width: 396 * scaleFactor
                height: 660 * scaleFactor
                visible: false
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                z: 1
                MouseArea {
                    id: aboutPageMouseArea
                    anchors.fill: parent
                }
                clip: true
            }



            HelpPage {
                id: helpPage
                x: 603 * scaleFactor
                y: 116 * scaleFactor
                width: 396 * scaleFactor
                height: 660 * scaleFactor
                visible: false
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                z: 1
                MouseArea {
                    id: helpPageMouseArea
                    anchors.fill: parent
                }
                clip: true
            }



            ProfilesPage {
                id: profilesPage
                x: 610 * scaleFactor
                y: 114 * scaleFactor
                width: 396 * scaleFactor
                height: 660 * scaleFactor
                visible: false
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                z: 1
                MouseArea {
                    id: profilesPageMouseArea
                    anchors.fill: parent
                }
                clip: true
            }



            LogoutPage {
                id: logoutPage
                x: 618 * scaleFactor
                y: 120 * scaleFactor
                width: 500 * scaleFactor
                height: 150 * scaleFactor
                visible: false
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                z: 1
                MouseArea {
                    id: logoutPageMouseArea
                    anchors.fill: parent
                }
                clip: true
            }



            Rectangle {
                id: settingsPageOverlay
                x: 591 * scaleFactor
                y: 60 * scaleFactor
                opacity:0.67
                visible: false
                color: "#323232"
//                radius: 10
//                height: roundRect.radius
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                z: 0

//                Rectangle {
//                        id: roundRect
//                        color:"#323232"
//                        height: 100
//                        anchors.left: parent.left
//                        anchors.right: parent.right
//                        anchors.top: topBar.bottom
//                      }
            }








            MouseArea {
                id: closeSettingsPage
                x: 0
                y: 60 * scaleFactor
                visible: false
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: bottomBar.top
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                onClicked: App.displayDropDownMenuPages("settings")
                onPressAndHold: App.displayDropDownMenuPages("settings")
                onPressed: App.displayDropDownMenuPages("settings")
            }








            Rectangle {
                id: closeMainWindow
                width: 637 * scaleFactor
                height: 258 * scaleFactor
                visible: false
                color: settings.columnColor
                radius: 5
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                z: 1

                Label {
                    id: closeMainWindowLabel
                    width: 269 * scaleFactor
                    height: 27 * scaleFactor
                    color: "#ffffff"
                    text: qsTr("Are you sure you want to exit?")
                    anchors.top: parent.top
                    anchors.topMargin: 35 * scaleFactor
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 15  * scaleFactor
                }

                CustomButton {
                    id: closeWindowYesButton
                    colorDefault: settings.buttonColorDefault
                    colorMouseOver: settings.backgroundColor
                    colorPressed: settings.buttonColorPressed
                    fontColorMouseOver: settings.buttonColorDefault
                    width: 75 * scaleFactor
                    height: 27 * scaleFactor
                    text: "Yes"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    z: 1
                    anchors.leftMargin: 217 * scaleFactor
                    anchors.topMargin: 107 * scaleFactor
                    onClicked: {mainWindow.close()}
                }

                CustomButton {
                    id: closeWindowNoButton
                    colorDefault: settings.buttonColorDefault
                    colorMouseOver: settings.backgroundColor
                    colorPressed: settings.buttonColorPressed
                    fontColorMouseOver: settings.buttonColorDefault
                    x: 339 * scaleFactor
                    width: 75 * scaleFactor
                    height: 27 * scaleFactor
                    text: "No"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    z: 1
                    anchors.rightMargin: 223 * scaleFactor
                    anchors.topMargin: 107 * scaleFactor
                    onClicked: App.closeWindow()
                }

                MouseArea {
                    id: closeMainWindowMouseArea
                    anchors.fill: parent
                }
            }







            Rectangle {
                id: closeMainWindowOverlay
                x: 471 * scaleFactor
                opacity: 0.67
                visible: false
                color: "#323232"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                z: 0
//                anchors.topMargin: -25 * scaleFactor
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
            }








            MouseArea {
                id: clickOffCloseMainWindow
                x: 0
                y: 60 * scaleFactor
                visible: false
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: bottomBar.top
                anchors.bottomMargin: 0
                onClicked: App.closeWindow()
                onPressed: App.closeWindow()
                onPressAndHold: App.closeWindow()
            }








            MouseArea {
                id: closeAboutPage
                x: 9 * scaleFactor
                y: 68 * scaleFactor
                visible: false
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: bottomBar.top
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                onClicked: App.displayDropDownMenuPages("about")
                onPressAndHold: App.displayDropDownMenuPages("about")
                onPressed: App.displayDropDownMenuPages("about")
            }






            MouseArea {
                id: closeHelpPage
                x: 14 * scaleFactor
                y: 60 * scaleFactor
                visible: false
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: bottomBar.top
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                onClicked: App.displayDropDownMenuPages("help")
                onPressAndHold: App.displayDropDownMenuPages("help")
                onPressed: App.displayDropDownMenuPages("help")
            }






            MouseArea {
                id: closeProfilesPage
                x: 8 * scaleFactor
                y: 76 * scaleFactor
                visible: false
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: bottomBar.top
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                onClicked: App.displayDropDownMenuPages("profiles")
                onPressAndHold: App.displayDropDownMenuPages("profiles")
                onPressed: App.displayDropDownMenuPages("profiles")
            }





            MouseArea {
                id: closeLogoutPage
                x: 13 * scaleFactor
                y: 81 * scaleFactor
                visible: false
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: bottomBar.top
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                onClicked: App.displayDropDownMenuPages("logout")
                onPressed: App.displayDropDownMenuPages("logout")
                onPressAndHold: App.displayDropDownMenuPages("logout")
            }

            MouseArea {
                id: closeUpdatePage
                x: 20 * scaleFactor
                y: 78 * scaleFactor
                visible: false
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: bottomBar.top
                anchors.bottomMargin: 0
                anchors.topMargin: -60 * scaleFactor
                anchors.rightMargin: 0
            }

        }


    }

    MouseArea {
        id: resizeLeft
        width: 10 * scaleFactor
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10 * scaleFactor
        anchors.topMargin: 10 * scaleFactor
        cursorShape: Qt.SizeHorCursor
        // All of these functions are necessary for the drag handler to only activate when held down
        onPressed: {dragHandlerActivated = true
            leftDragHandler.enabled = true}
        onReleased: {dragHandlerActivated = false
            leftDragHandler.enabled = false
        }
        onCanceled: {dragHandlerActivated = false
            leftDragHandler.enabled = false
        }

        DragHandler{
            id: leftDragHandler
            target: resizeLeft
            enabled: false // Make sure enabled is set to false
            onEnabledChanged: if (dragHandlerActivated === true) { mainWindow.startSystemResize(Qt.LeftEdge) }
        }
    }

    MouseArea {
        id: resizeRight
        width: 10 * scaleFactor
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10 * scaleFactor
        anchors.topMargin: 10 * scaleFactor
        cursorShape: Qt.SizeHorCursor
        // All of these functions are necessary for the drag handler to only activate when held down
        onPressed: {dragHandlerActivated = true
            resizeRightHandler.enabled = true}
        onReleased: {dragHandlerActivated = false
            resizeRightHandler.enabled = false
        }
        onCanceled: {dragHandlerActivated = false
            resizeRightHandler.enabled = false
        }

        DragHandler{
            id: resizeRightHandler
            target: resizeRight
            enabled: false // Make sure enabled is set to false
            onEnabledChanged: if (dragHandlerActivated === true) { mainWindow.startSystemResize(Qt.RightEdge) }
        }
    }












    MouseArea {
        id: resizeBottom
        height: 10 * scaleFactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10 * scaleFactor
        anchors.leftMargin: 10 * scaleFactor
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor
        // All of these functions are necessary for the drag handler to only activate when held down
        onPressed: {dragHandlerActivated = true
            resizeBottomHandler.enabled = true}
        onReleased: {dragHandlerActivated = false
            resizeBottomHandler.enabled = false
        }
        onCanceled: {dragHandlerActivated = false
            resizeBottomHandler.enabled = false
        }

        DragHandler{
            id: resizeBottomHandler
            target: resizeBottom
            enabled: false // Make sure enabled is set to false
            onEnabledChanged: if (dragHandlerActivated === true) { mainWindow.startSystemResize(Qt.BottomEdge) }
        }
    }


    Rectangle {
        id: bg1
        visible: false
        color: "#00000000"
        radius: 10
        border.width: 1  * scaleFactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: windowMargin
        anchors.rightMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        //                   layer.enabled: true
        //                   z: 0
        //                   layer.effect: DropShadow {
        //                       radius: 10
        //                       transparentBorder: true
        //                       verticalOffset: 0
        //                       horizontalOffset: 0
        //                   }
    }


}












/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}
}
##^##*/
