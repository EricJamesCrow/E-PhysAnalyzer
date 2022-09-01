function create_objects(selectedFiles) {
    reset()
    files = selectedFiles; 
    returnBasename(selectedFiles); 
    backend.create_objects(filesBasename)
}

function create(selectedFile) {
    var newObject = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls/custom"; InputFields {id: inputField; y:0; x:-500; width: 837; opacity: 0; PropertyAnimation {target: inputField; property: "x"; to: 5; duration: 150; running: true} OpacityAnimator on opacity {from: 0; to: 1.0; duration:150; running: true}}`,
    leftContentLoader,
    "dynamicInputField");                              
    newObject.file = selectedFile
    newObject.y += objectHeight 
    fileObjects.push(newObject)
    objectHeight += 40
}

var splitTest = function (str) {
    return str.split('\\').pop().split('/').pop();
}

function returnBasename(selectedFiles) {
    for (let i=0; i < selectedFiles.length; i++) {
        filesBasename.push(splitTest(selectedFiles[i].toString()))
    }
}

function destroy_objects() {
    for (let i=0; i<fileObjects.length; i++) {
        fileObjects[i].destroy()
    }
}

function reset() {
    try {
        destroy_objects()
    } catch(err) {
    }
    files = []
    fileObjects = []
    filesBasename = []
    objectHeight = 20
}
