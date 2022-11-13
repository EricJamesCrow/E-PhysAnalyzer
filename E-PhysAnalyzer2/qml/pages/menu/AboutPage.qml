import QtQuick 2.0
import QtQuick.Controls 2.5
import "../../controls/buttons"
import "../../javascript/app.js" as App

Item {
    id: aboutPage
    focus: true

    property url btnIconSource: "../../images/svg_images/close_icon.svg"

    Rectangle {
        id: about
//        x: 689 * scaleFactor
//        y: 339 * scaleFactor
        visible: true
        color: settings.columnColor
        radius: 5 * scaleFactor
        border.color: settings.columnColor
        anchors.fill: parent
        z: 1

        Label {
            id: aboutPageText
            width: 486 * scaleFactor
            height: 488 * scaleFactor
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 75 * scaleFactor
            text: "E-Phys Analyzer is a program designed to save users time by analyzing and visualizing electrophysiology data in bulk. This program takes .atf files from Clampfit and creates two graphs and two files. The files aim to make the data easier to interpret by processing the data creating files that are comparable. The first file gives a full breakdown of datapoints, including converting the time from miliseconds (ms) to minutes, normalizing the peak amplitudes to the baseline reads, creates timepoints relative to drug addition, and calculates z-statistics to determine outlier datapoints. The second file is a minute averaged graph, that will average datapoints with set axis limits for efficient comparisions between experiments. The program then creates graphs from these two files, which include color coding regions on the graph to quickly identify time points and regions with full control over the output. There are options for different output formats, image quality, and more!"
            wrapMode: Text.WordWrap
            font.pointSize: 12 * scaleFactor
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: aboutTopBar
            height: 30 * scaleFactor
            color: settings.buttonColorDefault
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            radius: 5 * scaleFactor

            Rectangle {
                id: aboutTopBarBottom
                width: aboutTopBar.width
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
                onClicked: App.displayDropDownMenuPages("about")
                btnIconSource: "../../../images/svg_images/close_icon.svg"
                btnColorDefault: "#00000000"
            }

            Label {
                id: aboutPageTitle
                x: 295 * scaleFactor
                width: 95 * scaleFactor
                height: 14 * scaleFactor
                color: "#ffffff"
                text: qsTr("ABOUT")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.top: parent.top
                font.letterSpacing: 1 * scaleFactor
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12 * scaleFactor
                anchors.verticalCenterOffset: 0
                anchors.topMargin: 5 * scaleFactor
                anchors.leftMargin: 0
            }
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }
    }

}




/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
