import QtQuick 2.9
import QtQuick.Controls 6.2

Item {
    id: itemFrame
    width: 499
    height: 494
    property int flickableContentHeight : 404
    property real scrollBar: ScrollBar.AsNeeded

    ScrollView {
        id: frame
        anchors.fill: parent

        Flickable {
            id: flickable
            width: parent.width
            contentHeight: flickableContentHeight
            ScrollBar.vertical: ScrollBar {
                id: theScrollBar
                hoverEnabled: true
                active: hovered || pressed
                policy: scrollBar
                parent: flickable.parent
                anchors.top: flickable.top
                anchors.left: flickable.right
                anchors.bottom: flickable.bottom
            }

            Rectangle {
                id: rectangle
                color: "#2c313c"
                anchors.fill: parent





                Label {
                    id: fileLabel0
                    x: 15
                    y: 5
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false
                }








                Label {
                    id: fileLabel1
                    x: 15
                    y: 33
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false
                }





                Label {
                    id: fileLabel2
                    x: 15
                    y: 63
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false

                }





                Label {
                    id: fileLabel3
                    x: 15
                    y: 93
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false

                }





                Label {
                    id: fileLabel4
                    x: 15
                    y: 123
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false

                }






                Label {
                    id: fileLabel5
                    x: 15
                    y: 153
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false
                }





                Label {
                    id: fileLabel6
                    x: 15
                    y: 183
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false
                }





                Label {
                    id: fileLabel7
                    x: 15
                    y: 213
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false
                }





                Label {
                    id: fileLabel8
                    x: 15
                    y: 243
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false

                }





                Label {
                    id: fileLabel9
                    x: 15
                    y: 273
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false
                }





                Label {
                    id: fileLabel10
                    x: 15
                    y: 303
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false
                }






                Label {
                    id: fileLabel11
                    x: 15
                    y: 333
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                    //            visible: false
                }




                QtObject{
                    id: internal
                    // Internal QML function for clearing all of the file labels and entries from the screen.
                    function clearFiles() {
                        const labels = [fileLabel0, fileLabel1, fileLabel2, fileLabel3,
                                        fileLabel4, fileLabel5, fileLabel6, fileLabel7,
                                        fileLabel8, fileLabel9, fileLabel10, fileLabel11,
                                        fileLabel12, fileLabel13, fileLabel14, fileLabel15, fileLabel16,
                                        fileLabel17, fileLabel18, fileLabel19, fileLabel20, fileLabel21,
                                        fileLabel22, fileLabel23]
                        const drugNameEntries = [drugNameEntry0, drugNameEntry1, drugNameEntry2, drugNameEntry3, drugNameEntry4,
                                                 drugNameEntry5, drugNameEntry6, drugNameEntry7, drugNameEntry8, drugNameEntry9,
                                                 drugNameEntry10, drugNameEntry11, drugNameEntry12, drugNameEntry13, drugNameEntry14,
                                                 drugNameEntry15, drugNameEntry16, drugNameEntry17, drugNameEntry18, drugNameEntry19, drugNameEntry20,
                                                 drugNameEntry21, drugNameEntry22, drugNameEntry23]
                        const traceNumberEntries = [traceNumberEntry0, traceNumberEntry1, traceNumberEntry2, traceNumberEntry3, traceNumberEntry4,
                                                    traceNumberEntry5, traceNumberEntry6, traceNumberEntry7, traceNumberEntry8, traceNumberEntry9,
                                                    traceNumberEntry10, traceNumberEntry11, traceNumberEntry12, traceNumberEntry13, traceNumberEntry14,
                                                    traceNumberEntry15, traceNumberEntry16, traceNumberEntry17, traceNumberEntry18, traceNumberEntry19,
                                                    traceNumberEntry20, traceNumberEntry21, traceNumberEntry22, traceNumberEntry23]
                        const excludedTracesEntries = [excludedTracesEntry0, excludedTracesEntry1, excludedTracesEntry2, excludedTracesEntry3,
                                                       excludedTracesEntry4, excludedTracesEntry5, excludedTracesEntry6, excludedTracesEntry7,
                                                       excludedTracesEntry8, excludedTracesEntry9, excludedTracesEntry10, excludedTracesEntry11,
                                                       excludedTracesEntry12, excludedTracesEntry13, excludedTracesEntry14, excludedTracesEntry15,
                                                       excludedTracesEntry16, excludedTracesEntry17, excludedTracesEntry18, excludedTracesEntry19,
                                                       excludedTracesEntry20, excludedTracesEntry21, excludedTracesEntry22, excludedTracesEntry23]
                        for (let i = 0; i < labels.length; i++) {
                            labels[i].visible = false
                            drugNameEntries[i].clear()
                            traceNumberEntries[i].clear()
                            excludedTracesEntries[i].clear()
                            drugNameEntries[i].visible = false
                            traceNumberEntries[i].visible = false
                            excludedTracesEntries[i].visible = false
                        }
                    }
                }




                Connections {
                    target: backend
                    // Sets all of the file names and required entries for i in range(len(self.files))
                    function onSetFilenames(files) {
                        internal.clearFiles()
                        const labels = [fileLabel0, fileLabel1, fileLabel2, fileLabel3,
                                        fileLabel4, fileLabel5, fileLabel6, fileLabel7,
                                        fileLabel8, fileLabel9, fileLabel10, fileLabel11,
                                        fileLabel12, fileLabel13,fileLabel14,fileLabel15,
                                        fileLabel16,fileLabel17,fileLabel18,fileLabel19,fileLabel20,
                                        fileLabel21, fileLabel22, fileLabel23]
                        const drugNameEntries = [drugNameEntry0, drugNameEntry1, drugNameEntry2, drugNameEntry3, drugNameEntry4,
                                                 drugNameEntry5, drugNameEntry6, drugNameEntry7, drugNameEntry8, drugNameEntry9,
                                                 drugNameEntry10, drugNameEntry11, drugNameEntry12, drugNameEntry13, drugNameEntry14,
                                                 drugNameEntry15, drugNameEntry16, drugNameEntry17, drugNameEntry18, drugNameEntry19, drugNameEntry20,
                                                 drugNameEntry21, drugNameEntry22, drugNameEntry23]
                        const traceNumberEntries = [traceNumberEntry0, traceNumberEntry1, traceNumberEntry2, traceNumberEntry3, traceNumberEntry4,
                                                    traceNumberEntry5, traceNumberEntry6, traceNumberEntry7, traceNumberEntry8, traceNumberEntry9,
                                                    traceNumberEntry10, traceNumberEntry11, traceNumberEntry12, traceNumberEntry13, traceNumberEntry14,
                                                    traceNumberEntry15, traceNumberEntry16, traceNumberEntry17, traceNumberEntry18, traceNumberEntry19,
                                                    traceNumberEntry20, traceNumberEntry21, traceNumberEntry22, traceNumberEntry23]
                        const excludedTracesEntries = [excludedTracesEntry0, excludedTracesEntry1, excludedTracesEntry2, excludedTracesEntry3,
                                                       excludedTracesEntry4, excludedTracesEntry5, excludedTracesEntry6, excludedTracesEntry7,
                                                       excludedTracesEntry8, excludedTracesEntry9, excludedTracesEntry10, excludedTracesEntry11,
                                                       excludedTracesEntry12, excludedTracesEntry13, excludedTracesEntry14, excludedTracesEntry15,
                                                       excludedTracesEntry16, excludedTracesEntry17, excludedTracesEntry18, excludedTracesEntry19,
                                                       excludedTracesEntry20, excludedTracesEntry21, excludedTracesEntry22, excludedTracesEntry23]
                        for (let i = 0; i < files.length; i++) {
                            labels[i].text = files[i]
                            labels[i].visible = true
                            drugNameEntries[i].visible = true
                            traceNumberEntries[i].visible = true
                            excludedTracesEntries[i].visible = true
                            flickableContentHeight = labels[i].y + 30
                        }
                    }
                    function onGoClearFiles() {
                        internal.clearFiles()
                    }

                    // Grabs all of the entries for the files for i in range(len(self.files))
                    function onGrabEntries(files) {
                        const drugNameEntries = [drugNameEntry0, drugNameEntry1, drugNameEntry2, drugNameEntry3, drugNameEntry4,
                                                 drugNameEntry5, drugNameEntry6, drugNameEntry7, drugNameEntry8, drugNameEntry9,
                                                 drugNameEntry10, drugNameEntry11, drugNameEntry12, drugNameEntry13, drugNameEntry14,
                                                 drugNameEntry15, drugNameEntry16, drugNameEntry17, drugNameEntry18, drugNameEntry19, drugNameEntry20,
                                                 drugNameEntry21, drugNameEntry22, drugNameEntry23]
                        const traceNumberEntries = [traceNumberEntry0, traceNumberEntry1, traceNumberEntry2, traceNumberEntry3, traceNumberEntry4,
                                                    traceNumberEntry5, traceNumberEntry6, traceNumberEntry7, traceNumberEntry8, traceNumberEntry9,
                                                    traceNumberEntry10, traceNumberEntry11, traceNumberEntry12, traceNumberEntry13, traceNumberEntry14,
                                                    traceNumberEntry15, traceNumberEntry16, traceNumberEntry17, traceNumberEntry18, traceNumberEntry19,
                                                    traceNumberEntry20, traceNumberEntry21, traceNumberEntry22, traceNumberEntry23]
                        const excludedTracesEntries = [excludedTracesEntry0, excludedTracesEntry1, excludedTracesEntry2, excludedTracesEntry3,
                                                       excludedTracesEntry4, excludedTracesEntry5, excludedTracesEntry6, excludedTracesEntry7,
                                                       excludedTracesEntry8, excludedTracesEntry9, excludedTracesEntry10, excludedTracesEntry11,
                                                       excludedTracesEntry12, excludedTracesEntry13, excludedTracesEntry14, excludedTracesEntry15, excludedTracesEntry16,
                                                       excludedTracesEntry17, excludedTracesEntry18, excludedTracesEntry19, excludedTracesEntry20, excludedTracesEntry21,
                                                       excludedTracesEntry22, excludedTracesEntry23]
                        const drugNames = []
                        const traceNumbers = []
                        const excludedTraces = []
                        for (let i = 0; i < files.length; i++) {
                            drugNames.push(drugNameEntries[i].text)
                            traceNumbers.push(traceNumberEntries[i].text)
                            //                    .replace(/\s+/g, '')  Strips whitespace
                            excludedTraces.push(excludedTracesEntries[i].text.split(','))
                        }
                        backend.getEntries(drugNames, traceNumbers, excludedTraces)
                    }

                    function onGetRidOfScrollBar(num) {
                        flickableContentHeight = num

                    }

                }




                Label {
                    id: fileLabel12
                    x: 15
                    y: 363
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel13
                    x: 15
                    y: 393
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel14
                    x: 15
                    y: 423
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel15
                    x: 15
                    y: 453
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel16
                    x: 15
                    y: 483
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel17
                    x: 15
                    y: 513
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel18
                    x: 15
                    y: 543
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel19
                    x: 15
                    y: 573
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel20
                    x: 15
                    y: 603
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel21
                    x: 15
                    y: 633
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel22
                    x: 15
                    y: 663
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }




                Label {
                    id: fileLabel23
                    x: 15
                    y: 693
                    width: 120
                    height: 20
                    visible: false
                    color: "#ffffff"
                    text: qsTr("File")
                    clip: true
                }

                TextField {
                    id: drugNameEntry0
                    x: 140
                    y: 5
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry0
                    x: 257
                    y: 5
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry0
                    x: 375
                    y: 5
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry1
                    x: 140
                    y: 33
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry1
                    x: 257
                    y: 33
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry1
                    x: 375
                    y: 33
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry2
                    x: 140
                    y: 63
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry2
                    x: 257
                    y: 63
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry2
                    x: 375
                    y: 63
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: traceNumberEntry3
                    x: 257
                    y: 93
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: drugNameEntry3
                    x: 140
                    y: 93
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry3
                    x: 375
                    y: 93
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry4
                    x: 140
                    y: 123
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry4
                    x: 257
                    y: 123
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry4
                    x: 375
                    y: 123
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry5
                    x: 140
                    y: 153
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry5
                    x: 257
                    y: 153
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry5
                    x: 375
                    y: 153
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry6
                    x: 140
                    y: 183
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry6
                    x: 257
                    y: 183
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry6
                    x: 375
                    y: 183
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry7
                    x: 140
                    y: 213
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry7
                    x: 257
                    y: 213
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry7
                    x: 375
                    y: 213
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: excludedTracesEntry8
                    x: 375
                    y: 243
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: traceNumberEntry8
                    x: 257
                    y: 243
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: drugNameEntry8
                    x: 140
                    y: 243
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: drugNameEntry9
                    x: 140
                    y: 273
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry9
                    x: 257
                    y: 273
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry9
                    x: 375
                    y: 273
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry10
                    x: 140
                    y: 303
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry10
                    x: 257
                    y: 303
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry10
                    x: 375
                    y: 303
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry11
                    x: 140
                    y: 333
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry11
                    x: 257
                    y: 333
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry11
                    x: 375
                    y: 333
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry12
                    x: 140
                    y: 363
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry12
                    x: 257
                    y: 363
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry12
                    x: 375
                    y: 363
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry13
                    x: 140
                    y: 393
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry13
                    x: 257
                    y: 393
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry13
                    x: 375
                    y: 393
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry14
                    x: 140
                    y: 423
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry14
                    x: 257
                    y: 423
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry14
                    x: 375
                    y: 423
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry15
                    x: 140
                    y: 453
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry15
                    x: 257
                    y: 453
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry15
                    x: 375
                    y: 453
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry16
                    x: 140
                    y: 483
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry16
                    x: 257
                    y: 483
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry16
                    x: 375
                    y: 483
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry17
                    x: 140
                    y: 513
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry17
                    x: 257
                    y: 513
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry17
                    x: 375
                    y: 513
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry18
                    x: 140
                    y: 543
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry18
                    x: 257
                    y: 543
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry18
                    x: 375
                    y: 543
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry19
                    x: 140
                    y: 573
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry19
                    x: 257
                    y: 573
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry19
                    x: 375
                    y: 573
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry20
                    x: 140
                    y: 603
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry20
                    x: 257
                    y: 603
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry20
                    x: 375
                    y: 603
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry21
                    x: 140
                    y: 633
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry21
                    x: 257
                    y: 633
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry21
                    x: 375
                    y: 633
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry22
                    x: 140
                    y: 663
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry22
                    x: 257
                    y: 663
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry22
                    x: 375
                    y: 663
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }

                TextField {
                    id: drugNameEntry23
                    x: 140
                    y: 693
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: traceNumberEntry23
                    x: 257
                    y: 693
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("")
                }

                TextField {
                    id: excludedTracesEntry23
                    x: 375
                    y: 693
                    width: 101
                    height: 20
                    visible: false
                    placeholderText: qsTr("Ex: 45, 56, 78")
                }










            }
        }
    }



}




