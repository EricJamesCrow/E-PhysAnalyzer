function expandDialogBox() {
    if(dialogBox.opacity === 0) {
        dialogBox.visible = true
        dialogBoxOpacityOn.running = true
    } else if(dialogBox.opacity === 1.0) {
        dialogBoxOpacityOff.running = true
    }
}

function newRegion(greaterThan, lessThan) {
    var newObject = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; Region {id: region; y:0; width: 200; height: 19; anchors.horizontalCenter: parent.horizontalCenter; opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration:150; running: true}}`,
    regionsLoader,
    "dynamicRegion");
    newObject.y += regionAxis
    newObject.greaterThanEqualToText = greaterThan
    newObject.lessThanText = lessThan
    regionObjects.push(newObject)
    regionAxis += 22
}

function clearRegions() {
    for(let i=0; i<regionObjects.length; i++) {
            regionObjects[i].destroy()
    }
    regionObjects = []
    regionAxis = 5
}