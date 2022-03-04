import QtQuick 2.9
import QtQuick.Controls 6.2
import "controls"
import Qt.labs.settings 1.1

Item {
    width: 499
    height: 366

    FontLoader {
        id: fixedFont
        source: "../fonts/Segoe UI.ttf"
    }

    Settings {
        id: settings
        property int customsColorsIndex : 0
        property int graphQualityIndex : 1
        property real baselineCheckBoxVar : Qt.Checked
        property real removeOutliersCheckBoxVar : Qt.Checked
        property real colorCodeCheckBoxVar : Qt.Checked
        property int axisLimitsIndex0: 0

        property int graphQualityIndex1 : 1
        property real baselineCheckBoxVar1 : Qt.Checked
        property real removeOutliersCheckBoxVar1 : Qt.Checked
        property real colorCodeCheckBoxVar1 : Qt.Checked
        property int axisLimitsIndex1: 0

        property int graphQualityIndex2 : 1
        property real baselineCheckBoxVar2 : Qt.Checked
        property real removeOutliersCheckBoxVar2 : Qt.Checked
        property real colorCodeCheckBoxVar2 : Qt.Checked
        property int axisLimitsIndex2: 0

        property int graphQualityIndex3 : 1
        property real baselineCheckBoxVar3 : Qt.Checked
        property real removeOutliersCheckBoxVar3 : Qt.Checked
        property real colorCodeCheckBoxVar3 : Qt.Checked
        property int axisLimitsIndex3: 0

        property string graphEntry0String : ""
        property string graphEntry1String : ""
        property string graphEntry2String : ""
        property string graphEntry3String : ""
        property string graphEntry4String : ""
        property string graphEntry5String : ""
        property string graphEntry6String : ""
        property string graphEntry7String : ""

        property string graphEntry0String1 : ""
        property string graphEntry1String1 : ""
        property string graphEntry2String1 : ""
        property string graphEntry3String1 : ""
        property string graphEntry4String1 : ""
        property string graphEntry5String1 : ""
        property string graphEntry6String1 : ""
        property string graphEntry7String1 : ""

        property string graphEntry0String2 : ""
        property string graphEntry1String2 : ""
        property string graphEntry2String2 : ""
        property string graphEntry3String2 : ""
        property string graphEntry4String2 : ""
        property string graphEntry5String2 : ""
        property string graphEntry6String2 : ""
        property string graphEntry7String2 : ""

        property string baselineColorString : ""
        property string customDpiEntryString : ""
        property string zScoreEntry : ""

        property string baselineColorString1 : ""
        property string customDpiEntryString1 : ""
        property string zScoreEntry1 : ""

        property string baselineColorString2 : ""
        property string customDpiEntryString2 : ""
        property string zScoreEntry2 : ""

        property string singleColorGraphEntryString : ""
        property string baselineColorString3 : ""
        property string customDpiEntryString3 : ""
        property string zScoreEntry3 : ""

        property string baselineEntryText0: ""
        property string baselineEntryText1: ""
        property string baselineEntryText2: ""
        property string baselineEntryText3: ""

        property string minAvgXAxisLimitsEntry0: ""
        property string minAvgYAxisLimitsEntry0: ""
        property string minAvgXAxisLimitsEntry1: ""
        property string minAvgYAxisLimitsEntry1: ""
        property string minAvgXAxisLimitsEntry2: ""
        property string minAvgYAxisLimitsEntry2: ""
        property string minAvgXAxisLimitsEntry3: ""
        property string minAvgYAxisLimitsEntry3: ""

        property string postXAxisLimitsEntry0: ""
        property string postYAxisLimitsEntry0: ""
        property string postXAxisLimitsEntry1: ""
        property string postYAxisLimitsEntry1: ""
        property string postXAxisLimitsEntry2: ""
        property string postYAxisLimitsEntry2: ""
        property string postXAxisLimitsEntry3: ""
        property string postYAxisLimitsEntry3: ""

        property string minsTextEntry0: ""
        property string minsTextEntry1: ""
        property string minsTextEntry2: ""
        property string minsTextEntry3: ""
        property string minsTextEntry4: ""
        property string minsTextEntry5: ""
        property string minsTextEntry6: ""
        property string minsTextEntry7: ""
        property string minsTextEntry8: ""
        property string minsTextEntry9: ""
        property string minsTextEntry10: ""
        property string minsTextEntry11: ""
        property string minsTextEntry12: ""
        property string minsTextEntry13: ""
        property string minsTextEntry14: ""
        property string minsTextEntry15: ""
        property string minsTextEntry16: ""
        property string minsTextEntry17: ""
        property string minsTextEntry18: ""
        property string minsTextEntry19: ""
        property string minsTextEntry20: ""
        property string minsTextEntry21: ""
        property string minsTextEntry22: ""
        property string minsTextEntry23: ""
        property string minsTextEntry24: ""
        property string minsTextEntry25: ""
        property string minsTextEntry26: ""
        property string minsTextEntry27: ""
        property string minsTextEntry28: ""
        property string minsTextEntry29: ""
        property string minsTextEntry30: ""
        property string minsTextEntry31: ""
        property string minsTextEntry32: ""
        property string minsTextEntry33: ""
        property string minsTextEntry34: ""
        property string minsTextEntry35: ""
        property string minsTextEntry36: ""
        property string minsTextEntry37: ""
        property string minsTextEntry38: ""
        property string minsTextEntry39: ""
        property string minsTextEntry40: ""
        property string minsTextEntry41: ""
        property string minsTextEntry42: ""
        property string minsTextEntry43: ""
        property string minsTextEntry44: ""
        property string minsTextEntry45: ""
        property string minsTextEntry46: ""
        property string minsTextEntry47: ""

    }

    Rectangle {
        id: bg
        color: "#2c313c"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0


        ComboBox {
            id: customColorsComboBox
            anchors.left: parent.left
            anchors.top: parent.top
            currentIndex: settings.customsColorsIndex
            anchors.leftMargin: 94
            anchors.topMargin: 28
            width: 90
            height: 20
            font.family: fixedFont.font.family
            font.pointSize: 9
            model: [ "Profile 1", "Profile 2", "Profile 3", "Single Color" ]
            onCurrentIndexChanged: {
                settings.customsColorsIndex = customColorsComboBox.currentIndex
                if(customColorsComboBox.currentIndex == 3){
                    profileEntries0.visible = false
                    profileEntries1.visible = false
                    profileEntries2.visible = false
                    profileEntries3.visible = true
                } else if (customColorsComboBox.currentIndex == 2){
                    profileEntries0.visible = false
                    profileEntries1.visible = false
                    profileEntries2.visible = true
                    profileEntries3.visible = false
                } else if (customColorsComboBox.currentIndex == 1) {
                    profileEntries0.visible = false
                    profileEntries1.visible = true
                    profileEntries2.visible = false
                    profileEntries3.visible = false
                } else {
                    profileEntries0.visible = true
                    profileEntries1.visible = false
                    profileEntries2.visible = false
                    profileEntries3.visible = false
                }
            }

            contentItem: Text {
                text: customColorsComboBox.displayText
                color: "black"
                font.family: fixedFont.font.family
                font.pointSize: 9
            }

        }







        Rectangle {
            id: profileEntries0
            x: 0
            y: 0
            width: 200
            height: 272
            color: "#00000000"
            visible: true

            Rectangle {
                id: graphEntries0
                width: 200
                height: 200
                color: "#00000000"

                TextField {
                    id: graphEntry0
                    x: 94
                    y: 60
                    width: 91
                    height: 20
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 60
                    anchors.leftMargin: 94
                    text: settings.graphEntry0String
                    placeholderText: qsTr("gray")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry0String = graphEntry0.text
                    }
                }

                TextField {
                    id: graphEntry1
                    x: 94
                    y: 86
                    width: 91
                    height: 20
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 86
                    anchors.leftMargin: 94
                    text: settings.graphEntry1String
                    placeholderText: qsTr("black")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry1String = graphEntry1.text
                    }
                }

                TextField {
                    id: graphEntry2
                    x: 94
                    y: 112
                    width: 91
                    height: 20
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 112
                    anchors.leftMargin: 94
                    placeholderText: qsTr("gray")
                    text: settings.graphEntry2String
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry2String = graphEntry2.text
                    }
                }

                TextField {
                    id: graphEntry3
                    x: 94
                    y: 138
                    width: 91
                    height: 20
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 138
                    anchors.leftMargin: 94
                    placeholderText: qsTr("purple")
                    text: settings.graphEntry3String
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry3String = graphEntry3.text
                    }
                }

                TextField {
                    id: graphEntry4
                    x: 94
                    y: 164
                    width: 91
                    height: 20
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 94
                    anchors.topMargin: 164
                    placeholderText: qsTr("green")
                    text: settings.graphEntry4String
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry4String = graphEntry4.text
                    }
                }

                TextField {
                    id: graphEntry5
                    x: 94
                    y: 190
                    width: 91
                    height: 20
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 94
                    anchors.topMargin: 190
                    placeholderText: qsTr("blue")
                    text: settings.graphEntry5String
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry5String = graphEntry5.text
                    }
                }

                TextField {
                    id: graphEntry6
                    x: 94
                    y: 216
                    width: 91
                    height: 20
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 94
                    anchors.topMargin: 216
                    placeholderText: qsTr("orange")
                    text: settings.graphEntry6String
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry6String = graphEntry6.text
                    }
                }

                TextField {
                    id: graphEntry7
                    x: 94
                    y: 242
                    width: 91
                    height: 20
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 94
                    anchors.topMargin: 242
                    placeholderText: qsTr("red")
                    text: settings.graphEntry7String
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry7String = graphEntry7.text
                    }
                }
            }

            Rectangle {
                id: graphLabels0
                color: "#00000000"
                width: 200
                height: 200
                visible: true


                TextField {
                    id: minsTextEntry0
                    x: 17
                    y: 60
                    width: 25
                    height: 20
                    text: settings.minsTextEntry0
                    onTextChanged: settings.minsTextEntry0 = minsTextEntry0.text
                    placeholderText: qsTr("-10")
                    font.family: fixedFont.font.family
                    font.pointSize: 8

                    Label {
                        id: dash0
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        text: qsTr("-")
                        color: "#ffffff"
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }














                TextField {
                    id: minsTextEntry1
                    x: 53
                    y: 60
                    width: 25
                    height: 20
                    text: settings.minsTextEntry1
                    onTextChanged: settings.minsTextEntry1 = minsTextEntry1.text
                    placeholderText: qsTr("-5")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                }

                Label {
                    id: timeLabel0
                    x: 17
                    y: 30
                    width: 25
                    color: "#ffffff"
                    text: qsTr("Time (min)")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 17
                    anchors.topMargin: 30
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }


                TextField {
                    id: minsTextEntry2
                    x: 17
                    y: 86
                    width: 25
                    height: 20
                    text: settings.minsTextEntry2
                    onTextChanged: settings.minsTextEntry2 = minsTextEntry2.text
                    placeholderText: qsTr("-5")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash1
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: minsTextEntry3
                    x: 53
                    y: 86
                    width: 25
                    height: 20
                    text: settings.minsTextEntry3
                    placeholderText: qsTr("0")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry3 = minsTextEntry3.text
                }




                TextField {
                    id: minsTextEntry4
                    x: 17
                    y: 112
                    width: 25
                    height: 20
                    text: settings.minsTextEntry4
                    onTextChanged: settings.minsTextEntry4 = minsTextEntry4.text
                    placeholderText: qsTr("0")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash2
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }



                TextField {
                    id: minsTextEntry5
                    x: 53
                    y: 112
                    width: 25
                    height: 20
                    text: settings.minsTextEntry5
                    placeholderText: qsTr("5")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry5 = minsTextEntry5.text
                }

                TextField {
                    id: minsTextEntry6
                    x: 17
                    y: 138
                    width: 25
                    height: 20
                    text: settings.minsTextEntry6
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry6 = minsTextEntry6.text
                    placeholderText: qsTr("5")
                    Label {
                        id: dash3
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }




                TextField {
                    id: minsTextEntry7
                    x: 53
                    y: 138
                    width: 25
                    height: 20
                    text: settings.minsTextEntry7
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    placeholderText: qsTr("10")
                    onTextChanged: settings.minsTextEntry7 = minsTextEntry7.text
                }

                TextField {
                    id: minsTextEntry8
                    x: 17
                    y: 164
                    width: 25
                    height: 20
                    text: settings.minsTextEntry8
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry8 = minsTextEntry8.text
                    placeholderText: qsTr("10")
                    Label {
                        id: dash4
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }





                TextField {
                    id: minsTextEntry9
                    x: 53
                    y: 164
                    width: 25
                    height: 20
                    text: settings.minsTextEntry9
                    placeholderText: qsTr("15")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry9 = minsTextEntry9.text
                }

                TextField {
                    id: minsTextEntry10
                    x: 17
                    y: 190
                    width: 25
                    height: 20
                    text: settings.minsTextEntry10
                    onTextChanged: settings.minsTextEntry10 = minsTextEntry10.text
                    placeholderText: qsTr("15")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash5
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }






                TextField {
                    id: minsTextEntry11
                    x: 53
                    y: 190
                    width: 25
                    height: 20
                    text: settings.minsTextEntry11
                    placeholderText: qsTr("20")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry11 = minsTextEntry11.text
                }

                TextField {
                    id: minsTextEntry12
                    x: 17
                    y: 216
                    width: 25
                    height: 20
                    text: settings.minsTextEntry12
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry12 = minsTextEntry12.text
                    placeholderText: qsTr("20")
                    Label {
                        id: dash6
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }







                TextField {
                    id: minsTextEntry13
                    x: 53
                    y: 216
                    width: 25
                    height: 20
                    text: settings.minsTextEntry13
                    placeholderText: qsTr("25")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry13 = minsTextEntry13.text
                }

                TextField {
                    id: minsTextEntry14
                    x: 17
                    y: 242
                    width: 25
                    height: 20
                    text: settings.minsTextEntry14
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry14 = minsTextEntry14.text
                    placeholderText: qsTr("25")
                    Label {
                        id: dash7
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: minsTextEntry15
                    x: 53
                    y: 242
                    width: 25
                    height: 20
                    text: settings.minsTextEntry15
                    placeholderText: qsTr("30")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry15 = minsTextEntry15.text
                }















            }


            CheckBox {
                id: colorCode0
                x: 336
                y: 32
                anchors.top: parent.top
                checkState: settings.colorCodeCheckBoxVar
                anchors.topMargin: 32
                width: 19
                height: 16
                onCheckStateChanged: {

                    settings.colorCodeCheckBoxVar = colorCode0.checkState
                    if(colorCode0.checkState == false){

                        if(customColorsComboBox.currentIndex == 3) {
                            singleColorGraphEntry.visible = false
                        } else {
                            graphLabels0.visible = false
                            graphEntries0.visible = false
                        }
                    } else {
                        if(customColorsComboBox.currentIndex == 3) {
                            singleColorGraphEntry.visible = true
                        } else {
                            graphLabels0.visible = true
                            graphEntries0.visible = true
                        }
                    }
                }

                Label {
                    id: colorCodeLabel0
                    x: 19
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Color Code")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
            }

            Label {
                id: graphQualityLabel0
                x: 339
                y: 86
                color: "#ffffff"
                text: qsTr("Graph Quality")
                font.family: fixedFont.font.family
                font.pointSize: 9

                ComboBox {
                    id: graphQualityComboBox0
                    x: -21
                    y: 22
                    width: 115
                    height: 20
                    currentIndex: settings.graphQualityIndex
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    model: [ "Low", "Medium", "High", "Ultra", "Custom" ]
                    onCurrentIndexChanged: {
                        settings.graphQualityIndex = graphQualityComboBox0.currentIndex
                        if(graphQualityComboBox0.currentIndex == 4) {
                            customDpiEntry0.visible = true
                        } else {
                            customDpiEntry0.visible = false
                        }
                    }

                    contentItem: Text {
                        text: graphQualityComboBox0.displayText
                        color: "black"
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }


                }

                TextField {
                    id: customDpiEntry0
                    x: -21
                    y: 65
                    width: 86
                    height: 20
                    text: settings.customDpiEntryString
                    visible: true
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: settings.customDpiEntryString = customDpiEntry0.text
                    Label {
                        id: customDpiLabel0
                        x: 99
                        y: 2
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("DPI")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }
            }


            CheckBox {
                id: baselineCheckBox0
                x: 329
                y: 185
                width: 19
                height: 16
                Label {
                    id: baselineLanel0
                    x: 19
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Display Baseline")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                TextField {
                    id: baselineField0
                    x: -9
                    y: 31
                    text: settings.baselineColorString
                    placeholderText: qsTr("Baseline color")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: settings.baselineColorString = baselineField0.text
                }
                checkState: settings.baselineCheckBoxVar
                onCheckStateChanged: {
                    if(baselineCheckBox0.checkState == false){
                        baselineField0.visible = false
                        settings.baselineCheckBoxVar = Qt.Unchecked
                    } else {
                        baselineField0.visible = true
                        settings.baselineCheckBoxVar = Qt.Checked
                    }
                }
            }


            CheckBox {
                id: removeOutliersCheckBox0
                x: 86
                y: 286
                width: 19
                height: 16
                Label {
                    id: removeOutliersLabel0
                    x: 16
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Remove Outliers")
                    styleColor: "#ffffff"
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                Label {
                    id: zscoreLabel0
                    x: 0
                    y: 28
                    color: "#ffffff"
                    text: qsTr("Z-Score >")
                    font.family: fixedFont.font.family
                    font.pointSize: 9

                    TextField {
                        id: zScoreEntry0
                        x: 59
                        y: 0
                        width: 47
                        height: 20
                        text: settings.zScoreEntry
                        placeholderText: qsTr("2.5")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                        onTextChanged: settings.zScoreEntry = zScoreEntry0.text
                    }
                }
                checkState: settings.removeOutliersCheckBoxVar
                onCheckStateChanged: {
                    if(removeOutliersCheckBox0.checkState == false){
                        zscoreLabel0.visible = false
                        settings.removeOutliersCheckBoxVar = Qt.Unchecked
                    } else {
                        zscoreLabel0.visible = true
                        settings.removeOutliersCheckBoxVar = Qt.Checked
                    }
                }
            }


            ResetButton {
                id: resetButton0
                x: 349
                y: 315
                width: 63
                height: 27
                font.family: fixedFont.font.family
                font.pointSize: 9
                onClicked: {
                    graphQualityComboBox0.currentIndex = 1
                    baselineCheckBox0.checkState = Qt.Checked
                    colorCode0.checkState = Qt.Checked
                    removeOutliersCheckBox0.checkState = Qt.Checked
                    settings.graphEntry0String = ""
                    settings.graphEntry1String = ""
                    settings.graphEntry2String = ""
                    settings.graphEntry3String = ""
                    settings.graphEntry4String = ""
                    settings.graphEntry5String = ""
                    settings.graphEntry6String = ""
                    settings.graphEntry7String = ""
                    settings.baselineColorString = ""
                    settings.customDpiEntryString = ""
                    settings.zScoreEntry = ""
                    zScoreEntry0.text = ""
                    settings.baselineEntryText0 = ""
                    settings.minAvgXAxisLimitsEntry0 = ""
                    settings.minAvgYAxisLimitsEntry0 = ""
                    settings.postXAxisLimitsEntry0 = ""
                    settings.postYAxisLimitsEntry0 = ""
                    axisLimitsComboBox0.currentIndex = 0

                    settings.minsTextEntry0 = ""
                    settings.minsTextEntry1 = ""
                    settings.minsTextEntry2 = ""
                    settings.minsTextEntry3 = ""
                    settings.minsTextEntry4 = ""
                    settings.minsTextEntry5 = ""
                    settings.minsTextEntry6 = ""
                    settings.minsTextEntry7 = ""
                    settings.minsTextEntry8 = ""
                    settings.minsTextEntry9 = ""
                    settings.minsTextEntry10 = ""
                    settings.minsTextEntry11 = ""
                    settings.minsTextEntry12 = ""
                    settings.minsTextEntry13 = ""
                    settings.minsTextEntry14 = ""
                    settings.minsTextEntry15 = ""

                }
            }


            TextField {
                id: baselineEntry0
                x: 320
                y: 275
                width: 121
                height: 20
                text: settings.baselineEntryText0
                placeholderText: qsTr("Baseline value: 10")
                font.family: fixedFont.font.family
                font.pointSize: 9
                onTextChanged: {
                    settings.baselineEntryText0 = baselineEntry0.text
                }

                Label {
                    id: baselineFieldLabel0
                    x: 10
                    y: -21
                    color: "#ffffff"
                    text: qsTr("Baseline time (min)")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
            }

            ComboBox {
                id: axisLimitsComboBox0
                x: 199
                y: 32
                width: 110
                height: 20
                font.family: fixedFont.font.family
                font.pointSize: 9
                model: [ "Minute Averaged", "Post Analysis" ]
                currentIndex: settings.axisLimitsIndex0
                onCurrentIndexChanged: {

                    settings.axisLimitsIndex0 = axisLimitsComboBox0.currentIndex
                    if (axisLimitsComboBox0.currentIndex == 1) {
                        minAvgXAxisLimitsEntry0.visible = false
                        minAvgYAxisLimitsEntry0.visible = false
                        postAnalysisXAxisLimitsEntry0.visible = true
                        postAnalysisYAxisLimitsEntry0.visible = true
                    } else {
                        minAvgXAxisLimitsEntry0.visible = true
                        minAvgYAxisLimitsEntry0.visible = true
                        postAnalysisXAxisLimitsEntry0.visible = false
                        postAnalysisYAxisLimitsEntry0.visible = false
                    }
                }

                contentItem: Text {
                    text: axisLimitsComboBox0.displayText
                    color: "black"
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                Label {
                    id: axisLimitsLabel0
                    x: 25
                    y: -19
                    text: qsTr("Axis Limits")
                    color: "#ffffff"
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
            }

            Rectangle {
                id: moreGraphSettings0
                x: 190
                y: 45
                width: 105
                height: 74
                color: "#00000000"

                TextField {
                    id: minAvgXAxisLimitsEntry0
                    x: 42
                    y: 23
                    width: 70
                    height: 16
                    placeholderText: qsTr("-10, None")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    text: settings.minAvgXAxisLimitsEntry0
                    onTextChanged: settings.minAvgXAxisLimitsEntry0 = minAvgXAxisLimitsEntry0.text

                    Label {
                        id: xAxisLabel0
                        x: -39
                        y: 0
                        text: qsTr("X-Axis")
                        color: "#ffffff"
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: minAvgYAxisLimitsEntry0
                    x: 42
                    y: 45
                    width: 70
                    height: 16
                    placeholderText: qsTr("25, 225")
                    text: settings.minAvgYAxisLimitsEntry0
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: settings.minAvgYAxisLimitsEntry0 = minAvgYAxisLimitsEntry0.text

                    Label {
                        id: yAxisLabel0
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("Y-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: postAnalysisXAxisLimitsEntry0
                    x: 42
                    y: 23
                    width: 70
                    height: 16
                    visible: true
                    rotation: 0
                    text: settings.postXAxisLimitsEntry0
                    onTextChanged: settings.postXAxisLimitsEntry0 = postAnalysisXAxisLimitsEntry0.text
                    placeholderText: qsTr("-10, None")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    Label {
                        id: xAxisLabel1
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("X-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: postAnalysisYAxisLimitsEntry0
                    x: 42
                    y: 45
                    width: 70
                    height: 16
                    visible: true
                    text: settings.postYAxisLimitsEntry0
                    onTextChanged: settings.postYAxisLimitsEntry0 = postAnalysisYAxisLimitsEntry0.text
                    placeholderText: qsTr("None, None")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    Label {
                        id: yAxisLabel1
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("Y-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }
            }







        }


        Rectangle {
            id: profileEntries1
            x: 0
            y: 0
            width: 200
            height: 272
            visible: false
            color: "#00000000"


            Rectangle {
                id: graphEntries1
                width: 200
                height: 200
                color: "#00000000"
                TextField {
                    id: graphEntry8
                    x: 94
                    y: 60
                    width: 91
                    height: 20
                    text: settings.graphEntry0String1
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 60
                    anchors.leftMargin: 94
                    placeholderText: qsTr("gray")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry0String1 = graphEntry8.text
                    }
                }

                TextField {
                    id: graphEntry9
                    x: 94
                    y: 86
                    width: 91
                    height: 20
                    text: settings.graphEntry1String1
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 86
                    anchors.leftMargin: 94
                    placeholderText: qsTr("black")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry1String1 = graphEntry9.text
                    }
                }

                TextField {
                    id: graphEntry10
                    x: 94
                    y: 112
                    width: 91
                    height: 20
                    text: settings.graphEntry2String1
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 112
                    anchors.leftMargin: 94
                    placeholderText: qsTr("gray")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry2String1 = graphEntry10.text
                    }
                }

                TextField {
                    id: graphEntry11
                    x: 94
                    y: 138
                    width: 91
                    height: 20
                    text: settings.graphEntry3String1
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 138
                    anchors.leftMargin: 94
                    placeholderText: qsTr("purple")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry3String1 = graphEntry11.text
                    }
                }

                TextField {
                    id: graphEntry12
                    x: 94
                    y: 164
                    width: 91
                    height: 20
                    text: settings.graphEntry4String1
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 164
                    anchors.leftMargin: 94
                    placeholderText: qsTr("green")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry4String1 = graphEntry12.text
                    }
                }

                TextField {
                    id: graphEntry13
                    x: 94
                    y: 190
                    width: 91
                    height: 20
                    text: settings.graphEntry5String1
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 190
                    anchors.leftMargin: 94
                    placeholderText: qsTr("blue")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry5String1 = graphEntry13.text
                    }
                }

                TextField {
                    id: graphEntry14
                    x: 94
                    y: 216
                    width: 91
                    height: 20
                    text: settings.graphEntry6String1
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 216
                    anchors.leftMargin: 94
                    placeholderText: qsTr("orange")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry6String1 = graphEntry14.text
                    }
                }

                TextField {
                    id: graphEntry15
                    x: 94
                    y: 242
                    width: 91
                    height: 20
                    text: settings.graphEntry7String1
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 242
                    anchors.leftMargin: 94
                    placeholderText: qsTr("red")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry7String1 = graphEntry15.text
                    }
                }
            }



            Rectangle {
                id: graphLabels1
                width: 200
                height: 200
                visible: true
                color: "#00000000"
                TextField {
                    id: minsTextEntry16
                    x: 17
                    y: 60
                    width: 25
                    height: 20
                    text: settings.minsTextEntry16
                    placeholderText: qsTr("-10")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash8
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry16 = minsTextEntry16.text
                }

                TextField {
                    id: minsTextEntry17
                    x: 53
                    y: 60
                    width: 25
                    height: 20
                    text: settings.minsTextEntry17
                    placeholderText: qsTr("-5")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry17 = minsTextEntry17.text
                }

                Label {
                    id: timeLabel1
                    x: 17
                    y: 30
                    width: 25
                    color: "#ffffff"
                    text: qsTr("Time (min)")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    anchors.leftMargin: 17
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                TextField {
                    id: minsTextEntry18
                    x: 17
                    y: 86
                    width: 25
                    height: 20
                    text: settings.minsTextEntry18
                    placeholderText: qsTr("-5")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash9
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry18 = minsTextEntry18.text
                }

                TextField {
                    id: minsTextEntry19
                    x: 53
                    y: 86
                    width: 25
                    height: 20
                    text: settings.minsTextEntry19
                    placeholderText: qsTr("0")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry19 = minsTextEntry19.text
                }

                TextField {
                    id: minsTextEntry20
                    x: 17
                    y: 112
                    width: 25
                    height: 20
                    text: settings.minsTextEntry20
                    placeholderText: qsTr("0")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash10
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry20 = minsTextEntry20.text
                }

                TextField {
                    id: minsTextEntry21
                    x: 53
                    y: 112
                    width: 25
                    height: 20
                    text: settings.minsTextEntry21
                    placeholderText: qsTr("5")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry21 = minsTextEntry21.text
                }

                TextField {
                    id: minsTextEntry22
                    x: 17
                    y: 138
                    width: 25
                    height: 20
                    text: settings.minsTextEntry22
                    placeholderText: qsTr("5")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash11
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry22 = minsTextEntry22.text
                }

                TextField {
                    id: minsTextEntry23
                    x: 53
                    y: 138
                    width: 25
                    height: 20
                    text: settings.minsTextEntry23
                    placeholderText: qsTr("10")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry23 = minsTextEntry23.text
                }

                TextField {
                    id: minsTextEntry24
                    x: 17
                    y: 164
                    width: 25
                    height: 20
                    text: settings.minsTextEntry24
                    placeholderText: qsTr("10")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash12
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry24 = minsTextEntry24.text
                }

                TextField {
                    id: minsTextEntry25
                    x: 53
                    y: 164
                    width: 25
                    height: 20
                    text: settings.minsTextEntry25
                    placeholderText: qsTr("15")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry25 = minsTextEntry25.text
                }

                TextField {
                    id: minsTextEntry26
                    x: 17
                    y: 190
                    width: 25
                    height: 20
                    text: settings.minsTextEntry26
                    placeholderText: qsTr("15")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash13
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry26 = minsTextEntry26.text
                }

                TextField {
                    id: minsTextEntry27
                    x: 53
                    y: 190
                    width: 25
                    height: 20
                    text: settings.minsTextEntry27
                    placeholderText: qsTr("20")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry27 = minsTextEntry27.text
                }

                TextField {
                    id: minsTextEntry28
                    x: 17
                    y: 216
                    width: 25
                    height: 20
                    text: settings.minsTextEntry28
                    placeholderText: qsTr("20")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash14
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry28 = minsTextEntry28.text
                }

                TextField {
                    id: minsTextEntry29
                    x: 53
                    y: 216
                    width: 25
                    height: 20
                    text: settings.minsTextEntry29
                    placeholderText: qsTr("25")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry29 = minsTextEntry29.text
                }

                TextField {
                    id: minsTextEntry30
                    x: 17
                    y: 242
                    width: 25
                    height: 20
                    text: settings.minsTextEntry30
                    placeholderText: qsTr("25")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash15
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry30 = minsTextEntry30.text
                }

                TextField {
                    id: minsTextEntry31
                    x: 53
                    y: 242
                    width: 25
                    height: 20
                    text: settings.minsTextEntry31
                    placeholderText: qsTr("30")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry31 = minsTextEntry31.text
                }
            }

            CheckBox {
                id: colorCode1
                x: 336
                y: 32
                anchors.top: parent.top
                anchors.topMargin: 32
                width: 19
                height: 16
                onCheckStateChanged: {

                    settings.colorCodeCheckBoxVar1 = colorCode1.checkState
                    if(colorCode1.checkState == false){

                        if(customColorsComboBox.currentIndex == 3) {
                            singleColorGraphEntry.visible = false
                        } else {
                            graphLabels1.visible = false
                            graphEntries1.visible = false
                        }
                    } else {
                        if(customColorsComboBox.currentIndex == 3) {
                            singleColorGraphEntry.visible = true
                        } else {
                            graphLabels1.visible = true
                            graphEntries1.visible = true
                        }
                    }
                }
                Label {
                    id: colorCodeLabel1
                    x: 19
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Color Code")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
                checkState: settings.colorCodeCheckBoxVar1
            }





            Label {
                id: graphQualityLabel1
                x: 339
                y: 86
                color: "#ffffff"
                text: qsTr("Graph Quality")
                font.family: fixedFont.font.family
                font.pointSize: 9
                ComboBox {
                    id: graphQualityComboBox1
                    x: -21
                    y: 22
                    width: 115
                    height: 20
                    currentIndex: settings.graphQualityIndex1
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onCurrentIndexChanged: {
                        settings.graphQualityIndex1 = graphQualityComboBox1.currentIndex
                        if(graphQualityComboBox1.currentIndex == 4) {
                            customDpiEntry1.visible = true
                        } else {
                            customDpiEntry1.visible = false
                        }
                    }
                    model: [ "Low", "Medium", "High", "Ultra", "Custom" ]

                    contentItem: Text {
                        text: graphQualityComboBox1.displayText
                        color: "black"
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: customDpiEntry1
                    x: -21
                    y: 65
                    width: 86
                    height: 20
                    visible: true
                    text: settings.customDpiEntryString1
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    Label {
                        id: customDpiLabel1
                        x: 99
                        y: 2
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("DPI")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.customDpiEntryString1 = customDpiEntry1.text
                }
            }





            CheckBox {
                id: baselineCheckBox1
                x: 329
                y: 185
                width: 19
                height: 16
                onCheckStateChanged: {
                    if(baselineCheckBox1.checkState == false){
                        baselineField1.visible = false
                        settings.baselineCheckBoxVar1 = Qt.Unchecked
                    } else {
                        baselineField1.visible = true
                        settings.baselineCheckBoxVar1 = Qt.Checked
                    }
                }
                Label {
                    id: baselineLanel1
                    x: 19
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Display Baseline")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                TextField {
                    id: baselineField1
                    x: -9
                    y: 31
                    text: settings.baselineColorString1
                    placeholderText: qsTr("Baseline color")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: settings.baselineColorString1 = baselineField1.text
                }
                checkState: settings.baselineCheckBoxVar1
            }





            CheckBox {
                id: removeOutliersCheckBox1
                x: 86
                y: 286
                width: 19
                height: 16
                onCheckStateChanged: {
                    if(removeOutliersCheckBox1.checkState == false){
                        zscoreLabel1.visible = false
                        settings.removeOutliersCheckBoxVar1 = Qt.Unchecked
                    } else {
                        zscoreLabel1.visible = true
                        settings.removeOutliersCheckBoxVar1 = Qt.Checked
                    }
                }
                Label {
                    id: removeOutliersLabel1
                    x: 16
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Remove Outliers")
                    styleColor: "#ffffff"
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                Label {
                    id: zscoreLabel1
                    x: 0
                    y: 28
                    color: "#ffffff"
                    text: qsTr("Z-Score >")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    TextField {
                        id: zScoreEntry1
                        x: 59
                        y: 0
                        width: 47
                        height: 20
                        text: settings.zScoreEntry1
                        placeholderText: qsTr("2.5")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                        onTextChanged: settings.zScoreEntry1 = zScoreEntry1.text
                    }
                }
                checkState: settings.removeOutliersCheckBoxVar1
            }





            ResetButton {
                id: resetButton1
                x: 349
                y: 315
                width: 63
                height: 27
                font.family: fixedFont.font.family
                font.pointSize: 9
                onClicked: {
                    graphQualityComboBox1.currentIndex = 1
                    baselineCheckBox1.checkState = Qt.Checked
                    colorCode1.checkState = Qt.Checked
                    removeOutliersCheckBox1.checkState = Qt.Checked
                    settings.graphEntry0String1 = ""
                    settings.graphEntry1String1 = ""
                    settings.graphEntry2String1 = ""
                    settings.graphEntry3String1 = ""
                    settings.graphEntry4String1 = ""
                    settings.graphEntry5String1 = ""
                    settings.graphEntry6String1 = ""
                    settings.graphEntry7String1 = ""
                    settings.baselineColorString1 = ""
                    settings.customDpiEntryString1 = ""
                    settings.zScoreEntry1 = ""
                    zScoreEntry1.text = ""
                    settings.baselineEntryText1 = ""
                    settings.minAvgXAxisLimitsEntry1 = ""
                    settings.minAvgYAxisLimitsEntry1 = ""
                    settings.postXAxisLimitsEntry1 = ""
                    settings.postYAxisLimitsEntry1 = ""
                    axisLimitsComboBox1.currentIndex = 0

                    settings.minsTextEntry16 = ""
                    settings.minsTextEntry17 = ""
                    settings.minsTextEntry18 = ""
                    settings.minsTextEntry19 = ""
                    settings.minsTextEntry20 = ""
                    settings.minsTextEntry21 = ""
                    settings.minsTextEntry22 = ""
                    settings.minsTextEntry23 = ""
                    settings.minsTextEntry24 = ""
                    settings.minsTextEntry25 = ""
                    settings.minsTextEntry26 = ""
                    settings.minsTextEntry27 = ""
                    settings.minsTextEntry28 = ""
                    settings.minsTextEntry29 = ""
                    settings.minsTextEntry30 = ""
                    settings.minsTextEntry31 = ""

                }
            }





            TextField {
                id: baselineEntry1
                x: 320
                y: 275
                width: 121
                height: 20
                text: settings.baselineEntryText1
                placeholderText: qsTr("Baseline value: 10")
                font.family: fixedFont.font.family
                font.pointSize: 9
                onTextChanged: {
                    settings.baselineEntryText1 = baselineEntry1.text
                }

                Label {
                    id: baselineFieldLabel1
                    x: 10
                    y: -21
                    color: "#ffffff"
                    text: qsTr("Baseline time (min)")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
            }





            ComboBox {
                id: axisLimitsComboBox1
                x: 199
                y: 32
                width: 110
                height: 20
                currentIndex: settings.axisLimitsIndex1
                font.family: fixedFont.font.family
                font.pointSize: 9
                onCurrentIndexChanged: {

                    settings.axisLimitsIndex1 = axisLimitsComboBox1.currentIndex
                    if (axisLimitsComboBox1.currentIndex == 1) {
                        minAvgXAxisLimitsEntry1.visible = false
                        minAvgYAxisLimitsEntry1.visible = false
                        postAnalysisXAxisLimitsEntry1.visible = true
                        postAnalysisYAxisLimitsEntry1.visible = true
                    } else {
                        minAvgXAxisLimitsEntry1.visible = true
                        minAvgYAxisLimitsEntry1.visible = true
                        postAnalysisXAxisLimitsEntry1.visible = false
                        postAnalysisYAxisLimitsEntry1.visible = false
                    }
                }
                model: [ "Minute Averaged", "Post Analysis" ]

                contentItem: Text {
                    text: axisLimitsComboBox1.displayText
                    color: "black"
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                Label {
                    id: axisLimitsLabel1
                    x: 25
                    y: -19
                    color: "#ffffff"
                    text: qsTr("Axis Limits")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
            }

            Rectangle {
                id: moreGraphSettings1
                x: 190
                y: 45
                width: 105
                height: 74
                color: "#00000000"
                TextField {
                    id: minAvgXAxisLimitsEntry1
                    x: 42
                    y: 23
                    width: 70
                    height: 16
                    placeholderText: qsTr("-10, None")
                    text: settings.minAvgXAxisLimitsEntry1
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: settings.minAvgXAxisLimitsEntry1 = minAvgXAxisLimitsEntry1.text
                    Label {
                        id: xAxisLabel2
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("X-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: minAvgYAxisLimitsEntry1
                    x: 42
                    y: 45
                    width: 70
                    height: 16
                    placeholderText: qsTr("25, 225")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    text: settings.minAvgYAxisLimitsEntry1
                    onTextChanged: settings.minAvgYAxisLimitsEntry1 = minAvgYAxisLimitsEntry1.text
                    Label {
                        id: yAxisLabel2
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("Y-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: postAnalysisXAxisLimitsEntry1
                    x: 42
                    y: 23
                    width: 70
                    height: 16
                    visible: true
                    text: settings.postXAxisLimitsEntry1
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: settings.postXAxisLimitsEntry1 = postAnalysisXAxisLimitsEntry1.text
                    placeholderText: qsTr("-10, None")
                    rotation: 0
                    Label {
                        id: xAxisLabel3
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("X-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: postAnalysisYAxisLimitsEntry1
                    x: 42
                    y: 45
                    width: 70
                    height: 16
                    visible: true
                    placeholderText: qsTr("None, None")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    text: settings.postYAxisLimitsEntry1
                    onTextChanged: settings.postYAxisLimitsEntry1 = postAnalysisYAxisLimitsEntry1.text
                    Label {
                        id: yAxisLabel3
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("Y-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }
            }




        }






        Rectangle {
            id: profileEntries2
            x: 0
            y: 0
            width: 200
            height: 272
            visible: false
            color: "#00000000"


            Rectangle {
                id: graphLabels2
                width: 200
                height: 200
                visible: true
                color: "#00000000"

                TextField {
                    id: minsTextEntry32
                    x: 17
                    y: 60
                    width: 25
                    height: 20
                    text: settings.minsTextEntry32
                    placeholderText: qsTr("-10")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash16
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry32 = minsTextEntry32.text
                }

                TextField {
                    id: minsTextEntry33
                    x: 53
                    y: 60
                    width: 25
                    height: 20
                    text: settings.minsTextEntry33
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    placeholderText: qsTr("-5")
                    onTextChanged: settings.minsTextEntry33 = minsTextEntry33.text
                }


                Label {
                    id: timeLabel2
                    x: 17
                    y: 30
                    width: 25
                    color: "#ffffff"
                    text: qsTr("Time (min)")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    anchors.leftMargin: 17
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                TextField {
                    id: minsTextEntry34
                    x: 17
                    y: 86
                    width: 25
                    height: 20
                    text: settings.minsTextEntry34
                    placeholderText: qsTr("-5")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash17
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry34 = minsTextEntry34.text
                }

                TextField {
                    id: minsTextEntry35
                    x: 53
                    y: 86
                    width: 25
                    height: 20
                    text: settings.minsTextEntry35
                    placeholderText: qsTr("0")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry35 = minsTextEntry35.text
                }

                TextField {
                    id: minsTextEntry36
                    x: 17
                    y: 112
                    width: 25
                    height: 20
                    text: settings.minsTextEntry36
                    placeholderText: qsTr("0")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash18
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry36 = minsTextEntry36.text
                }

                TextField {
                    id: minsTextEntry37
                    x: 53
                    y: 112
                    width: 25
                    height: 20
                    text: settings.minsTextEntry37
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    placeholderText: qsTr("5")
                    onTextChanged: settings.minsTextEntry37 = minsTextEntry37.text
                }

                TextField {
                    id: minsTextEntry38
                    x: 17
                    y: 138
                    width: 25
                    height: 20
                    text: settings.minsTextEntry38
                    placeholderText: qsTr("5")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash19
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry38 = minsTextEntry38.text
                }

                TextField {
                    id: minsTextEntry39
                    x: 53
                    y: 138
                    width: 25
                    height: 20
                    text: settings.minsTextEntry39
                    placeholderText: qsTr("10")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry39 = minsTextEntry39.text
                }

                TextField {
                    id: minsTextEntry40
                    x: 17
                    y: 164
                    width: 25
                    height: 20
                    text: settings.minsTextEntry40
                    placeholderText: qsTr("10")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash20
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry40 = minsTextEntry40.text
                }

                TextField {
                    id: minsTextEntry41
                    x: 53
                    y: 164
                    width: 25
                    height: 20
                    text: settings.minsTextEntry41
                    placeholderText: qsTr("15")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry41 = minsTextEntry41.text
                }

                TextField {
                    id: minsTextEntry42
                    x: 17
                    y: 190
                    width: 25
                    height: 20
                    text: settings.minsTextEntry42
                    placeholderText: qsTr("15")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash21
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry42 = minsTextEntry42.text
                }

                TextField {
                    id: minsTextEntry43
                    x: 53
                    y: 190
                    width: 25
                    height: 20
                    text: settings.minsTextEntry43
                    placeholderText: qsTr("20")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry43 = minsTextEntry43.text
                }

                TextField {
                    id: minsTextEntry44
                    x: 17
                    y: 216
                    width: 25
                    height: 20
                    text: settings.minsTextEntry44
                    placeholderText: qsTr("20")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash22
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry44 = minsTextEntry44.text
                }

                TextField {
                    id: minsTextEntry45
                    x: 53
                    y: 216
                    width: 25
                    height: 20
                    text: settings.minsTextEntry45
                    placeholderText: qsTr("25")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry45 = minsTextEntry45.text
                }

                TextField {
                    id: minsTextEntry46
                    x: 17
                    y: 242
                    width: 25
                    height: 20
                    text: settings.minsTextEntry46
                    placeholderText: qsTr("25")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    Label {
                        id: dash23
                        x: 28
                        y: 0
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("-")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.minsTextEntry46 = minsTextEntry46.text
                }

                TextField {
                    id: minsTextEntry47
                    x: 53
                    y: 242
                    width: 25
                    height: 20
                    text: settings.minsTextEntry47
                    placeholderText: qsTr("30")
                    font.family: fixedFont.font.family
                    font.pointSize: 8
                    onTextChanged: settings.minsTextEntry47 = minsTextEntry47.text
                }
            }

            Rectangle {
                id: graphEntries2
                width: 200
                height: 200
                color: "#00000000"
                TextField {
                    id: graphEntry16
                    x: 94
                    y: 60
                    width: 91
                    height: 20
                    text: settings.graphEntry0String2
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 60
                    anchors.leftMargin: 94
                    placeholderText: qsTr("gray")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry0String2 = graphEntry16.text
                    }
                }

                TextField {
                    id: graphEntry17
                    x: 94
                    y: 86
                    width: 91
                    height: 20
                    text: settings.graphEntry1String2
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 86
                    anchors.leftMargin: 94
                    placeholderText: qsTr("black")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry1String2 = graphEntry17.text
                    }
                }

                TextField {
                    id: graphEntry18
                    x: 94
                    y: 112
                    width: 91
                    height: 20
                    text: settings.graphEntry2String2
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 112
                    anchors.leftMargin: 94
                    placeholderText: qsTr("gray")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry2String2 = graphEntry18.text
                    }
                }

                TextField {
                    id: graphEntry19
                    x: 94
                    y: 138
                    width: 91
                    height: 20
                    text: settings.graphEntry3String2
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 138
                    anchors.leftMargin: 94
                    placeholderText: qsTr("purple")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry3String2 = graphEntry19.text
                    }
                }

                TextField {
                    id: graphEntry20
                    x: 94
                    y: 164
                    width: 91
                    height: 20
                    text: settings.graphEntry4String2
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 164
                    anchors.leftMargin: 94
                    placeholderText: qsTr("green")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry4String2 = graphEntry20.text
                    }
                }

                TextField {
                    id: graphEntry21
                    x: 94
                    y: 190
                    width: 91
                    height: 20
                    text: settings.graphEntry5String2
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 190
                    anchors.leftMargin: 94
                    placeholderText: qsTr("blue")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry5String2 = graphEntry21.text
                    }
                }

                TextField {
                    id: graphEntry22
                    x: 94
                    y: 216
                    width: 91
                    height: 20
                    text: settings.graphEntry6String2
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 216
                    anchors.leftMargin: 94
                    placeholderText: qsTr("orange")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry6String2 = graphEntry22.text
                    }
                }

                TextField {
                    id: graphEntry23
                    x: 94
                    y: 242
                    width: 91
                    height: 20
                    text: settings.graphEntry7String2
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 242
                    anchors.leftMargin: 94
                    placeholderText: qsTr("red")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: {
                        settings.graphEntry7String2 = graphEntry23.text
                    }
                }
            }


            CheckBox {
                id: colorCode2
                x: 336
                y: 32
                anchors.top: parent.top
                anchors.topMargin: 32
                width: 19
                height: 16
                onCheckStateChanged: {

                    settings.colorCodeCheckBoxVar2 = colorCode2.checkState
                    if(colorCode2.checkState == false){

                        if(customColorsComboBox.currentIndex == 3) {
                            singleColorGraphEntry.visible = false
                        } else {
                            graphLabels2.visible = false
                            graphEntries2.visible = false
                        }
                    } else {
                        if(customColorsComboBox.currentIndex == 3) {
                            singleColorGraphEntry.visible = true
                        } else {
                            graphLabels2.visible = true
                            graphEntries2.visible = true
                        }
                    }
                }
                Label {
                    id: colorCodeLabel2
                    x: 19
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Color Code")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
                checkState: settings.colorCodeCheckBoxVar2
            }



            Label {
                id: graphQualityLabel2
                x: 339
                y: 86
                color: "#ffffff"
                text: qsTr("Graph Quality")
                font.family: fixedFont.font.family
                font.pointSize: 9
                ComboBox {
                    id: graphQualityComboBox2
                    x: -21
                    y: 22
                    width: 115
                    height: 20
                    currentIndex: settings.graphQualityIndex2
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onCurrentIndexChanged: {
                        settings.graphQualityIndex2 = graphQualityComboBox2.currentIndex
                        if(graphQualityComboBox2.currentIndex == 4) {
                            customDpiEntry2.visible = true
                        } else {
                            customDpiEntry2.visible = false
                        }
                    }
                    model: [ "Low", "Medium", "High", "Ultra", "Custom" ]

                    contentItem: Text {
                        text: graphQualityComboBox2.displayText
                        color: "black"
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: customDpiEntry2
                    x: -21
                    y: 65
                    width: 86
                    height: 20
                    visible: true
                    text: settings.customDpiEntryString2
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    Label {
                        id: customDpiLabel2
                        x: 99
                        y: 2
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("DPI")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.customDpiEntryString2 = customDpiEntry2.text
                }
            }



            CheckBox {
                id: baselineCheckBox2
                x: 329
                y: 185
                width: 19
                height: 16
                onCheckStateChanged: {
                    if(baselineCheckBox2.checkState == false){
                        baselineField2.visible = false
                        settings.baselineCheckBoxVar2 = Qt.Unchecked
                    } else {
                        baselineField2.visible = true
                        settings.baselineCheckBoxVar2 = Qt.Checked
                    }
                }
                Label {
                    id: baselineLanel2
                    x: 19
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Display Baseline")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                TextField {
                    id: baselineField2
                    x: -9
                    y: 31
                    text: settings.baselineColorString2
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    placeholderText: qsTr("Baseline color")
                    onTextChanged: settings.baselineColorString2 = baselineField2.text
                }
                checkState: settings.baselineCheckBoxVar2
            }



            CheckBox {
                id: removeOutliersCheckBox2
                x: 86
                y: 286
                width: 19
                height: 16
                onCheckStateChanged: {
                    if(removeOutliersCheckBox2.checkState == false){
                        zscoreLabel2.visible = false
                        settings.removeOutliersCheckBoxVar2 = Qt.Unchecked
                    } else {
                        zscoreLabel2.visible = true
                        settings.removeOutliersCheckBoxVar2 = Qt.Checked
                    }
                }
                Label {
                    id: removeOutliersLabel2
                    x: 16
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Remove Outliers")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    styleColor: "#ffffff"
                }

                Label {
                    id: zscoreLabel2
                    x: 0
                    y: 28
                    color: "#ffffff"
                    text: qsTr("Z-Score >")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    TextField {
                        id: zScoreEntry2
                        x: 59
                        y: 0
                        width: 47
                        height: 20
                        text: settings.zScoreEntry2
                        placeholderText: qsTr("2.5")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                        onTextChanged: settings.zScoreEntry2 = zScoreEntry2.text
                    }
                }
                checkState: settings.removeOutliersCheckBoxVar2
            }



            ResetButton {
                id: resetButton2
                x: 349
                y: 315
                width: 63
                height: 27
                font.family: fixedFont.font.family
                font.pointSize: 9
                onClicked: {
                    graphQualityComboBox2.currentIndex = 1
                    baselineCheckBox2.checkState = Qt.Checked
                    colorCode2.checkState = Qt.Checked
                    removeOutliersCheckBox2.checkState = Qt.Checked
                    settings.graphEntry0String2 = ""
                    settings.graphEntry1String2 = ""
                    settings.graphEntry2String2 = ""
                    settings.graphEntry3String2 = ""
                    settings.graphEntry4String2 = ""
                    settings.graphEntry5String2 = ""
                    settings.graphEntry6String2 = ""
                    settings.graphEntry7String2 = ""
                    settings.baselineColorString2 = ""
                    settings.customDpiEntryString2 = ""
                    settings.zScoreEntry2 = ""
                    zScoreEntry2.text = ""
                    settings.baselineEntryText2 = ""
                    settings.minAvgXAxisLimitsEntry2 = ""
                    settings.minAvgYAxisLimitsEntry2 = ""
                    settings.postXAxisLimitsEntry2 = ""
                    settings.postYAxisLimitsEntry2 = ""
                    axisLimitsComboBox2.currentIndex = 0

                    settings.minsTextEntry32 = ""
                    settings.minsTextEntry33 = ""
                    settings.minsTextEntry34 = ""
                    settings.minsTextEntry35 = ""
                    settings.minsTextEntry36 = ""
                    settings.minsTextEntry37 = ""
                    settings.minsTextEntry38 = ""
                    settings.minsTextEntry39 = ""
                    settings.minsTextEntry40 = ""
                    settings.minsTextEntry41 = ""
                    settings.minsTextEntry42 = ""
                    settings.minsTextEntry43 = ""
                    settings.minsTextEntry44 = ""
                    settings.minsTextEntry45 = ""
                    settings.minsTextEntry46 = ""
                    settings.minsTextEntry47 = ""



                }
            }



            TextField {
                id: baselineEntry2
                x: 320
                y: 275
                width: 121
                height: 20
                text: settings.baselineEntryText2
                font.family: fixedFont.font.family
                font.pointSize: 9
                placeholderText: qsTr("Baseline value: 10")
                onTextChanged: {
                    settings.baselineEntryText2 = baselineEntry2.text
                }

                Label {
                    id: baselineFieldLabel2
                    x: 10
                    y: -21
                    color: "#ffffff"
                    text: qsTr("Baseline time (min)")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
            }


            ComboBox {
                id: axisLimitsComboBox2
                x: 199
                y: 32
                width: 110
                height: 20
                currentIndex: settings.axisLimitsIndex2
                font.family: fixedFont.font.family
                font.pointSize: 9
                onCurrentIndexChanged: {

                    settings.axisLimitsIndex2 = axisLimitsComboBox2.currentIndex
                    if (axisLimitsComboBox2.currentIndex == 1) {
                        minAvgXAxisLimitsEntry2.visible = false
                        minAvgYAxisLimitsEntry2.visible = false
                        postAnalysisXAxisLimitsEntry2.visible = true
                        postAnalysisYAxisLimitsEntry2.visible = true
                    } else {
                        minAvgXAxisLimitsEntry2.visible = true
                        minAvgYAxisLimitsEntry2.visible = true
                        postAnalysisXAxisLimitsEntry2.visible = false
                        postAnalysisYAxisLimitsEntry2.visible = false
                    }
                }
                model: [ "Minute Averaged", "Post Analysis" ]
                contentItem: Text {
                    text: axisLimitsComboBox2.displayText
                    color: "black"
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                Label {
                    id: axisLimitsLabel2
                    x: 25
                    y: -19
                    color: "#ffffff"
                    text: qsTr("Axis Limits")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
            }

            Rectangle {
                id: moreGraphSettings2
                x: 190
                y: 45
                width: 105
                height: 74
                color: "#00000000"
                TextField {
                    id: minAvgXAxisLimitsEntry2
                    x: 42
                    y: 23
                    width: 70
                    height: 16
                    placeholderText: qsTr("-10, None")
                    text: settings.minAvgXAxisLimitsEntry2
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: settings.minAvgXAxisLimitsEntry2 = minAvgXAxisLimitsEntry2.text
                    Label {
                        id: xAxisLabel4
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("X-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: minAvgYAxisLimitsEntry2
                    x: 42
                    y: 45
                    width: 70
                    height: 16
                    placeholderText: qsTr("25, 225")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    text: settings.minAvgYAxisLimitsEntry2
                    onTextChanged: settings.minAvgYAxisLimitsEntry2 = minAvgYAxisLimitsEntry2.text
                    Label {
                        id: yAxisLabel4
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("Y-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: postAnalysisXAxisLimitsEntry2
                    x: 42
                    y: 23
                    width: 70
                    height: 16
                    visible: true
                    placeholderText: qsTr("-10, None")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    text: settings.postXAxisLimitsEntry2
                    onTextChanged: settings.postXAxisLimitsEntry2 =  postAnalysisXAxisLimitsEntry2.text
                    rotation: 0
                    Label {
                        id: xAxisLabel5
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("X-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: postAnalysisYAxisLimitsEntry2
                    x: 42
                    y: 45
                    width: 70
                    height: 16
                    visible: true
                    text: settings.postYAxisLimitsEntry2
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: settings.postYAxisLimitsEntry2 =  postAnalysisYAxisLimitsEntry2.text
                    placeholderText: qsTr("None, None")

                    Label {
                        id: yAxisLabel5
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("Y-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }
            }



        }







        Connections {
            target: backend
            // Should be good
            function onGetTheColors() {
                if (settings.customsColorsIndex == 0) {
                    if (settings.colorCodeCheckBoxVar == Qt.Checked) {
                        const colorCodes = []
                        colorCodes.push(graphEntry0.text)
                        colorCodes.push(graphEntry1.text)
                        colorCodes.push(graphEntry2.text)
                        colorCodes.push(graphEntry3.text)
                        colorCodes.push(graphEntry4.text)
                        colorCodes.push(graphEntry5.text)
                        colorCodes.push(graphEntry6.text)
                        colorCodes.push(graphEntry7.text)
                        backend.receiveColors(colorCodes)

                    } else {
                        const colorCodes = ['gray', 'gray', 'gray', 'gray', 'gray',
                                            'gray', 'gray', 'gray']
                        backend.receiveColors(colorCodes)
                    }
                } else if (settings.customsColorsIndex == 1) {
                    if (settings.colorCodeCheckBoxVar1 == Qt.Checked) {
                        const colorCodes = []
                        colorCodes.push(graphEntry8.text)
                        colorCodes.push(graphEntry9.text)
                        colorCodes.push(graphEntry10.text)
                        colorCodes.push(graphEntry11.text)
                        colorCodes.push(graphEntry12.text)
                        colorCodes.push(graphEntry13.text)
                        colorCodes.push(graphEntry14.text)
                        colorCodes.push(graphEntry15.text)
                        backend.receiveColors(colorCodes)

                    } else {
                        const colorCodes = ['gray', 'gray', 'gray', 'gray', 'gray',
                                            'gray', 'gray', 'gray']
                        backend.receiveColors(colorCodes)
                    }
                } else if (settings.customsColorsIndex == 2) {
                    if (settings.colorCodeCheckBoxVar2 == Qt.Checked) {
                        const colorCodes = []
                        colorCodes.push(graphEntry16.text)
                        colorCodes.push(graphEntry17.text)
                        colorCodes.push(graphEntry18.text)
                        colorCodes.push(graphEntry19.text)
                        colorCodes.push(graphEntry20.text)
                        colorCodes.push(graphEntry21.text)
                        colorCodes.push(graphEntry22.text)
                        colorCodes.push(graphEntry23.text)
                        backend.receiveColors(colorCodes)

                    } else {
                        const colorCodes = ['gray', 'gray', 'gray', 'gray', 'gray',
                                            'gray', 'gray', 'gray']
                        backend.receiveColors(colorCodes)
                    }
                }

                else if (settings.customsColorsIndex == 3) {
                    if (settings.colorCodeCheckBoxVar3 == Qt.Checked) {
                        if (singleColorGraphEntry.text == '') {
                            const colorCodes = ['gray', 'gray', 'gray', 'gray', 'gray',
                                                'gray', 'gray', 'gray']
                            backend.receiveColors(colorCodes)
                        } else {
                            const colorCodes = []
                            colorCodes.push(singleColorGraphEntry.text)
                            colorCodes.push(singleColorGraphEntry.text)
                            colorCodes.push(singleColorGraphEntry.text)
                            colorCodes.push(singleColorGraphEntry.text)
                            colorCodes.push(singleColorGraphEntry.text)
                            colorCodes.push(singleColorGraphEntry.text)
                            colorCodes.push(singleColorGraphEntry.text)
                            colorCodes.push(singleColorGraphEntry.text)
                            backend.receiveColors(colorCodes)
                        }
                    } else {
                        const colorCodes = ['gray', 'gray', 'gray', 'gray', 'gray',
                                            'gray', 'gray', 'gray']
                        backend.receiveColors(colorCodes)
                    }
                }
            }
            // Should be good
            function onGetBaselineColor(){
                if (settings.customsColorsIndex == 0) {
                    if (settings.baselineCheckBoxVar == Qt.Checked) {
                        const baselineColor = baselineField0.text
                        backend.receiveBaselineColor(baselineColor)
                    } else {
                        const baselineColor = "false"
                        backend.receiveBaselineColor(baselineColor)
                    }
                } else if (settings.customsColorsIndex == 1) {
                    if (settings.baselineCheckBoxVar1 == Qt.Checked) {
                        const baselineColor = baselineField1.text
                        backend.receiveBaselineColor(baselineColor)
                    } else {
                        const baselineColor = "false"
                        backend.receiveBaselineColor(baselineColor)
                    }
                } else if (settings.customsColorsIndex == 2) {
                    if (settings.baselineCheckBoxVar2 == Qt.Checked) {
                        const baselineColor = baselineField2.text
                        backend.receiveBaselineColor(baselineColor)
                    } else {
                        const baselineColor = "false"
                        backend.receiveBaselineColor(baselineColor)
                    }
                } else if (settings.customsColorsIndex == 3) {
                    if (settings.baselineCheckBoxVar3 == Qt.Checked) {
                        const baselineColor = baselineField3.text
                        backend.receiveBaselineColor(baselineColor)
                    } else {
                        const baselineColor = "false"
                        backend.receiveBaselineColor(baselineColor)
                    }
                }

            }

            // Should be good
            function onGetDpi() {
                if (settings.customsColorsIndex == 0) {
                    if (customDpiEntry0.visible == true) {
                        const dpi = customDpiEntry0.text
                        backend.receiveDpi(dpi)
                    } else {
                        const dpi = graphQualityComboBox0.currentIndex
                        backend.receiveDpi(dpi)
                    }
                } else if (settings.customsColorsIndex == 1) {
                    if (customDpiEntry1.visible == true) {
                        const dpi = customDpiEntry1.text
                        backend.receiveDpi(dpi)
                    } else {
                        const dpi = graphQualityComboBox1.currentIndex
                        backend.receiveDpi(dpi)
                    }
                } else if (settings.customsColorsIndex == 2) {
                    if (customDpiEntry2.visible == true) {
                        const dpi = customDpiEntry2.text
                        backend.receiveDpi(dpi)
                    } else {
                        const dpi = graphQualityComboBox2.currentIndex
                        backend.receiveDpi(dpi)
                    }
                } else if (settings.customsColorsIndex == 3) {
                    if (customDpiEntry3.visible == true) {
                        const dpi = customDpiEntry3.text
                        backend.receiveDpi(dpi)
                    } else {
                        const dpi = graphQualityComboBox3.currentIndex
                        backend.receiveDpi(dpi)
                    }
                }

            }
            // Should be good
            function onGetZscore() {
                if (settings.customsColorsIndex === 1) {
                    if (settings.removeOutliersCheckBoxVar1 == Qt.Checked) {
                        const zScore = zScoreEntry1.text
                        backend.receiveZscore(zScore)
                    } else {
                        const zScore = "false"
                        backend.receiveZscore(zScore)
                    }
                } else if (settings.customsColorsIndex === 2) {
                    if (settings.removeOutliersCheckBoxVar2 == Qt.Checked) {
                        const zScore = zScoreEntry2.text
                        backend.receiveZscore(zScore)
                    } else {
                        const zScore = "false"
                        backend.receiveZscore(zScore)
                    }
                } else if (settings.customsColorsIndex === 3) {
                    if (settings.removeOutliersCheckBoxVar3 == Qt.Checked) {
                        const zScore = zScoreEntry3.text
                        backend.receiveZscore(zScore)
                    } else {
                        const zScore = "false"
                        backend.receiveZscore(zScore)
                    }

                } else {
                    if (settings.removeOutliersCheckBoxVar == Qt.Checked) {
                        const zScore = zScoreEntry0.text
                        backend.receiveZscore(zScore)
                    } else {
                        const zScore = "false"
                        backend.receiveZscore(zScore)
                    }
                }
            }

            function onGetBaselineValue() {
                if (settings.customsColorsIndex == 0) {
                    const baselineEntry = baselineEntry0.text
                    backend.receiveBaselineValue(baselineEntry)
                } else if (settings.customsColorsIndex == 1) {
                    const baselineEntry = baselineEntry1.text
                    backend.receiveBaselineValue(baselineEntry)
                } else if (settings.customsColorsIndex == 2) {
                    const baselineEntry = baselineEntry2.text
                    backend.receiveBaselineValue(baselineEntry)
                } else if (settings.customsColorsIndex == 3) {
                    const baselineEntry = baselineEntry3.text
                    backend.receiveBaselineValue(baselineEntry)
                }
            }

            function onGetAxisLimits() {
                if (settings.customsColorsIndex == 0) {
                    const axisLimits = []
                    axisLimits.push(minAvgXAxisLimitsEntry0.text.split(','))
                    axisLimits.push(minAvgYAxisLimitsEntry0.text.split(','))
                    axisLimits.push(postAnalysisXAxisLimitsEntry0.text.split(','))
                    axisLimits.push(postAnalysisYAxisLimitsEntry0.text.split(','))
                    backend.receiveAxisLimits(axisLimits)
                } else if (settings.customsColorsIndex == 1) {
                    const axisLimits = []
                    axisLimits.push(minAvgXAxisLimitsEntry1.text.split(','))
                    axisLimits.push(minAvgYAxisLimitsEntry1.text.split(','))
                    axisLimits.push(postAnalysisXAxisLimitsEntry1.text.split(','))
                    axisLimits.push(postAnalysisYAxisLimitsEntry1.text.split(','))
                    backend.receiveAxisLimits(axisLimits)
                } else if (settings.customsColorsIndex == 2) {
                    const axisLimits = []
                    axisLimits.push(minAvgXAxisLimitsEntry2.text.split(','))
                    axisLimits.push(minAvgYAxisLimitsEntry2.text.split(','))
                    axisLimits.push(postAnalysisXAxisLimitsEntry2.text.split(','))
                    axisLimits.push(postAnalysisYAxisLimitsEntry2.text.split(','))
                    backend.receiveAxisLimits(axisLimits)
                } else if (settings.customsColorsIndex == 3) {
                    const axisLimits = []
                    axisLimits.push(minAvgXAxisLimitsEntry3.text.split(','))
                    axisLimits.push(minAvgYAxisLimitsEntry3.text.split(','))
                    axisLimits.push(postAnalysisXAxisLimitsEntry3.text.split(','))
                    axisLimits.push(postAnalysisYAxisLimitsEntry3.text.split(','))
                    backend.receiveAxisLimits(axisLimits)
                }
            }

            function onGetGraphPoints() {
                if (settings.customsColorsIndex == 0) {
                    const graphPoints = []
                    graphPoints.push(minsTextEntry0.text)
                    graphPoints.push(minsTextEntry1.text)
                    graphPoints.push(minsTextEntry2.text)
                    graphPoints.push(minsTextEntry3.text)
                    graphPoints.push(minsTextEntry4.text)
                    graphPoints.push(minsTextEntry5.text)
                    graphPoints.push(minsTextEntry6.text)
                    graphPoints.push(minsTextEntry7.text)
                    graphPoints.push(minsTextEntry8.text)
                    graphPoints.push(minsTextEntry9.text)
                    graphPoints.push(minsTextEntry10.text)
                    graphPoints.push(minsTextEntry11.text)
                    graphPoints.push(minsTextEntry12.text)
                    graphPoints.push(minsTextEntry13.text)
                    graphPoints.push(minsTextEntry14.text)
                    graphPoints.push(minsTextEntry15.text)
                    backend.receiveGraphPoints(graphPoints)
                } else if (settings.customsColorsIndex == 1) {
                    const graphPoints = []
                    graphPoints.push(minsTextEntry16.text)
                    graphPoints.push(minsTextEntry17.text)
                    graphPoints.push(minsTextEntry18.text)
                    graphPoints.push(minsTextEntry19.text)
                    graphPoints.push(minsTextEntry20.text)
                    graphPoints.push(minsTextEntry21.text)
                    graphPoints.push(minsTextEntry22.text)
                    graphPoints.push(minsTextEntry23.text)
                    graphPoints.push(minsTextEntry24.text)
                    graphPoints.push(minsTextEntry25.text)
                    graphPoints.push(minsTextEntry26.text)
                    graphPoints.push(minsTextEntry27.text)
                    graphPoints.push(minsTextEntry28.text)
                    graphPoints.push(minsTextEntry29.text)
                    graphPoints.push(minsTextEntry30.text)
                    graphPoints.push(minsTextEntry31.text)
                    backend.receiveGraphPoints(graphPoints)
                } else if (settings.customsColorsIndex == 2) {
                    const graphPoints = []
                    graphPoints.push(minsTextEntry32.text)
                    graphPoints.push(minsTextEntry33.text)
                    graphPoints.push(minsTextEntry34.text)
                    graphPoints.push(minsTextEntry35.text)
                    graphPoints.push(minsTextEntry36.text)
                    graphPoints.push(minsTextEntry37.text)
                    graphPoints.push(minsTextEntry38.text)
                    graphPoints.push(minsTextEntry39.text)
                    graphPoints.push(minsTextEntry40.text)
                    graphPoints.push(minsTextEntry41.text)
                    graphPoints.push(minsTextEntry42.text)
                    graphPoints.push(minsTextEntry43.text)
                    graphPoints.push(minsTextEntry44.text)
                    graphPoints.push(minsTextEntry45.text)
                    graphPoints.push(minsTextEntry46.text)
                    graphPoints.push(minsTextEntry47.text)
                    backend.receiveGraphPoints(graphPoints)
                } else {
                    const graphPoints = []
                    backend.receiveGraphPoints(graphPoints)
                }
            }

        }








        Rectangle {
            id: profileEntries3
            x: 0
            y: 0
            width: 200
            height: 272
            visible: false
            color: "#00000000"


            TextField {
                id: singleColorGraphEntry
                x: 81
                y: 2
                width: 91
                height: 20
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 94
                placeholderText: qsTr("gray")
                font.family: fixedFont.font.family
                font.pointSize: 9
                anchors.topMargin: 60
                visible: true
                text: settings.singleColorGraphEntryString
                onTextChanged: {
                    settings.singleColorGraphEntryString = singleColorGraphEntry.text
                }
            }

            CheckBox {
                id: colorCode3
                x: 336
                y: 32
                anchors.top: parent.top
                anchors.topMargin: 32
                width: 19
                height: 16
                onCheckStateChanged: {

                    settings.colorCodeCheckBoxVar3 = colorCode3.checkState
                    if(colorCode3.checkState == false){

                        if(customColorsComboBox.currentIndex == 3) {
                            singleColorGraphEntry.visible = false
                        } else {
                        }
                    } else {
                        if(customColorsComboBox.currentIndex == 3) {
                            singleColorGraphEntry.visible = true
                        } else {
                        }
                    }
                }
                Label {
                    id: colorCodeLabel3
                    x: 19
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Color Code")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
                checkState: settings.colorCodeCheckBoxVar3
            }


            Label {
                id: graphQualityLabel3
                x: 339
                y: 86
                color: "#ffffff"
                text: qsTr("Graph Quality")
                font.family: fixedFont.font.family
                font.pointSize: 9
                ComboBox {
                    id: graphQualityComboBox3
                    x: -21
                    y: 22
                    width: 115
                    height: 20
                    currentIndex: settings.graphQualityIndex3
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onCurrentIndexChanged: {
                        settings.graphQualityIndex3 = graphQualityComboBox3.currentIndex
                        if(graphQualityComboBox3.currentIndex == 4) {
                            customDpiEntry3.visible = true
                        } else {
                            customDpiEntry3.visible = false
                        }
                    }
                    model: [ "Low", "Medium", "High", "Ultra", "Custom" ]

                    contentItem: Text {
                        text: graphQualityComboBox3.displayText
                        color: "black"
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: customDpiEntry3
                    x: -21
                    y: 65
                    width: 86
                    height: 20
                    visible: true
                    text: settings.customDpiEntryString3
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    Label {
                        id: customDpiLabel3
                        x: 99
                        y: 2
                        width: 38
                        height: 16
                        color: "#ffffff"
                        text: qsTr("DPI")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                    onTextChanged: settings.customDpiEntryString33 = customDpiEntry3.text
                }
            }


            CheckBox {
                id: baselineCheckBox3
                x: 329
                y: 185
                width: 19
                height: 16
                onCheckStateChanged: {
                    if(baselineCheckBox3.checkState == false){
                        baselineField3.visible = false
                        settings.baselineCheckBoxVar3 = Qt.Unchecked
                    } else {
                        baselineField3.visible = true
                        settings.baselineCheckBoxVar3 = Qt.Checked
                    }
                }
                Label {
                    id: baselineLanel3
                    x: 19
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Display Baseline")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                TextField {
                    id: baselineField3
                    x: -9
                    y: 31
                    text: settings.baselineColorString3
                    placeholderText: qsTr("Baseline color")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    onTextChanged: settings.baselineColorString3 = baselineField3.text
                }
                checkState: settings.baselineCheckBoxVar3
            }


            CheckBox {
                id: removeOutliersCheckBox3
                x: 86
                y: 286
                width: 19
                height: 16
                onCheckStateChanged: {
                    if(removeOutliersCheckBox3.checkState == false){
                        zscoreLabel3.visible = false
                        settings.removeOutliersCheckBoxVar3 = Qt.Unchecked
                    } else {
                        zscoreLabel3.visible = true
                        settings.removeOutliersCheckBoxVar3 = Qt.Checked
                    }
                }
                Label {
                    id: removeOutliersLabel3
                    x: 16
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Remove Outliers")
                    styleColor: "#ffffff"
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                Label {
                    id: zscoreLabel3
                    x: 0
                    y: 28
                    color: "#ffffff"
                    text: qsTr("Z-Score >")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    TextField {
                        id: zScoreEntry3
                        x: 59
                        y: 0
                        width: 47
                        height: 20
                        text: settings.zScoreEntry3
                        placeholderText: qsTr("2.5")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                        onTextChanged: settings.zScoreEntry3 = zScoreEntry3.text
                    }
                }
                checkState: settings.removeOutliersCheckBoxVar3
            }


            ResetButton {
                id: resetButton3
                x: 349
                y: 315
                width: 63
                height: 27
                font.family: fixedFont.font.family
                font.pointSize: 9
                onClicked: {
                    graphQualityComboBox3.currentIndex = 1
                    baselineCheckBox3.checkState = Qt.Checked
                    colorCode3.checkState = Qt.Checked
                    removeOutliersCheckBox3.checkState = Qt.Checked
                    settings.singleColorGraphEntryString = ""
                    settings.baselineColorString3 = ""
                    settings.customDpiEntryString3 = ""
                    settings.zScoreEntry3 = ""
                    zScoreEntry3.text = ""
                    settings.baselineEntryText3 = ""
                    settings.minAvgXAxisLimitsEntry3 = ""
                    settings.minAvgYAxisLimitsEntry3 = ""
                    settings.postXAxisLimitsEntry3 = ""
                    settings.postYAxisLimitsEntry = ""
                    axisLimitsComboBox0.currentIndex = 0

                }
            }

            TextField {
                id: baselineEntry3
                x: 320
                y: 275
                width: 121
                height: 20
                text: settings.baselineEntryText3
                placeholderText: qsTr("Baseline value: 10")
                font.family: fixedFont.font.family
                font.pointSize: 9
                onTextChanged: {
                    settings.baselineEntryText3 = baselineEntry3.text
                }

                Label {
                    id: baselineFieldLabel3
                    x: 10
                    y: -21
                    color: "#ffffff"
                    text: qsTr("Baseline time (min)")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
            }

            ComboBox {
                id: axisLimitsComboBox3
                x: 199
                y: 32
                width: 110
                height: 20
                currentIndex: settings.axisLimitsIndex3
                font.family: fixedFont.font.family
                font.pointSize: 9
                onCurrentIndexChanged: {

                    settings.axisLimitsIndex3 = axisLimitsComboBox3.currentIndex
                    if (axisLimitsComboBox3.currentIndex == 1) {
                        minAvgXAxisLimitsEntry3.visible = false
                        minAvgYAxisLimitsEntry3.visible = false
                        postAnalysisXAxisLimitsEntry3.visible = true
                        postAnalysisYAxisLimitsEntry3.visible = true
                    } else {
                        minAvgXAxisLimitsEntry3.visible = true
                        minAvgYAxisLimitsEntry3.visible = true
                        postAnalysisXAxisLimitsEntry3.visible = false
                        postAnalysisYAxisLimitsEntry3.visible = false
                    }
                }
                model: [ "Minute Averaged", "Post Analysis" ]
                contentItem: Text {
                    text: axisLimitsComboBox3.displayText
                    color: "black"
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }

                Label {
                    id: axisLimitsLabel3
                    x: 25
                    y: -19
                    color: "#ffffff"
                    text: qsTr("Axis Limits")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                }
            }

            Rectangle {
                id: moreGraphSettings3
                x: 190
                y: 45
                width: 105
                height: 74
                color: "#00000000"
                TextField {
                    id: minAvgXAxisLimitsEntry3
                    x: 42
                    y: 23
                    width: 70
                    height: 16
                    text: settings.minAvgXAxisLimitsEntry3
                    onTextChanged: settings.minAvgXAxisLimitsEntry3 =  minAvgXAxisLimitsEntry3.text
                    placeholderText: qsTr("-10, None")
                    font.family: fixedFont.font.family
                    font.pointSize: 9

                    Label {
                        id: xAxisLabel6
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("X-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: minAvgYAxisLimitsEntry3
                    x: 42
                    y: 45
                    width: 70
                    height: 16
                    placeholderText: qsTr("25, 225")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    text: settings.minAvgYAxisLimitsEntry3
                    onTextChanged: settings.minAvgYAxisLimitsEntry3 =  minAvgYAxisLimitsEntry3.text
                    Label {
                        id: yAxisLabel6
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("Y-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: postAnalysisXAxisLimitsEntry3
                    x: 42
                    y: 23
                    width: 70
                    height: 16
                    visible: true
                    placeholderText: qsTr("-10, None")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    text: settings.postXAxisLimitsEntry3
                    onTextChanged: settings.postXAxisLimitsEntry3 =  postAnalysisXAxisLimitsEntry3.text
                    rotation: 0
                    Label {
                        id: xAxisLabel7
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("X-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }

                TextField {
                    id: postAnalysisYAxisLimitsEntry3
                    x: 42
                    y: 45
                    width: 70
                    height: 16
                    visible: true
                    placeholderText: qsTr("None, None")
                    font.family: fixedFont.font.family
                    font.pointSize: 9
                    text: settings.postYAxisLimitsEntry3
                    onTextChanged: settings.postYAxisLimitsEntry3 =  postAnalysisYAxisLimitsEntry3.text
                    Label {
                        id: yAxisLabel7
                        x: -39
                        y: 0
                        color: "#ffffff"
                        text: qsTr("Y-Axis")
                        font.family: fixedFont.font.family
                        font.pointSize: 9
                    }
                }
            }


        }
















    }

}