/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}D{i:5}D{i:6}D{i:7}D{i:8}D{i:9}D{i:10}D{i:11}D{i:12}D{i:13}
D{i:14}D{i:15}D{i:16}D{i:17}D{i:18}D{i:19}D{i:20}D{i:21}D{i:22}D{i:23}D{i:24}D{i:25}
D{i:26}D{i:27}D{i:28}D{i:29}D{i:30}D{i:31}D{i:32}D{i:33}D{i:34}D{i:35}D{i:36}D{i:37}
D{i:38}D{i:39}D{i:40}D{i:41}D{i:42}D{i:43}D{i:44}D{i:45}D{i:46}D{i:47}D{i:48}D{i:49}
D{i:50}D{i:51}D{i:52}D{i:53}D{i:54}D{i:55}D{i:56}D{i:57}D{i:58}D{i:59}D{i:60}D{i:61}
D{i:62}D{i:63}D{i:64}D{i:65}D{i:66}D{i:67}D{i:68}D{i:69}D{i:70}D{i:71}D{i:72}D{i:73}
D{i:74}D{i:75}D{i:76}D{i:77}D{i:78}D{i:79}D{i:80}D{i:81}D{i:82}D{i:83}D{i:84}D{i:85}
D{i:86}D{i:87}D{i:88}D{i:89}D{i:90}D{i:91}D{i:92}D{i:93}D{i:94}D{i:95}D{i:96}D{i:97}
D{i:98}D{i:99}D{i:100}D{i:101}D{i:102}D{i:4}D{i:2}D{i:1}
}
##^##*/
