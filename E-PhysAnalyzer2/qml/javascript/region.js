function expandDialogBox() {
    // Expands dialog boxes for NewRegion.qml and GeneratePattern.qml
    if(dialogBox.opacity === 0) {
        dialogBox.visible = true
        dialogBoxOpacityOn.running = true
    } else if(dialogBox.opacity === 1.0) {
        dialogBoxOpacityOff.running = true
    }
}

function regionErrorMsg(msg) {
    errorMessage = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; RegionErrorMsg {id: errorMessage; 
        x: 30;
        y: 51;
        width: 168;
        height: 36;
        opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration: 150; running: true} PropertyAnimation {target: errorMessage; property: "y"; to: 28; duration: 150; running: true}}`,
        dialogBox,
    "regionErrorMsg");
    errorMessage.errorMessageString = msg
    backend.destroy_new_region_error_msg() // Need to call a Python thread so the message is destroyed after 1 second
}

function destroyErrorMsg() {
    errorMessage.destroy()
}

// Checks to see whether the region should go first, inbetween other regions, or last
function checkRegions(greaterThan, lessThan) {
    if(regionObjects.length === 0) { // No other objects created
        return "Initial"
    }
    const checkEvery = (arr = [], limit = 1) => {
        const allGreater = arr.every(el => { 
        return el >= limit;
        }); // Checks if all of the integer values in the array are greater than the given value
        return allGreater;
    };
    var arrayOfNumbers = []
    for(let y=0; y<regionObjects.length; y++) {
        arrayOfNumbers.push(parseInt(regionObjects[y].greaterThanEqualToText))
        arrayOfNumbers.push(parseInt(regionObjects[y].lessThanText))
    }
    if(checkEvery(arrayOfNumbers, parseInt(lessThan))) { 
        return "First" // Checks if all of the integer values in the regionObject's array are greater than the newObject's lessThan
    } else {
        for(let i=0; i<regionObjects.length; i++) { // Nested for loop finds if the object meet's the criteria for the moveObjectInbetween() function
            for(let x=0+i; x<regionObjects.length; x++) {
                if(parseInt(greaterThan) >= parseInt(regionObjects[i].lessThanText) && parseInt(lessThan) <= parseInt(regionObjects[x].greaterThanEqualToText) && regionObjects[x].regionNumber - regionObjects[i].regionNumber === 1) {
                    return regionObjects[x].regionNumber
                }
            }
        }
    }
    if(parseInt(greaterThan) >= parseInt(regionObjects.slice(-1)[0].lessThanText)) {
        return "Last" // Checks if the newObject should be placed last
    } else {
        return "Error" // Returns an error message in NewRegion.qml's dialog box
    }
}

function createNewRegion(greaterThan, lessThan) {
    // Checks if input fields are correct.
    if(greaterThan === "" || lessThan === "") {
        return emitRegionErrorMessage("Please enter your values.")
    } else if(parseInt(greaterThan) >= parseInt(lessThan)) {
        return emitRegionErrorMessage("Please fix your values.")
    }    
    // Checks to see whether or not the regions need to be moved.
    const checkRegionsVariable = checkRegions(greaterThan, lessThan) // Hold checkRegion's result in a variable
    if(checkRegionsVariable === "Initial") { // Runs if no other objects have been created
        return newRegion(greaterThan, lessThan)
    }
    else if(checkRegionsVariable === "First") { // Object needs to go before all others, re-orders the array
        return moveObjectsFirst(greaterThan, lessThan)
    } else if(checkRegionsVariable === "Last") { // Adds object normally
        return newRegion(greaterThan, lessThan)
    } else if(checkRegionsVariable === "Error") { // Returns an error message in NewRegion.qml's dialog box
        return emitRegionErrorMessage("Conflict with region values.")
    } else { // Moves an object inbetween values and re-orders the array
        return moveObjectsInbetween(checkRegionsVariable, greaterThan, lessThan)
    }
}

function moveObjectsFirst(greaterThan, lessThan) {
    const currentRegionAxis = regionAxis // store the current region axis in a variable
    regionAxis = 5 // set back to inital value
    objectsToMove = regionObjects // put objects to be moved into a temporary variable
    regionObjects = [] // make list empty so newRegion() pushes the new object into index 0
    moveAndNew(greaterThan, lessThan, objectsToMove)
    regionAxis = currentRegionAxis + 22
}

function moveObjectsInbetween(regionNumber, greaterThan, lessThan) {
    const currentRegionAxis = regionAxis // store the current region axis in a variable
    regionAxis = regionObjects[regionNumber].y // set region axis to the regionObject that is going to be moved down
    objectsToMove = regionObjects.slice(regionNumber) // put objects to be moved into a temporary variable
    regionObjects = regionObjects.slice(0, regionNumber) // set regionObjects to all the objects that are not being animated
    moveAndNew(greaterThan, lessThan, objectsToMove)
    regionAxis = currentRegionAxis + 22
}

function moveAndNew(greaterThan, lessThan, otm) {
    newRegion(greaterThan, lessThan) // create
    moveRegions(otm, "add") // move
    for(let i=0; i<otm.length; i++) {
        regionObjects.push(otm[i]) // push objects from the temporary array back into regionObjects
    } // Everything is now in order
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


// Delete a region
function deleteRegion(regionNumber) {
    regionAxis -= 22
    regionObjects[regionNumber].destroy() // Removes/destroys region
    regionObjects.splice(regionNumber, 1) // Removes destroyed object from the list
    regionObjectsSlice = regionObjects.slice(regionNumber) // Get all of the objects after the destroyed object
    moveRegions(regionObjectsSlice, "subtract")
}

function moveRegions(regionObjectsSlice, operator) {
        for(let i=0; i<regionObjectsSlice.length; i++) {
            currentRegionObject = regionObjectsSlice[i] // Have to assign current object to a variable held in QML in order for the PropertyAnimation to work
            if(operator === "subtract") {
                currentRegionY = regionObjectsSlice[i].y - 22 
                regionObjectsSlice[i].regionNumber -= 1 // Subtract one from regionNumber; necessary for finding the correct index when deleteRegion() is called
            } else if (operator === "add") {
                currentRegionY = regionObjectsSlice[i].y + 22
                regionObjectsSlice[i].regionNumber += 1
            }
        Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; PropertyAnimation {target: currentRegionObject; property: "y"; to: currentRegionY; duration: 150; running: true}`,
        regionObjectsSlice[i],
            "propertyAnimation");
        }
}