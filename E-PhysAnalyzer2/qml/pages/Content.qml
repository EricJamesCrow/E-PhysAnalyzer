import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Dialogs
import QtCore 6.2
import "../controls"
import "../controls/buttons"
import "../controls/custom" // For creating dynamic object, delete this import statement later
import "../javascript/input-fields.js" as InputFields
//import Qt5Compat.GraphicalEffects

Item {
    width: 1580
    height: 820

    //    property color topBarColor: settings.topBarColor
    //    property color terminalText: settings.terminalText
    //    property color backgroundColor: settings.backgroundColor
    //      property color columnColor: settings.columnColor
    //     property color buttonColorDefault: settings.buttonColorDefault
    property var files: []
    property var fileObjects: []
    property var filesBasename: []
    property int objectHeight: 20

    // Properties for editing
    property int scaleFactor: 1
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

    x: 10

    Rectangle {
        id: bg
        color: backgroundColor //"#4e7cff"
        anchors.fill: parent
        z: 0

        Rectangle {
            id: rightContent
            opacity: 1
            visible: true
            color: "#00000000"
            radius: 10
            anchors.left: leftContent.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            z: 1
            anchors.topMargin: 60 * scaleFactor
            anchors.bottomMargin: 20 * scaleFactor
            anchors.leftMargin: 30 * scaleFactor
            anchors.rightMargin: 20 * scaleFactor
            clip: false
            //            layer.enabled: true
            //            layer.effect: DropShadow {
            //                verticalOffset: 2 * scaleFactor
            //                horizontalOffset: 2 * scaleFactor
            //                color: "#80000000"
            //            }

            Rectangle {
                id: rightContentTopBar
                height: 36 * scaleFactor
                opacity: 1
                color: topBarColor//"#001434"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                z: 0


                Rectangle {
                    id: rightTopBarBottom
                    x: 0
                    y: 27 * scaleFactor
                    color: topBarColor//"#001434"
                    z: -1
                    width: rightContentTopBar.width
                    height: 18 * scaleFactor
                    opacity: 1
                }

                EphysArrow {
                    id: triangle
                    y: 318 * scaleFactor
                    width: 62
                    height: 63 * scaleFactor
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 100
                    z: 1
                    anchors.verticalCenterOffset: 7 * scaleFactor
                    arrowRotation: 0
                }

                EphysArrow {
                    id: triangle1
                    x: 600
                    width: 94
                    height: 75 * scaleFactor
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 100
                    anchors.verticalCenterOffset: 7
                    arrowRotation: 180
                }

                Button {
                    id: circle1
                    width: 10
                    height: 10
                    text: "Circle button"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    display: AbstractButton.IconOnly
                    flat: true
                    down: false
                    background: Rectangle {
                        radius: width * 0.5
                        color: "#802aafd3"//"#4abece"
                        border.width: 0
                        implicitWidth: 140 * scaleFactor
                        implicitHeight: width
                    }

                    Button {
                        id: circle
                        x: 325
                        width: 10
                        height: 10
                        text: "Circle button"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 30
                        display: AbstractButton.IconOnly
                        flat: true
                        down: false
                        background: Rectangle {
                            implicitWidth: 140 * scaleFactor
                            implicitHeight: width
                            border.width: 0
                            color: terminalText //"#4abece"
                            radius: width * 0.5
                        }

                    }

                    Button {
                        id: circle2
                        x: 60
                        width: 10
                        height: 10
                        flat: true
                        down: false
                        text: "Circle button"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        display: AbstractButton.IconOnly
                        background: Rectangle {
                            radius: width * 0.5
                            border.width: 0
                            color: "#802aafd3"//"#4abece"
                            implicitWidth: 140 * scaleFactor
                            implicitHeight: width
                        }
                    }
                }
            }

            Flickable {
                id: rightContentFlickable
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rightContentTopBar.bottom
                anchors.bottom: parent.bottom
                z: -1
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                // flickable settings
                contentWidth: 663
                contentHeight: 704
                clip: true
                ScrollBar.vertical: CustomScrollBar {
                    id: scrollBarVerticalLeftContent1
//                    parent: rightContentFlickable.parent
//                    anchors.right: rightContentFlickable.right
//                    anchors.top: rightContentFlickable.top
//                    anchors.bottom: rightContentFlickable.bottom
                    btnColorDefault: settings.buttonColorDefault
                    backgroundColorDefault: settings.backgroundColor
                    width: 10* scaleFactor
                }
                ScrollBar.horizontal: CustomScrollBar {
                    id: scrollBarHorizontalRightContent
//                    parent: rightContentFlickable.parent
//                    anchors.left: rightContentFlickable.left
//                    anchors.right: rightContentFlickable.right
//                    anchors.bottom: rightContentFlickable.bottom
                    btnColorDefault: settings.buttonColorDefault
                    backgroundColorDefault: settings.backgroundColor
                    height: 17 * scaleFactor
                }

                Loader {
                    id: rightContentLoader
                    x: 0
                    source: "SettingsPage.qml"
                    clip: true
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    z: -1
                    anchors.bottomMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    Binding {
                        target: leftContentLoader.item
                        property: "topBarColor"
                        value: settings.topBarColor
                    }

                    Binding {
                        target: leftContentLoader.item
                        property: "topBarSecondaryColor"
                        value: settings.topBarSecondaryColor
                    }

                    Binding {
                        target: leftContentLoader.item
                        property: "columnColor"
                        value: settings.columnColor
                    }

                    Binding {
                        target: leftContentLoader.item
                        property: "backgroundColor"
                        value: settings.backgroundColor
                    }

                    Binding {
                        target: leftContentLoader.item
                        property: "backgroundBorderColor"
                        value: settings.backgroundBorderColor
                    }

                    Binding {
                        target: leftContentLoader.item
                        property: "buttonColorDefault"
                        value: settings.buttonColorDefault
                    }

                    Binding {
                        target: leftContentLoader.item
                        property: "buttonColorPressed"
                        value: settings.buttonColorPressed
                    }

                    Binding {
                        target: leftContentLoader.item
                        property: "checkBoxHighlighted"
                        value: settings.checkBoxHighlighted
                    }

                    Binding {
                        target: leftContentLoader.item
                        property: "terminalUnderlineColor"
                        value: settings.terminalUnderlineColor
                    }

                    Binding {
                        target: leftContentLoader.item
                        property:"addFilterSvgIcon"
                        value: settings.addFilterSvgIcon
                    }

                    Binding {
                        target: leftContentLoader.item
                        property:"checkBoxIcon"
                        value: settings.checkBoxIcon
                    }


                    Binding {
                        target: leftContentLoader.item
                        property: "scaleFactor"
                        value: settings.scaleFactor
                    }
                }
            }


            Rectangle {
                id: rightContentBg
                visible: true
                color: "#4089f7fe"
                radius: 10
                anchors.fill: parent
                z: -2
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#4089f7fe"
                    }

                    GradientStop {
                        position: 1
                        color: "#4066a6ff"
                    }
                    orientation: Gradient.Vertical
                }
            }

            Rectangle {
                id: rightContentBgDS
                visible: true
                color:backgroundColor
                radius: 10
                anchors.fill: parent
                z: -3
            }




            Rectangle {
                id: rightContentDropShadow
                x: 2
                y: 2
                height: 740
                anchors.bottomMargin: -2
                anchors.rightMargin: -2
                anchors.leftMargin: 2
                anchors.topMargin: 2
                opacity: 0.25
                visible: true
                z: -4
                color: "black"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                clip: true
            }



        }








        Rectangle {
            id: leftContent
            width: 847 * scaleFactor
            opacity: 1
            color: "#00000000"
            radius: 10
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 60 * scaleFactor
            anchors.bottomMargin: 20 * scaleFactor
            anchors.leftMargin: 20 * scaleFactor
            //            layer.enabled: true
            //            layer.effect: DropShadow {
            //                verticalOffset: 2 * scaleFactor
            //                horizontalOffset: 2 * scaleFactor
            //                color: "#80000000"
            //            }
            clip: false
            Rectangle {
                id: leftContentTopBar
                height: 36
                opacity: 1
                color: topBarColor//"#001434"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                clip: false
                anchors.rightMargin: 0
                z: 0
                anchors.topMargin: 0
                Rectangle {
                    id: leftTopBarBottom
                    y: 27 * scaleFactor
                    height: leftContentTopBar.height / 2
                    opacity: 1
                    color: topBarColor//"#001434"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    z: -1
                }

                Label {
                    id: filesLabel
                    x: 95 * scaleFactor
                    y: 14 * scaleFactor
                    width: 40 * scaleFactor
                    height: 22 * scaleFactor
                    color:terminalText //"#4abece"
                    text: qsTr("Files")
                    font.weight: Font.ExtraBold
                    font.bold: true
                    font.pointSize: 12 * scaleFactor
                }

                Label {
                    id: drugNameLabel
                    x: 243
                    y: 14 * scaleFactor
                    width: 93 * scaleFactor
                    height: 22 * scaleFactor
                    color: terminalText //"#4abece"
                    text: qsTr("Drug Name")
                    font.pointSize: 12 * scaleFactor
                    font.bold: true
                    font.weight: Font.ExtraBold
                }

                Label {
                    id: traceNumberLabel
                    x: 425
                    y: 14 * scaleFactor
                    width: 111 * scaleFactor
                    height: 22 * scaleFactor
                    color:terminalText //"#4abece"
                    text: qsTr("Trace Number")
                    font.pointSize: 12 * scaleFactor
                    font.bold: true
                    font.weight: Font.ExtraBold
                }

                Label {
                    id: excludedTracesLabel
                    x: 640
                    y: 14 * scaleFactor
                    width: 122 * scaleFactor
                    height: 22 * scaleFactor
                    color:terminalText //"#4abece"
                    text: qsTr("Excluded Traces")
                    font.pointSize: 12 * scaleFactor
                    font.bold: true
                    font.weight: Font.ExtraBold
                }
                anchors.leftMargin: 0
            }

            Rectangle {
                id: leftContentLoader
                color: "#3389f7fe"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: leftContentTopBar.bottom
                anchors.bottom: parent.bottom
                clip: true
                z: -1
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#4c89f7fe"
                    }

                    GradientStop {
                        position: 0.02283
                        color: "#4089f7fe"
                    }

                    GradientStop {
                        position: 1
                        color: "#4066a6ff"
                    }

                    orientation: Gradient.Vertical
                }
            }

            Rectangle {
                id: leftContentBg
                visible: true
                color: backgroundColor
                radius: 10
                anchors.fill: parent
                z: -3
            }

            Rectangle {
                id: leftContentDropShadow
                x: 2
                y: 2
                height: 740
                opacity: 0.25
                visible: true
                color: "#000000"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: -2
                anchors.leftMargin: 2
                z: -4
                anchors.topMargin: 2
                anchors.bottomMargin: -2
                clip: true
            }
        }






        EphysCustomButton {
            id: browseBtn
            btnImage: "../../../images/svg_images/open_icon.svg"
            x: 20 * scaleFactor
            y: 12 * scaleFactor
            width: 51 * scaleFactor
            height: 34 * scaleFactor
            onClicked: fileDialog.open()
        }





        FileDialog {
            id: fileDialog
            //            nameFilters:["ATF files (*.atf)"]
            fileMode: FileDialog.OpenFiles
            currentFolder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
            onAccepted: InputFields.create_objects(selectedFiles)
        }





        EphysCustomButton {
            id: runBtn
            btnImage: "../../../images/svg_images/play.svg"
            x: 99 * scaleFactor
            y: 12 * scaleFactor
            width: 51 * scaleFactor
            height: 34 * scaleFactor


        }





        Connections {
            target: backend
            function onAddObject(selectedFile) {
                InputFields.create(selectedFile)
            }
        }








    }

}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:16}D{i:13}D{i:29}
}
##^##*/
