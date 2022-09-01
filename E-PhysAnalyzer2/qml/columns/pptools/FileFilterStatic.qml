import QtQuick 2.0
import QtQuick.Controls 6.2
import Qt.labs.settings 1.1
import "../../pages"
import "../../controls"
import "../../controls/custom"
import "../../controls/buttons"
import "../../javascript/app.js" as App
import "../../javascript/file-filter.js" as FileFilter
import "../../javascript/add-filter.js" as AddFilter

Item {
    id: fileFilterTopColumn
    Component.onCompleted: {AddFilter.deserialize(settings.serializedFilters)}
    Component.onDestruction: {AddFilter.serialize(appliedFiltersArray)}

    Settings {
        id: settings
        property var serializedFilters: []
        property string serializedAddFilter: ""
        property int number: 0
        property int newFiltersHeight: 46*scaleFactor;
    }

    // Properties for column height + dynamically adjustability
    property var columnHeight2: fileFilterTopColumn.height
    property bool columnCollapsed: false
    property var columnBottomAnchor: fileFilterTopColumn.bottom
    property bool programFinishedLaunching: false

//    // properties for editing
//    property int scaleFactor: 1
//    property color topBarColor: "#02323a"
//    property color topBarSecondaryColor: "#015967"
//    property color columnColor: "#5ac1d0"
//    property color backgroundColor: "#b8e3ee"
//    property color backgroundBorderColor: "#e9efec"
//    property color buttonColorDefault: "#087589"
//    property color buttonColorPressed: "#357aac"
//    property color checkBoxHighlighted: "#33aac0"
//    property color terminalUnderlineColor: "#51abb9"
//    property color terminalText: "#2aafd3"

    // Properties for the column's specific functions
    property var operators: ["<", "\u2264", "=", "\u2260", ">", "\u2265", "\u220B"]
    property var columnHeadersModel: []
    // Properties for run_pptools_filter()
    property var headersSelected: [0, 0, 0]; property var operatorsSelected: ["<", "<", "<"]; property var enteredTextFields: [0, 0, 0]
    property var fileList: []; property bool headersBool: false; property var filtersSelected: [false, false, false]
    // properties for addNewFilter()
    property int newFiltersHeight: settings.newFiltersHeight; property var appliedFiltersArray: []

    clip: true

    FontLoader {
        id: fixedFont
        source: "../../fonts/Segoe UI.ttf"
        //        source:"../fonts/LDFComicSans.ttf"
    }

    FontLoader {
        id: pragmaticaFont
        source: "../../fonts/PT Pragmatica Book.ttf"
        //          source:"../fonts/LDFComicSans.ttf"
    }

    Rectangle {
        id: fileFiltertopColumn
        //        height: columnHeight2
        height: 248 * scaleFactor
        visible: true
        color: columnColor
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10 * scaleFactor
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        clip: true

        PropertyAnimation {
            id: fileFilterTopColumnCollapseAnimation
            target: fileFiltertopColumn
            property: "height"
            easing.type: Easing.InOutQuint
            duration: 325
            to: {if(fileFiltertopColumn.height !== 29 * scaleFactor) return 29 * scaleFactor; else return 248 * scaleFactor}
        }

        Rectangle {
            id: fileFilterColumnBgBorder
            color: "#00000000"
            radius: 10
            border.color: columnColor
            border.width: 1
            anchors.fill: parent
            clip: true

            CustomCheckBoxLabel {
                id: headersLabel
                x: 149 * scaleFactor
                y: 46 * scaleFactor
                width: 93 * scaleFactor
                height: 26 * scaleFactor
                text: "Headers"
                //                color: "#ffffff"
                //                text: qsTr("Headers")
                font.family: pragmaticaFont.name
                //                font.pointSize: 12
            }

            AddFilter {
                id: filter1Label
                y: 46 * scaleFactor
                width: 220 * scaleFactor
                height: 130 * scaleFactor
                visible: true
                anchors.left: parent.left
                z: 1
                anchors.leftMargin: 285 * scaleFactor
            }

            ClearFilters {
                id: clearFiltersBtn
                y: 178 * scaleFactor
                width: 97 * scaleFactor
                height: 26 * scaleFactor
                visible: true
                anchors.left: parent.left
                colorDefault: "#087589"
                anchors.leftMargin: 286 * scaleFactor
                z: 0
                onClicked: AddFilter.clearFilters()
            }

            CustomButton {
                id: fileFilterBrowseBtn
                y: 46 * scaleFactor
                width: 108 * scaleFactor
                height: 26 * scaleFactor
                text: "File Chooser"
                anchors.left: parent.left
                anchors.leftMargin: 25 * scaleFactor
                font.weight: Font.DemiBold
                onClicked: {pptools.get_file_filter_filenames()}
            }


            CustomButton {
                id: fileFilterRunBtn
                x: 707 * scaleFactor
                y: 216 * scaleFactor
                width: 74 * scaleFactor
                height: 24 * scaleFactor
                text: "Run"
                anchors.right: parent.right
                font.family: pragmaticaFont.name
                anchors.rightMargin: 8 * scaleFactor
                font.weight: Font.DemiBold
                font.pointSize: 9 * scaleFactor
                onClicked: FileFilter.run_pptools_filter()
            }


            CustomButton {
                id: fileFilterAddToQueueButton
                x: 609 * scaleFactor
                y: 216 * scaleFactor
                width: 89 * scaleFactor
                height: 24 * scaleFactor
                text: qsTr("Add to Queue")
                anchors.right: parent.right
                font.family: pragmaticaFont.name
                anchors.rightMargin: 91 * scaleFactor
                font.pointSize: 9 * scaleFactor
            }


            FilesSelectedTerminal {
                id: filesSelectedTerminal
                x: 8*scaleFactor
                y: 79*scaleFactor
                width: 255*scaleFactor
                height: 161*scaleFactor
            }




            Rectangle {
                id: fileFilterTopColumnUnderline
                x: 1 * scaleFactor
                y: 29 * scaleFactor
                height: 1 * scaleFactor
                color: backgroundColor
                anchors.left: parent.left
                anchors.right: parent.right
                z: 0
                anchors.rightMargin: -1 * scaleFactor
                anchors.leftMargin: 1 * scaleFactor
            }




            MouseArea {
                id: fileFilterTopColumnCollapseMouseArea
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: fileFilterTopColumnUnderline.top
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                onClicked: FileFilter.collapseColumn()
                anchors.topMargin: 0
                anchors.leftMargin: 0
            }




            Label {
                id: fileFilterTopColumnLogoText
                x: 355 * scaleFactor
                y: 8 * scaleFactor
                width: 81 * scaleFactor
                height: 16 * scaleFactor
                color: "#ffffff"
                text: qsTr("FILE FILTER")
                anchors.bottom: fileFilterTopColumnUnderline.top
                font.letterSpacing: 2 * scaleFactor
                font.pointSize: 9 * scaleFactor
                z: 2
                clip: false
                font.family: fixedFont.font.family
                font.weight: Font.ExtraBold
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 5 * scaleFactor
                anchors.horizontalCenterOffset: 1 * scaleFactor
            }



        }


    }



    Connections {
        target: pptools
        function onFileList(files) {
            fileList = []
            fileList = files
        }

        function onGetHeaders(headers) {
            columnHeadersModel = headers
        }

        function onDestroySelectedFilter(filterName) {
            console.log(settings.serializedFilters)
            AddFilter.removeSelectedFilter(filterName, settings.serializedFilters)
        }
    }




}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9;height:246;width:789}
}
##^##*/
