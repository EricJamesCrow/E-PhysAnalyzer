import QtQuick 2.15
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0
import "../controls/custom"
import "../controls/buttons"
import "settings"
import "../javascript/graph-settings.js" as GraphSettings

Item {
    id: settingsPage2
    // Properties for editing
    width: 663
    height: 704
    Component.onCompleted: GraphSettings.startDeserialization2(graphSettings2, postAnalysisSettings2, minuteAveragedSettings2, graphQualitySettings2, baselineSettings2, zscoreSettings2)
    Component.onDestruction: runSerialization()

    signal runSerialization()
    signal runDeserialization(var objects)
    signal postAnalysisSettings(string xmin, string xmax, string ymin, string ymax)
    signal minuteAveragedSettings(string xmin, string xmax, string ymin, string ymax)
    signal graphQualitySettings(bool single, int quality, string dpi, string defaultColor)
    signal baselineSettings(string color, string time, bool display)
    signal zscoreSettings(bool remove, string score)
    signal reset()

    Connections {
        target: regions
        function onEmitSerializedObjects2(objects, axis) {
            graphSettings2.objects2 = objects
            graphSettings2.regionAxis2 = axis
        }
    }

    Settings {
        id: graphSettings2
        property var objects2: []
        property int regionAxis2: 5
    }

    Settings {
        id: postAnalysisSettings2
        property string xmin2: ""
        property string xmax2: ""
        property string ymin2: ""
        property string ymax2: ""
    }

    Settings {
        id: minuteAveragedSettings2
        property string maxmin2: ""
        property string maxmax2: ""
        property string maymin2: ""
        property string maymax2: ""
    }

    Settings {
        id: graphQualitySettings2
        property bool single2: false
        property int quality2: 1
        property string dpi2: ""
        property string defaultColor2: ""
    }

    Settings {
        id: baselineSettings2
        property string color2: ""
        property string time2: ""
        property bool display2: true
    }

    Settings {
        id: zscoreSettings2
        property bool remove2: true
        property string score2: ""
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
            // GraphSettings2.qml
            onXminChanged: postAnalysisSettings2.xmin2 = postAnalysisSection.xmin
            onXmaxChanged: postAnalysisSettings2.xmax2 = postAnalysisSection.xmax
            onYminChanged: postAnalysisSettings2.ymin2 = postAnalysisSection.ymin
            onYmaxChanged: postAnalysisSettings2.ymax2 = postAnalysisSection.ymax

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
            // GraphSettings2.qml
            onXminChanged: minuteAveragedSettings2.maxmin2 = minuteAveragedSection.xmin
            onXmaxChanged: minuteAveragedSettings2.maxmax2 = minuteAveragedSection.xmax
            onYminChanged: minuteAveragedSettings2.maymin2 = minuteAveragedSection.ymin
            onYmaxChanged: minuteAveragedSettings2.maymax2 = minuteAveragedSection.ymax

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
            // GraphSettings2.qml
            onSingleChanged: graphQualitySettings2.single2 = colorCodeSection.single
            onQualityChanged: graphQualitySettings2.quality2 = colorCodeSection.quality
            onDpiChanged: graphQualitySettings2.dpi2 = colorCodeSection.dpi
            onDefaultColorChanged: graphQualitySettings2.defaultColor2 = colorCodeSection.defaultColor

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
            // GraphSettings2.qml
            onColorChanged: baselineSettings2.color2 = baselineSection.color
            onTimeChanged: baselineSettings2.time2 = baselineSection.time
            onDisplayChanged: baselineSettings2.display2 = baselineSection.display

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
            // GraphSettings2.qml
            onRemoveChanged: zscoreSettings2.remove2 = zScoreSection.remove
            onScoreChanged: zscoreSettings2.score2 = zScoreSection.score

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
