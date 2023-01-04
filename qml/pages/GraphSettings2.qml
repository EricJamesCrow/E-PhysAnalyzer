import QtQuick 2.15
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0
import "../controls/custom"
import "../controls/buttons"
import "settings"
import "../javascript/graph-settings.js" as GraphSettings
import "../javascript/run-analysis.js" as Analysis

Item {
    id: settingsPage2
    // Properties for editing
//    width: 663 * scaleFactor
//    height: 704 * scaleFactor
    Component.onCompleted: GraphSettings.startDeserialization(graphSettings2.objects2, graphSettings2.regionAxis2, postAnalysisSettings2.xmin2, postAnalysisSettings2.xmax2, postAnalysisSettings2.ymin2, postAnalysisSettings2.ymax2,
                                                              minuteAveragedSettings2.maxmin2, minuteAveragedSettings2.maxmax2, minuteAveragedSettings2.maymin2, minuteAveragedSettings2.maymax2,graphQualitySettings2.single2,
                                                              graphQualitySettings2.quality2,graphQualitySettings2.dpi2,graphQualitySettings2.defaultColor2, baselineSettings2.color2,
                                                              baselineSettings2.time2,baselineSettings2.display2, zscoreSettings2.remove2, zscoreSettings2.score2)
    Component.onDestruction: runSerialization()

    signal runSerialization()
    signal runDeserialization(var objects)
    signal postAnalysisSettings(string xmin, string xmax, string ymin, string ymax)
    signal minuteAveragedSettings(string xmin, string xmax, string ymin, string ymax)
    signal graphQualitySettings(bool single, int quality, string dpi, string defaultColor)
    signal baselineSettings(string color, string time, bool display)
    signal zscoreSettings(bool remove, string score)
    signal reset()
    signal emitReturnData(string color, int time, bool display, var axisLimits, bool single, int dpi, string defaultcolor, bool remove, var score)


    // Images
    property string addFilterSvgIcon: "../../images/svg_images/plus_icon_087589.svg"
    property string closeBtnSvgIcon: "../../images/svg_images/close_icon.svg"
    property string checkBoxIcon: "../../images/svg_images/checkmark_icon_087589.svg"


    // Properties for editing
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
    property var errorMessage: ""

    Connections {
        target: regions
        function onEmitSerializedObjects2(objects, axis) {
            graphSettings2.objects2 = objects
            graphSettings2.regionAxis2 = axis
        }
    }

    Connections {
        target: content
        function onGetGraphSettings() {
            Analysis.runGrabSettings(postAnalysisSettings2.xmin2, postAnalysisSettings2.xmax2, postAnalysisSettings2.ymin2, postAnalysisSettings2.ymax2,
                                     minuteAveragedSettings2.maxmin2, minuteAveragedSettings2.maxmax2, minuteAveragedSettings2.maymin2, minuteAveragedSettings2.maymax2,graphQualitySettings2.single2,
                                     graphQualitySettings2.quality2,graphQualitySettings2.dpi2,graphQualitySettings2.defaultColor2, baselineSettings2.color2,
                                     baselineSettings2.time2,baselineSettings2.display2, zscoreSettings2.remove2, zscoreSettings2.score2)
        }
        function onErrorMsg(msg, object) {
                GraphSettings.errorMsg(msg, object)
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


        FontLoader {
            id: pragmaticaFont
            source: "fonts/PT Pragmatica Book.ttf"
        }


        color: "#00000000"
        radius: 10 * scaleFactor
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
//            x: 19 * scaleFactor
            y: 236 * scaleFactor
                        x: 279 * scaleFactor
                        width: 177 * scaleFactor
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.rightMargin: 207 * scaleFactor
//            anchors.leftMargin: 279 * scaleFactor
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
//            x: 28 * scaleFactor
            y: 388 * scaleFactor
            x: 279 * scaleFactor
            width: 177 * scaleFactor
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.rightMargin: 207 * scaleFactor
//            anchors.leftMargin: 279 * scaleFactor
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
        function onDestroyErrorMsg() {
            GraphSettings.destroyErrorMsg()
        }
    }

}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
