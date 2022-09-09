import QtQuick 2.15
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0
import "../controls/custom"
import "../controls/buttons"
import "settings"
import "../javascript/graph-settings.js" as GraphSettings

Item {
    id: settingsPage1
    // Properties for editing
    width: 663
    height: 704
    Component.onCompleted:{ runDeserialization(graphSettings1.objects1, graphSettings1.regionAxis1); backend.run_starting_animation()}
    Component.onDestruction: { runSerialization() }

    signal runSerialization()
    signal runDeserialization(var objects)

    Connections {
        target: regions
        function onEmitSerializedObjects1(objects, axis) {
            graphSettings1.objects1 = objects
            graphSettings1.regionAxis1 = axis
        }
    }

    Settings {
        id: graphSettings1
        property var objects1: []
        property int regionAxis1: 5
    }

    Settings {
        id: postAnalysisSettings1
        property var xmin: ""
        property var xmax: ""
        property var ymin: ""
        property var ymax: ""
    }

    Settings {
        id: minuteAveragedSettings1
        property var xmin: ""
        property var xmax: ""
        property var ymin: ""
        property var ymax: ""
    }

    Settings {
        id: baselineSettings1
        property var value: ""
        property var time: ""
    }


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
            opacity: 0

            OpacityAnimator on opacity {
                id: regionsOpacity
                from: 0
                to: 1.0
                duration: 250
                running: false
            }
        }

        PostAnalysis {
            id: postAnalysisSection
            x: 26
            y: 90
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 207
            anchors.leftMargin: 279
            opacity: 0

            OpacityAnimator on opacity {
                id: postAnalysisOpacity
                from: 0
                to: 1.0
                duration: 200
                running: false
            }
        }




        MinuteAveraged {
            id: minuteAveragedSection
            x: 19
            y: 236
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 207
            anchors.leftMargin: 279
            opacity: 0

            OpacityAnimator on opacity {
                id: minuteAveragedOpacity
                from: 0
                to: 1.0
                duration: 200
                running: false
            }
        }




        ColorCode {
            id: colorCodeSection
            x: 21
            y: 90
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 13
            anchors.leftMargin: 473
            opacity: 0

            OpacityAnimator on opacity {
                id: colorCodeOpacity
                from: 0
                to: 1.0
                duration: 200
                running: false
            }
        }









        Baseline {
            id: baselineSection
            x: 32
            y: 236
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 13
            anchors.leftMargin: 473
            opacity: 0

            OpacityAnimator on opacity {
                id: baselineOpacity
                from: 0
                to: 1.0
                duration: 200
                running: false
            }
        }







        Zscore {
            id: zScoreSection
            x: 28
            y: 388
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 207
            anchors.leftMargin: 279
            opacity: 0

            OpacityAnimator on opacity {
                id: zScoreOpacity
                from: 0
                to: 1.0
                duration: 200
                running: false
            }
        }






        GeneratePattern{
            id: generatePatternBnt
            x: 26
            y: 25
            opacity: 0

            OpacityAnimator on opacity {
                id: generatePatternOpacity
                from: 0
                to: 1.0
                duration: 100
                running: false
            }
        }








        NewRegion {
            id: newRegionBtn1
            x: 144
            y: 25
            width: 112
            height: 20
            opacity: 0

            OpacityAnimator on opacity {
                id: newRegionOpacity
                from: 0
                to: 1.0
                duration: 100
                running: false
            }
        }







        CustomButton {
            id: resetBtn
            x: 523
            y: 424
            width: 78
            height: 20
            text: "Reset"
            opacity: 0

            OpacityAnimator on opacity {
                id: resetBtnOpacity
                from: 0
                to: 1.0
                duration: 100
                running: false
            }
        }
    }

    Connections {
        target: backend
        function onAnimateObject(object) {
            GraphSettings.animate(object)
        }
    }

}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
