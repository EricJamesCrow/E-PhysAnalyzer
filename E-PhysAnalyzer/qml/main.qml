import QtQuick 2.15
import QtQuick.Window
import QtQuick.Controls 2.5
import "controls"
import Qt5Compat.GraphicalEffects
import Qt.labs.platform 1.1

Window {
    id: mainWindow
    width: 1000
    height: 580
    minimumHeight: 580
    minimumWidth: 1000
    visible: true
    color: "#00000000"
    title: qsTr("E-Phys Analyzer")


    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Properties
    property int windowStatus: 0
    property int windowMargin: 5
    property bool layerEffectBool: true

    FontLoader {
        id: fixedFont
        source: "fonts/Segoe UI.ttf"
    }


    QtObject{
        id: internal

        function resetResizeBorders(){
            // Resize visibility
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            resizeWindow.visible = true
        }

        function maximizeRestore(){
            if(windowStatus == 0){
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                layerEffectBool = false
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeWindow.visible = false
                btnMaximizeRestore.btnIconSource = "../../images/svg_images/restore_icon.svg"
                backend.scrollBar(windowStatus)
                backend.colorsPage(windowStatus)
            }
            else{
                mainWindow.showNormal()
                internal.resetResizeBorders()
                windowStatus = 0
                windowMargin = 5
                layerEffectBool = true
                btnMaximizeRestore.btnIconSource = "../../images/svg_images/maximize_icon.svg"
                backend.scrollBar(windowStatus)
                backend.colorsPage(windowStatus)
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus == 1){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 5
                layerEffectBool = true
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../../images/svg_images/maximize_icon.svg"
            }
        }

        function restoreMargings(){
            windowMargin = 5
            windowStatus = 0
            layerEffectBool = true
            internal.resetResizeBorders()
            btnMaximizeRestore.btnIconSource = "../../images/svg_images/maximize_icon.svg"
        }
    }

    Rectangle {
        id: bg
        color: "#2c313c"
        border.color: "#2c313c"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        //        layer.enabled: layerEffectBool
        //        layer.effect: DropShadow {
        //            transparentBorder: true
        //            horizontalOffset: 0
        //            verticalOffset: 0
        //            radius: 5
        //            z: 0


        //        }

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1c1d20"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: topBarDescription
                    y: 21
                    height: 24
                    color: "#282c34"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0

                    Label {
                        id: topBarInfo
                        color: "#5f6a82"
                        text: qsTr("Copyright (c) 2022 Cameron Cordero / Copyright (c) 2022 Eric Crow")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.family: fixedFont.font.family
                        font.pointSize: 10
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.topMargin: 0
                    }

                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.leftMargin: 5
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if(active){
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconImage
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/activity.svg"
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: titleBarInfo
                        color: "#c3cbdd"
                        text: qsTr("E-Phys Analyzer")
                        anchors.left: iconImage.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.family: fixedFont.font.family
                        font.pointSize: 18
                        anchors.leftMargin: 5
                        anchors.rightMargin: 0
                    }
                }

                Row {
                    id: row
                    x: 895
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    TopBarButton {
                        id: minimizeWindow
                        onClicked: {
                            internal.restoreMargings()
                            mainWindow.showMinimized()
                            backend.scrollBar(0)
                        }
                    }

                    TopBarButton {
                        id: btnMaximizeRestore
                        btnIconSource: "../../images/svg_images/maximize_icon.svg"
                        onClicked: {
                            internal.maximizeRestore()
                        }
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorClicked: "#ff007f"
                        btnIconSource: "../../images/svg_images/close_icon.svg"
                        onClicked: mainWindow.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: bottomBar.top
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: rightMenu
                    color: "#00000000"
                    anchors.left: parent.horizontalCenter
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    Rectangle {
                        id: settingsMenuFrame
                        height: 100
                        color: "#00000000"
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.topMargin: 0

                        SettingsButton {
                            id: btnSettings
                            y: 60
                            width: 115
                            anchors.right: btnSetup.left
                            anchors.bottom: parent.bottom
                            anchors.rightMargin: 0
                            isActiveMenu: true
                            anchors.bottomMargin: 0
                            onClicked: {
                                btnSettings.isActiveMenu = true
                                btnSettings.isNotActiveMenu = false
                                btnSetup.isActiveMenu = false
                                btnSetup.isNotActiveMenu = true
                                helpButton.isActiveMenu = false
                                helpButton.isNotActiveMenu = true
                                stackView.push(Qt.resolvedUrl("pages/runpage.qml"))
                            }
                        }

                        SetupButton {
                            id: btnSetup
                            y: 60
                            width: 115
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            isActiveMenu: false
                            anchors.bottomMargin: 0
                            onClicked: {
                                btnSettings.isActiveMenu = false
                                btnSettings.isNotActiveMenu = true
                                btnSetup.isActiveMenu = true
                                btnSetup.isNotActiveMenu = false
                                helpButton.isActiveMenu = false
                                helpButton.isNotActiveMenu = true
                                stackView.push(Qt.resolvedUrl("pages/settingspage.qml"))
                                backend.gimmeGraphsStackView()
                            }
                        }

                        HelpButton {
                            id: helpButton
                            y: 60
                            width: 115
                            height: 40
                            anchors.left: btnSetup.right
                            anchors.bottom: parent.bottom
                            anchors.leftMargin: 0
                            isActiveMenu: false
                            anchors.bottomMargin: 0
                            onClicked: {
                                btnSettings.isActiveMenu = false
                                btnSettings.isNotActiveMenu = true
                                btnSetup.isActiveMenu = false
                                btnSetup.isNotActiveMenu = true
                                helpButton.isActiveMenu = true
                                helpButton.isNotActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/README.qml"))
                            }
                        }
                    }

                    StackView {
                        initialItem: Qt.resolvedUrl("pages/runpage.qml")
                        id: stackView
                        y: 100
                        width: 495
                        height: 394
                        anchors.top: settingsMenuFrame.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 0
                        clip: false
                    }
                    //                    Loader {
                    //                        id: pagesView
                    //                        source: Qt.resolvedUrl("pages/runpage.qml")
                    //                        anchors.left: parent.left
                    //                        anchors.right: parent.right
                    //                        anchors.top: settingsMenuFrame.bottom
                    //                        anchors.bottom: parent.bottom
                    //                        clip: true

                    //                    }
                }

                Rectangle {
                    id: leftMenu
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0


                    Loader {
                        id: loader
                        width: 496
                        height: 45
                        anchors.top: parent.top
                        clip: false
                        source: Qt.resolvedUrl("pages/fileLabels.qml")
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 0

                        Loader {
                            id: filesView
                            x: 0
                            y: 39
                            width: 496
                            height: 442
                            anchors.top: loader.bottom
                            source: Qt.resolvedUrl("pages/chosenFiles.qml")
                            anchors.horizontalCenterOffset: 0
                            clip: false
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.topMargin: 0
                        }
                    }
                }
            }

            Rectangle {
                id: bottomBar
                x: 0
                y: 36
                height: 24
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                clip: false
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0

                MouseArea {
                    id: resizeWindow
                    x: 951
                    y: 0
                    width: 25
                    height: 25
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    cursorShape: Qt.SizeFDiagCursor

                    DragHandler{
                        target: null
                        onActiveChanged: if (active){
                                             mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                         }
                    }

                    Image {
                        id: resizeImage
                        width: 16
                        height: 16
                        anchors.fill: parent
                        source: "../images/svg_images/resize_icon.svg"
                        anchors.leftMargin: 5
                        anchors.topMargin: 5
                        sourceSize.height: 16
                        sourceSize.width: 16
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
                    }
                }
            }
        }
    }
    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.LeftEdge) }
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.RightEdge) }
        }
    }

    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.BottomEdge) }
        }

        Connections {
            target: backend
            function onSetStackView() {
                stackView.push(Qt.resolvedUrl("pages/runpage.qml"))
            }
        }
    }

    Rectangle {
        id: bg1
        color: "#00000000"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: windowMargin
        anchors.rightMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        layer.enabled: true
        z: 0
        layer.effect: DropShadow {
            radius: 10
            transparentBorder: true
            verticalOffset: 0
            horizontalOffset: 0
        }
    }

    Connections {
        target: backend
        function onGetWindowMargins() {
            if(windowStatus == 0) {
                backend.scrollBar(0)
                backend.colorsPage(0)
            } else {
                backend.scrollBar(1)
                backend.colorsPage(1)
            }

        }
    }

}







/*##^##
Designer {
    D{i:0;formeditorZoom:0.5;height:580;width:1000}D{i:1}D{i:2}D{i:7}D{i:6}D{i:9}D{i:10}
D{i:11}D{i:8}D{i:13}D{i:14}D{i:15}D{i:12}D{i:5}D{i:19}D{i:20}D{i:21}D{i:18}D{i:22}
D{i:17}D{i:25}D{i:24}D{i:23}D{i:16}D{i:28}D{i:29}D{i:27}D{i:26}D{i:4}D{i:3}D{i:31}
D{i:30}D{i:33}D{i:32}D{i:35}D{i:36}D{i:34}D{i:37}D{i:39}
}
##^##*/
