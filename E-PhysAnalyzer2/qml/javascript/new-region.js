function expandDialogBox() {
    if(dialogBox.opacity === 0) {
        dialogBox.visible = true
        dialogBoxOpacityOn.running = true
    } else if(dialogBox.opacity === 1.0) {
        dialogBoxOpacityOff.running = true
    }
}

function regionErrorMsg(msg) {
    var newObject = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; RegionErrorMsg {id: errorMessage; 
        x: 30;
        y: 51;
        width: 168;
        height: 36;
        opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration: 150; running: true} PropertyAnimation {target: errorMessage; property: "y"; to: 28; duration: 150; running: true}}`,
        dialogBox,
    "regionErrorMsg");
    newObject.errorMessageString = msg
    errorMessage = newObject
    backend.destroy_new_region_error_msg()
}

function destroyErrorMsg() {
    errorMessage.destroy()
}


function createNewRegion(greaterThan, lessThan) {
    try {
        if(greaterThan !== "" && lessThan !== "" && parseInt(greaterThan) >= parseInt(regionObjects.slice(-1)[0].lessThanText)) {
            if(parseInt(greaterThan) > parseInt(lessThan)) {
                newRegion(greaterThan, lessThan)
            } else {
                emitRegionErrorMessage("Conflict with region values.")
            }
        } else {
            if(greaterThan === "" && lessThan === "") {
                emitRegionErrorMessage("Please enter your values.")
            } else {
                emitRegionErrorMessage("Conflict with region values.")
            }
        }
    } catch(err) {
        if(greaterThan !== "" && lessThan !== "") {
            newRegion(greaterThan, lessThan)
        } else {
            emitRegionErrorMessage("Please enter your values.")
        }
    }
}

function newRegion(greaterThan, lessThan) {
    var newObject = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; Region {id: region; y:0; width: 200; height: 19; anchors.horizontalCenter: parent.horizontalCenter; opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration:150; running: true}}`,
    regionsLoader,
    "dynamicRegion");
    newObject.y += regionAxis
    newObject.greaterThanEqualToText = greaterThan
    newObject.lessThanText = lessThan
    newObject.regionNumber = regionObjects.length
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

function deleteRegion(regionNumber) {
    regionAxis -= 22
    regionObjects[regionNumber].destroy() // Removes/destroys region
    regionObjects.splice(regionNumber, 1) // Removes destroyed object from the list
    regionObjectsSlice = regionObjects.slice(regionNumber) // Get all of the objects after the destroyed object
    for(let i=0; i<regionObjectsSlice.length; i++) {
        regionObjectsSlice[i].regionNumber -= 1 // Subtract one from regionNumber; necessary for finding the correct index when deleteRegion() is called
    }
    moveRegionsUp(regionObjectsSlice)
}

function moveRegionsUp(regionObjectsSlice) {
        for(let i=0; i<regionObjectsSlice.length; i++) {
            currentRegionObject = regionObjectsSlice[i]
            currentRegionY = regionObjectsSlice[i].y - 22
        Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; PropertyAnimation {target: currentRegionObject; property: "y"; to: currentRegionY; duration: 250; running: true}`,
        regionObjectsSlice[i],
            "propertyAnimation");
        }
}