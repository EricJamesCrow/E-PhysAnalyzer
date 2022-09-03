import QtQuick 2.15
import QtQuick.Controls 2.5
import "../controls/custom"
import "../controls/buttons"
import "settings"

Item {
    id: settingsPage

    Rectangle {
        id: rightContentLoader

        // Images
        property string addFilterSvgIcon: "../../images/svg_images/plus_icon_087589.svg"
        property string closeBtnSvgIcon: "../../images/svg_images/close_icon.svg"
        property string checkBoxIcon: "../../images/svg_images/checkmark_icon_087589.svg"


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


        FontLoader {
            id: pragmaticaFont
            source: "fonts/PT Pragmatica Book.ttf"
        }


        color: "#00000000"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        height: 704
        opacity: 1
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




        Regions {
            id: regions
            x: 26
            y: 61
        }





        PostAnalysis {
            id: postAnalysisSection
            x: 26
            y: 90
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 207
            anchors.leftMargin: 279
        }




        MinuteAveraged {
            id: minuteAveragedSection
            x: 19
            y: 236
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 207
            anchors.leftMargin: 279
        }




        ColorCode {
            id: colorCodeSection
            x: 21
            y: 90
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 13
            anchors.leftMargin: 473
        }









        Baseline {
            id: baselineSection
            x: 32
            y: 236
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 13
            anchors.leftMargin: 473
        }







        Zscore {
            id: zScoreSection
            x: 28
            y: 388
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 207
            anchors.leftMargin: 279
        }






        CustomButton {
            id: generatePatternBnt
            x: 26
            y: 25
            width: 112
            height: 20
            text: "Generate Pattern"
        }








        CustomButton {
            id: newRegionBtn
            x: 144
            y: 25
            width: 112
            height: 20
            text: "New Region"
        }







        CustomButton {
            id: resetBtn
            x: 523
            y: 424
            width: 78
            height: 20
            text: "Reset"
        }
    }

}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
