import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Dialogs
import QtCore 6.2
import "../controls"
import "../controls/buttons"
import "../controls/custom" // For creating dynamic object, delete this import statement later
import "../javascript/input-fields.js" as InputFields
import "../javascript/graph-settings.js" as GraphSettings
import "../javascript/settings.js" as Settings
import "../javascript/run-analysis.js" as Analysis
//import Qt5Compat.GraphicalEffects

Item {
    id: content
    width: 1580 * scaleFactor
    height: 820 * scaleFactor

    //    property color topBarColor: settings.topBarColor
    //    property color terminalText: settings.terminalText
    //    property color backgroundColor: settings.backgroundColor
    //      property color columnColor: settings.columnColor
    //     property color buttonColorDefault: settings.buttonColorDefault
    property var files: []
    property var fileObjects: []
    property var filesBasename: []
    property int objectHeight: 10 * scaleFactor
    property int flickableContentHeight: 696 * scaleFactor
    signal getRegions()
    signal getGraphSettings()
    property var regions: ""
    property string colorSelected: ""
    property int time: 10
    property bool display: true
    property var axisLimits: ""
    property bool single: false
    property int dpi: 300
    property string defaultcolor: ""
    property bool remove: true
    property var score: ""
    property var fileData: []

    //List for graphsettings pages
    //May change this to a doubly linked list; ability to add pages
    property var graphSettingsPage: ["GraphSettings.qml", "GraphSettings2.qml", "GraphSettings3.qml"]
    property int pageSelected: 1

    // Properties for editing
//    property int scaleFactor: settings.scaleFactor
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

    Connections {
        target: mainWindow
        function onAdjustHeight(scale) {
            Settings.adjustInputFields(scale)
        }
    }

    Connections {
        target: backend
        function onEmitRegions(region) {
            regions = region
        }
    }

    Connections {
        target: rightContentLoader.item
        function onEmitReturnData(colorData, timeData, displayData, axislimitsData, singleData,
                                  dpiData, defaultcolorData, removeData, scoreData) {
            colorSelected = colorData;
            time = timeData;
            display = displayData;
            axisLimits = axislimitsData;
            single = singleData;
            dpi = dpiData;
            defaultcolor = defaultcolorData;
            remove = removeData;
            score = scoreData;
        }
    }

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
            radius: 10 * scaleFactor
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
                radius: 10 * scaleFactor
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
                    id: leftArrow
                    y: 318 * scaleFactor
                    width: 20 * scaleFactor
                    height: 20 * scaleFactor
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.verticalCenterOffset: 5 * scaleFactor
                    anchors.leftMargin: 100 * scaleFactor
                    z: 1
                    checkedState: false
                    arrowRotation: 0

                    MouseArea {
                        id: leftArrowMouseArea
                        anchors.fill: parent
                        onClicked: GraphSettings.prevPage()
                    }
                }

                EphysArrow {
                    id: rightArrow
                    x: 600 * scaleFactor
                    width: 20 * scaleFactor
                    height: 20 * scaleFactor
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 100 * scaleFactor
                    anchors.verticalCenterOffset: 5 * scaleFactor
                    arrowRotation: 180
                    checkedState: true

                    MouseArea {
                        id: rightAreaMouseArea
                        anchors.fill: parent
                        onClicked: GraphSettings.nextPage()
                    }
                }

                Button {
                    id: circle1
                    width: 10 * scaleFactor
                    height: 10 * scaleFactor
                    text: "Circle button"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 5 * scaleFactor
                    anchors.horizontalCenter: parent.horizontalCenter
                    display: AbstractButton.IconOnly
                    flat: true
                    down: false
                    background: Rectangle {
                        id: selectedPage2
                        radius: width * 0.5
                        color: pageSelected === 2 ? "#2aafd3" : "#802aafd3"
                        border.width: 0
                        implicitWidth: 140 * scaleFactor
                        implicitHeight: width
                    }

                    Button {
                        id: circle
                        x: 325 * scaleFactor
                        width: 10 * scaleFactor
                        height: 10 * scaleFactor
                        text: "Circle button"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 30 * scaleFactor
                        display: AbstractButton.IconOnly
                        flat: true
                        down: false
                        background: Rectangle {
                            id: selectedPage1
                            implicitWidth: 140 * scaleFactor
                            implicitHeight: width
                            border.width: 0
                            color: pageSelected === 1 ? "#2aafd3" : "#802aafd3"
                            radius: width * 0.5
                        }

                    }

                    Button {
                        id: circle2
                        x: 60 * scaleFactor
                        width: 10 * scaleFactor
                        height: 10 * scaleFactor
                        flat: true
                        down: false
                        text: "Circle button"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 30 * scaleFactor
                        display: AbstractButton.IconOnly
                        background: Rectangle {
                            id: selectedPage3
                            radius: width * 0.5
                            border.width: 0
                            color: pageSelected === 3 ? "#2aafd3" : "#802aafd3"
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
//                contentWidth: 663 * scaleFactor
//                contentHeight: 704 * scaleFactor
                clip: true
//                ScrollBar.vertical: CustomScrollBar {
//                    id: scrollBarVerticalLeftContent1
//                    //                    parent: rightContentFlickable.parent
//                    //                    anchors.right: rightContentFlickable.right
//                    //                    anchors.top: rightContentFlickable.top
//                    //                    anchors.bottom: rightContentFlickable.bottom
//                    btnColorDefault: settings.buttonColorDefault
//                    backgroundColorDefault: settings.backgroundColor
//                    width: 10* scaleFactor
//                }
//                ScrollBar.horizontal: CustomScrollBar {
//                    id: scrollBarHorizontalRightContent
//                    //                    parent: rightContentFlickable.parent
//                    //                    anchors.left: rightContentFlickable.left
//                    //                    anchors.right: rightContentFlickable.right
//                    //                    anchors.bottom: rightContentFlickable.bottom
//                    btnColorDefault: settings.buttonColorDefault
//                    backgroundColorDefault: settings.backgroundColor
//                    height: 17 * scaleFactor
//                }

                Loader {
                    id: rightContentLoader
                    x: 0
                    source: "GraphSettings.qml"
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
                        target: rightContentLoader.item
                        property: "topBarColor"
                        value: settings.topBarColor
                    }

                    Binding {
                        target: rightContentLoader.item
                        property: "topBarSecondaryColor"
                        value: settings.topBarSecondaryColor
                    }

                    Binding {
                        target: rightContentLoader.item
                        property: "columnColor"
                        value: settings.columnColor
                    }

                    Binding {
                        target: rightContentLoader.item
                        property: "backgroundColor"
                        value: settings.backgroundColor
                    }

                    Binding {
                        target: rightContentLoader.item
                        property: "backgroundBorderColor"
                        value: settings.backgroundBorderColor
                    }

                    Binding {
                        target: rightContentLoader.item
                        property: "buttonColorDefault"
                        value: settings.buttonColorDefault
                    }

                    Binding {
                        target: rightContentLoader.item
                        property: "buttonColorPressed"
                        value: settings.buttonColorPressed
                    }

                    Binding {
                        target: rightContentLoader.item
                        property: "checkBoxHighlighted"
                        value: settings.checkBoxHighlighted
                    }

                    Binding {
                        target: rightContentLoader.item
                        property: "terminalUnderlineColor"
                        value: settings.terminalUnderlineColor
                    }

                    Binding {
                        target: rightContentLoader.item
                        property:"addFilterSvgIcon"
                        value: settings.addFilterSvgIcon
                    }

                    Binding {
                        target: rightContentLoader.item
                        property:"checkBoxIcon"
                        value: settings.checkBoxIcon
                    }


                    Binding {
                        target: rightContentLoader.item
                        property: "scaleFactor"
                        value: scaleFactor
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
                x: 2 * scaleFactor
                y: 2 * scaleFactor
                height: 740 * scaleFactor
                anchors.bottomMargin: -2 * scaleFactor
                anchors.rightMargin: -2 * scaleFactor
                anchors.leftMargin: 2 * scaleFactor
                anchors.topMargin: 2 * scaleFactor
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
            radius: 10 * scaleFactor
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
                height: 36 * scaleFactor
                opacity: 1
                color: topBarColor//"#001434"
                radius: 10* scaleFactor
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
                    x: 243 * scaleFactor
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
                    x: 425 * scaleFactor
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
                    x: 640 * scaleFactor
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

            Flickable {
                id: leftContentFlickable
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: leftContentTopBar.bottom
                anchors.bottom: parent.bottom
                contentWidth: 847 * scaleFactor
                contentHeight: flickableContentHeight
                anchors.rightMargin: 0
                z: -1
                anchors.topMargin: 8
                ScrollBar.vertical: CustomScrollBar {
                    id: scrollBarVerticalLeftContent2
                    width: 10* scaleFactor
                    opacity: 0
                }
                anchors.bottomMargin: 0
                clip: true
                anchors.leftMargin: 0
                Keys.onUpPressed: scrollBarVerticalLeftContent2.decrease()
                Keys.onDownPressed: scrollBarVerticalLeftContent2.increase()

                Rectangle {
                    id: leftContentLoader
                    x: 0
                    y: 36 * scaleFactor
                    color: "#00000000"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    z: -1
                    anchors.topMargin: 0
                    clip: true
                }
            }


            Rectangle {
                id: leftContentBg
                x: 0
                y: 36 * scaleFactor
                color: "#3389f7fe"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: leftContentTopBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: -36 * scaleFactor
                clip: true
                z: -1
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
                id: leftContentBgDS
                visible: true
                color: backgroundColor
                radius: 10
                anchors.fill: parent
                z: -3
            }



            Rectangle {
                id: leftContentDropShadow
                x: 2 * scaleFactor
                y: 2 * scaleFactor
                height: 740 * scaleFactor
                opacity: 0.25
                visible: true
                color: "#000000"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: -2 * scaleFactor
                anchors.leftMargin: 2 * scaleFactor
                z: -4
                anchors.topMargin: 2 * scaleFactor
                anchors.bottomMargin: -2 * scaleFactor
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
            onClicked: Analysis.runAnalyzeData()


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
    D{i:0;formeditorZoom:0.25}
}
##^##*/
