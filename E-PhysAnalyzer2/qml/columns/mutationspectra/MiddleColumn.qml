import QtQuick 2.0
import QtQuick.Controls 6.2
import "../../controls/buttons"
import "../../controls/custom"

Item {
    id: middleColumn
    //    width: 789
    //    height: 246

    property var selectedBedFile : []
    property string selectedRefFile : ""
    property string selectedContextFile : ""
    property string previousFile : ""
    property bool usePrevFile : false

    signal sendMiddleColumnInfo(string nucleotides5, string nucleotides3, string bed, string ref, string context, string prevFile, bool usePrevFile)

    FontLoader {
        id: fixedFont
        source: "../fonts/Segoe UI.ttf"
    }

    Rectangle {
        id: mutationContext
        height: 248
        color: "#5ac1d0"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        clip: true

        PropertyAnimation {
            id: mutationContextCollapseAnimation
            target: mutationContext
            property: "height"
            easing.type: Easing.InOutQuint
            duration: 500
            to: if(mutationContext.height === 248) return 29; else return 248
        }

        MouseArea {
            id: mutationContextCollapseMouseArea
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: terminalUnderline1.top
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            onClicked: {
                mutationContextCollapseAnimation.running = true
                backend.send_collapsing_data("middleColumnCollapsed")
            }
            anchors.topMargin: 0
            anchors.rightMargin: 0
        }

        Rectangle {
            id: terminalUnderline1
            y: 29
            height: 1
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 1
            z: 0
            anchors.rightMargin: -1
        }

        Rectangle {
            id: bgBorder1
            color: "#00000000"
            radius: 10
            border.color: "#5ac1d0"
            border.width: 1
            anchors.fill: parent
            Label {
                id: step1
                y: 48
                color: "#ffffff"
                text: qsTr("Step 1")
                anchors.left: parent.left
                font.letterSpacing: 1.5
                anchors.leftMargin: 16
                font.family: fixedFont.font.family
                font.pointSize: 16
            }

            Label {
                id: bedFileSelected
                y: 55
                width: 272
                height: 14
                visible: false
                color: "#1926ba"
                text: "selected"
                anchors.left: parent.left
                anchors.leftMargin: 271
            }

            Label {
                id: referenceFileSelected
                y: 110
                width: 272
                height: 14
                visible: false
                color: "#1926ba"
                text: "selected"
                anchors.left: parent.left
                anchors.leftMargin: 271
            }

            Label {
                id: step2
                y: 103
                color: "#ffffff"
                text: qsTr("Step 2")
                anchors.left: parent.left
                font.letterSpacing: 1.5
                anchors.leftMargin: 16
                font.family: fixedFont.font.family
                font.pointSize: 16
            }

            CustomButton {
                id: addToQueueButton
                x: 609
                width: 89
                height: 24
                text: qsTr("Add to Queue")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 216
                anchors.rightMargin: 91
                font.pointSize: 10
                onClicked: mutationspectra.add_context_queue([nucleotides5PrimeEndEntry.text, nucleotides3PrimeEndEntry.text, selectedBedFile, selectedRefFile, usePrevFile])
            }
        }

        CustomButton {
            id: selectBedFileButton
            y: 44
            width: 162
            height: 40
            text: "SELECT BED FILE"
            anchors.left: parent.left
            anchors.leftMargin: 98
            font.family: fixedFont.font.family
            font.weight: Font.DemiBold
            onClicked: {
                mutationspectra.get_bed_file_name()
            }
        }

        CustomButton {
            id: selectReferenceFileButton
            y: 99
            width: 162
            height: 40
            text: "SELECT REFERENCE FILE"
            anchors.left: parent.left
            anchors.leftMargin: 98
            font.family: fixedFont.font.family
            font.weight: Font.DemiBold
            onClicked: mutationspectra.select_reference_file()
        }

        CustomTextField {
            id: nucleotides5PrimeEndEntry
            x: 405
            y: 168
            width: 129
            height: 20
            visible: true
            anchors.right: submitButton.left
            anchors.rightMargin: 173
            placeholderText: qsTr("  # of Nucleotides ")
            clip: true
            font.bold: true
            text: ""
        }

        CustomTextField {
            id: nucleotides3PrimeEndEntry
            x: 390
            y: 200
            width: 129
            height: 20
            visible: true
            anchors.right: submitButton.left
            anchors.rightMargin: 173
            placeholderText: qsTr("  # of Nucleotides ")
            clip: true
            font.bold: true
            text: ""
        }

        Label {
            id: contextLogoText
            color: "#ffffff"
            text: qsTr("CONTEXT")
            anchors.bottom: terminalUnderline1.top
            font.letterSpacing: 2
            font.family: fixedFont.font.family
            font.weight: Font.ExtraBold
            z: 2
            anchors.bottomMargin: 5
            anchors.horizontalCenterOffset: 0
            clip: false
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: nucleotides5PrimeEndLabel
            x: 32
            y: 168
            width: 373
            height: 16
            visible: true
            color: "#ffffff"
            text: qsTr("Enter number of nucleotides on the 5 prime end:")
            anchors.right: nucleotides5PrimeEndEntry.left
            font.letterSpacing: 2
            anchors.rightMargin: 0
            font.family: fixedFont.font.family
            font.weight: Font.Bold
        }

        Label {
            id: nucleotides3PrimeEndLabel
            y: 200
            width: 373
            height: 16
            visible: true
            color: "#ffffff"
            text: qsTr("Enter number of nucleotides on the 3 prime end:")
            anchors.right: nucleotides3PrimeEndEntry.left
            font.letterSpacing: 2
            anchors.rightMargin: 0
            font.family: fixedFont.font.family
            font.weight: Font.Bold
        }

        CustomRunButton {
            id: submitButton
            x: 692
            width: 74
            height: 24
            text: "Run"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 216
            anchors.rightMargin: 8
            font.pointSize: 10
            font.family: fixedFont.font.family
            font.weight: Font.DemiBold
            onClicked: {
                mutationspectra.receive_prime_ends(nucleotides5PrimeEndEntry.text, nucleotides3PrimeEndEntry.text) // sends this to main.py
                if(usePreviousFileButton.checked === true) {
                    mutationspectra.receive_filenames(previousFile, selectedRefFile)
                } else {
                   mutationspectra.receive_filenames(selectedBedFile, selectedRefFile) // sends this to main.py
                }
                mutationspectra.add_context([nucleotides5PrimeEndEntry.text, nucleotides3PrimeEndEntry.text, selectedBedFile, selectedRefFile, usePrevFile]) // calls this function in main.py

            }
        }

       CheckBox {
            id: usePreviousFileButton
            y: 56
            width: 111
            height: 16
            text: qsTr("Use previous file")
            anchors.left: parent.left
            anchors.leftMargin: 283
            onCheckStateChanged: if(usePreviousFileButton.checked === true) {
                                     usePrevFile = true
                                 } else {
                                     usePrevFile = false
                                 }
       }
    }

    Connections {
        target: mutationspectra
        function onSetFilesChosen(filetype, filepaths, file) {
            if(filetype === ".bed") {
                bedFileSelected.visible = true
                selectedBedFile = filepaths
                bedFileSelected.text = file[0]
            } else {
                referenceFileSelected.visible = true
                selectedRefFile = filepaths
                referenceFileSelected.text = file
            }
            if(bedFileSelected.visible === true && referenceFileSelected.visible === true) {
                nucleotides3PrimeEndEntry.visible = true
                nucleotides5PrimeEndEntry.visible = true
                nucleotides3PrimeEndLabel.visible = true
                nucleotides5PrimeEndLabel.visible = true
            }

        }

        function onPreviousMergedFile(file) {
            previousFile = file
        }

        function onGetMiddleColumnInfo() {
            sendMiddleColumnInfo(nucleotides5PrimeEndEntry.text, nucleotides3PrimeEndEntry.text, selectedBedFile, selectedRefFile, selectedContextFile, previousFile, usePrevFile)
        }

    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9;height:246;width:789}
}
##^##*/
