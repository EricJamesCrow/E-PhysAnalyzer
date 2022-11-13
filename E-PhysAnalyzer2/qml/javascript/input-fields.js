var create_objects = selectedFiles => {
    reset()
    files = selectedFiles; 
    returnBasename(selectedFiles); 
    backend.create_objects(filesBasename)
}

var create = selectedFile => {
    let newObject = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls/custom"; InputFields {id: inputField; y:0; x:-500; width: 837 * scaleFactor; opacity: 0; PropertyAnimation {target: inputField; property: "x"; to: 5*scaleFactor; duration: 150; running: true} OpacityAnimator on opacity {from: 0; to: 1.0; duration:150; running: true}}`,
    leftContentLoader,
    "dynamicInputField");                              
    newObject.file = selectedFile
    newObject.y = objectHeight // When scaling is activated, execute a for loop through fileObjects that multiplies every "y" value by scaleFactor
    fileObjects.push(newObject)
    objectHeight += 40 * scaleFactor
    if(fileObjects.length > 17) {
        flickableContentHeight += 40 * scaleFactor
    }
}

const repeatDrugNames = () => {
    for(let i=0; i<fileObjects.length; i++) {
        fileObjects[i].drugName = drugName
    }
}

var splitTest = function (str) {
    return str.split('\\').pop().split('/').pop();
}

var returnBasename = selectedFiles => {
    for (let i=0; i < selectedFiles.length; i++) {
        filesBasename.push(splitTest(selectedFiles[i].toString()))
    }
}

const destroy_objects = () => {
    for (let i=0; i<fileObjects.length; i++) {
        fileObjects[i].destroy()
    }
}

const reset = () => {
    try {
        destroy_objects()
    } catch(err) {
    }
    files = []
    fileObjects = []
    filesBasename = []
    objectHeight = 10 * scaleFactor
    flickableContentHeight = 696 * scaleFactor
}
