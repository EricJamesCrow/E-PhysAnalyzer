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
    width: 663 * scaleFactor
    height: 704 * scaleFactor
    Component.onCompleted: GraphSettings.startDeserialization(graphSettings1, postAnalysisSettings1, minuteAveragedSettings1, graphQualitySettings1, baselineSettings1, zscoreSettings1)
    Component.onDestruction: runSerialization()

    signal runSerialization()
    signal runDeserialization(var objects)
    signal postAnalysisSettings(string xmin, string xmax, string ymin, string ymax)
    signal minuteAveragedSettings(string xmin, string xmax, string ymin, string ymax)
    signal graphQualitySettings(bool single, int quality, string dpi, string defaultColor)
    signal baselineSettings(string color, string time, bool display)
    signal zscoreSettings(bool remove, string score)
    signal reset()

    // Properties for editing
    property var scaleFactor: 1
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
        property string xmin: ""
        property string xmax: ""
        property string ymin: ""
        property string ymax: ""
    }

    Settings {
        id: minuteAveragedSettings1
        property string maxmin: ""
        property string maxmax: ""
        property string maymin: ""
        property string maymax: ""
    }

    Settings {
        id: graphQualitySettings1
        property bool single: false
        property int quality: 1
        property string dpi: ""
        property string defaultColor: ""
    }

    Settings {
        id: baselineSettings1
        property string color: ""
        property string time: ""
        property bool display: true
    }

    Settings {
        id: zscoreSettings1
        property bool remove: true
        property string score: ""
    }


    Rectangle {
        id: rightContentLoader
        // Images
        property string addFilterSvgIcon: "../../images/svg_images/plus_icon_087589.svg"
        property string closeBtnSvgIcon: "../../images/svg_images/close_icon.svg"
        property string checkBoxIcon: "../../images/svg_images/checkmark_icon_087589.svg"


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
        height: 704 * scaleFactor
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
            x: 26 * scaleFactor
            y: 61 * scaleFactor
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
//            x: 26 * scaleFactor
            y: 90 * scaleFactor
            x: 279 * scaleFactor
            width: 177 * scaleFactor
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.rightMargin: 207 * scaleFactor
//            anchors.leftMargin: 279 * scaleFactor
            opacity: 0
            // GraphSettings.qml
            onXminChanged: postAnalysisSettings1.xmin = postAnalysisSection.xmin
            onXmaxChanged: postAnalysisSettings1.xmax = postAnalysisSection.xmax
            onYminChanged: postAnalysisSettings1.ymin = postAnalysisSection.ymin
            onYmaxChanged: postAnalysisSettings1.ymax = postAnalysisSection.ymax

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
//            x: 19 * scaleFactor
            y: 236 * scaleFactor
                        x: 279 * scaleFactor
                        width: 177 * scaleFactor
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.rightMargin: 207 * scaleFactor
//            anchors.leftMargin: 279 * scaleFactor
            opacity: 0
            // GraphSettings.qml
            onXminChanged: minuteAveragedSettings1.maxmin = minuteAveragedSection.xmin
            onXmaxChanged: minuteAveragedSettings1.maxmax = minuteAveragedSection.xmax
            onYminChanged: minuteAveragedSettings1.maymin = minuteAveragedSection.ymin
            onYmaxChanged: minuteAveragedSettings1.maymax = minuteAveragedSection.ymax

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
//            x: 21 * scaleFactor
            y: 90 * scaleFactor
                        x: 473 * scaleFactor
                        width: 177 * scaleFactor
            height: 140 * scaleFactor
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.rightMargin: 13 * scaleFactor
//            anchors.leftMargin: 473 * scaleFactor
            opacity: 0
            // GraphSettings.qml
            onSingleChanged: graphQualitySettings1.single = colorCodeSection.single
            onQualityChanged: graphQualitySettings1.quality = colorCodeSection.quality
            onDpiChanged: graphQualitySettings1.dpi = colorCodeSection.dpi
            onDefaultColorChanged: graphQualitySettings1.defaultColor = colorCodeSection.defaultColor

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
//            x: 32 * scaleFactor
            y: 236 * scaleFactor
                        x: 473 * scaleFactor
                        width: 177 * scaleFactor
            height: 140 * scaleFactor
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.rightMargin: 13 * scaleFactor
//            anchors.leftMargin: 473 * scaleFactor
            opacity: 0
//            // GraphSettings.qml
//            onColorChanged: baselineSettings1.color = baselineSection.color
//            onTimeChanged: baselineSettings1.time = baselineSection.time
//            onDisplayChanged: baselineSettings1.display = baselineSection.display

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
//            x: 28 * scaleFactor
            y: 388 * scaleFactor
            x: 279 * scaleFactor
            width: 177 * scaleFactor
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.rightMargin: 207 * scaleFactor
//            anchors.leftMargin: 279 * scaleFactor
            opacity: 0
//            // GraphSettings.qml
//            onRemoveChanged: zscoreSettings1.remove = zScoreSection.remove
//            onScoreChanged: zscoreSettings1.score = zScoreSection.score

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
            x: 26 * scaleFactor
            y: 25 * scaleFactor
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
            x: 144 * scaleFactor
            y: 25 * scaleFactor
            width: 112 * scaleFactor
            height: 20 * scaleFactor
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
            x: 523 * scaleFactor
            y: 424 * scaleFactor
            width: 78 * scaleFactor
            height: 20 * scaleFactor
            text: "Reset"
            opacity: 0
            onClicked: reset()


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
