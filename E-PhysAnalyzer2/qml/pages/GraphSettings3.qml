import QtQuick 2.15
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0
import "../controls/custom"
import "../controls/buttons"
import "settings"
import "../javascript/graph-settings.js" as GraphSettings

Item {
    id: settingsPage3
    // Properties for editing
    width: 663
    height: 704
    Component.onCompleted: GraphSettings.startDeserialization3(graphSettings3, postAnalysisSettings3, minuteAveragedSettings3, graphQualitySettings3, baselineSettings3, zscoreSettings3)
    Component.onDestruction: runSerialization3()

    signal runSerialization3()
    signal runDeserialization3(var objects)
    signal postAnalysisSettings(string xmin, string xmax, string ymin, string ymax)
    signal minuteAveragedSettings(string xmin, string xmax, string ymin, string ymax)
    signal graphQualitySettings(bool single, int quality, string dpi, string defaultColor)
    signal baselineSettings(string color, string time, bool display)
    signal zscoreSettings(bool remove, string score)
    signal reset()

    Connections {
        target: regions
        function onEmitSerializedObjects3(objects, axis) {
            graphSettings3.objects3 = objects
            graphSettings3.regionAxis3 = axis
        }
    }

    Settings {
        id: graphSettings3
        property var objects3: []
        property int regionAxis3: 5
    }

    Settings {
        id: postAnalysisSettings3
        property string xmin3: ""
        property string xmax3: ""
        property string ymin3: ""
        property string ymax3: ""
    }

    Settings {
        id: minuteAveragedSettings3
        property string maxmin3: ""
        property string maxmax3: ""
        property string maymin3: ""
        property string maymax3: ""
    }

    Settings {
        id: graphQualitySettings3
        property bool single3: false
        property int quality3: 1
        property string dpi3: ""
        property string defaultColor3: ""
    }

    Settings {
        id: baselineSettings3
        property string color3: ""
        property string time3: ""
        property bool display3: true
    }

    Settings {
        id: zscoreSettings3
        property bool remove3: true
        property string score3: ""
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
            // GraphSettings3.qml
            onXminChanged: postAnalysisSettings3.xmin3 = postAnalysisSection.xmin
            onXmaxChanged: postAnalysisSettings3.xmax3 = postAnalysisSection.xmax
            onYminChanged: postAnalysisSettings3.ymin3 = postAnalysisSection.ymin
            onYmaxChanged: postAnalysisSettings3.ymax3 = postAnalysisSection.ymax

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
            // GraphSettings3.qml
            onXminChanged: minuteAveragedSettings3.maxmin3 = minuteAveragedSection.xmin
            onXmaxChanged: minuteAveragedSettings3.maxmax3 = minuteAveragedSection.xmax
            onYminChanged: minuteAveragedSettings3.maymin3 = minuteAveragedSection.ymin
            onYmaxChanged: minuteAveragedSettings3.maymax3 = minuteAveragedSection.ymax

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
            height: 140
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 13
            anchors.leftMargin: 473
            opacity: 0
            // GraphSettings3.qml
            onSingleChanged: graphQualitySettings3.single3 = colorCodeSection.single
            onQualityChanged: graphQualitySettings3.quality3 = colorCodeSection.quality
            onDpiChanged: graphQualitySettings3.dpi3 = colorCodeSection.dpi
            onDefaultColorChanged: graphQualitySettings3.defaultColor3 = colorCodeSection.defaultColor

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
            height: 140
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 13
            anchors.leftMargin: 473
            opacity: 0
            // GraphSettings3.qml
            onColorChanged: baselineSettings3.color3 = baselineSection.color
            onTimeChanged: baselineSettings3.time3 = baselineSection.time
            onDisplayChanged: baselineSettings3.display3 = baselineSection.display

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
            // GraphSettings3.qml
            onRemoveChanged: zscoreSettings3.remove3 = zScoreSection.remove
            onScoreChanged: zscoreSettings3.score3 = zScoreSection.score

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
