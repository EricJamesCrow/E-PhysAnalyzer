const expandDialogBox = () => {
    // Expands dialog boxes for NewRegion.qml and GeneratePattern.qml
    if(dialogBox.opacity === 0) {
        dialogBox.visible = true
        dialogBoxOpacityOn.running = true
    } else if(dialogBox.opacity === 1.0) {
        dialogBoxOpacityOff.running = true
    }
}

var generatePattern = (everyMinute, startTime, endTime) => {
    gPclearRegions()
    if((parseInt(endTime) - parseInt(startTime)) / Math.abs(parseInt(everyMinute)) > 20) {
        return regionErrorMsg("Can only create 20 regions.", "generate")
    } else if((parseInt(endTime) - parseInt(startTime)) / Math.abs(parseInt(everyMinute)) <= 0) {
        return regionErrorMsg("Please fix values.", "generate")
    } else if(endTime === "" || startTime == "" || everyMinute == "") {
        return regionErrorMsg("Empty values.", "generate")
    }
    submitButton.enabled = false
    backend.run_generate_pattern(Math.abs(parseInt(everyMinute)), parseInt(startTime), parseInt(endTime))
}

var regionErrorMsg = (msg, string) => {
    errorMessage = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; RegionErrorMsg {id: errorMessage; 
        x: 16 * scaleFactor;
        y: 51 * scaleFactor;
        width: 148 * scaleFactor;
        height: 36 * scaleFactor;
        opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration: 150; running: true} PropertyAnimation {target: errorMessage; property: "y"; to: 28 * scaleFactor; duration: 150; running: true}}`,
        dialogBox,
    "regionErrorMsg");
    errorMessage.errorMessageString = msg
    submitButton.enabled = false // Disable dialog submit button while error message is visible
    backend.destroy_error_msg(string) // Need to call a Python thread so the message is destroyed after 1 second
}

var colorPickerErrorMsg = (msg, string) => {
    errorMessage = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; RegionErrorMsg {id: errorMessage; 
        x: 5 * scaleFactor;
        y: 51 * scaleFactor;
        width: 110 * scaleFactor;
        height: 36 * scaleFactor;
        opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration: 150; running: true} PropertyAnimation {target: errorMessage; property: "y"; to: 28 * scaleFactor; duration: 150; running: true}}`,
        dialogBox,
    "regionErrorMsg");
    errorMessage.errorMessageString = msg
    customColorEntry.enabled = false // Disable dialog submit button while error message is visible
    backend.destroy_error_msg(string) // Need to call a Python thread so the message is destroyed after 1 second
}

const destroyErrorMsg = () => {
    errorMessage.destroy()
    submitButton.enabled = true // Re-enable submit button
}

// Checks to see whether the region should go first, inbetween other regions, or last
var checkRegions = (greaterThan, lessThan) => {
    // No other objects created yet
    if(regionObjects.length === 0) { 
        return "Initial"
    }
    
    // Checks if all of the integer values in the regionObject's array are greater than the newObject's lessThan
    const checkEvery = (arr = [], limit = 1) => {
        const allGreater = arr.every(el => { 
        return el >= limit;
        }); 
        return allGreater;
    };
    var arrayOfNumbers = []
    for(let y=0; y<regionObjects.length; y++) {
        arrayOfNumbers.push(parseInt(regionObjects[y].greaterThanEqualToText))
        arrayOfNumbers.push(parseInt(regionObjects[y].lessThanText))
    }
    if(checkEvery(arrayOfNumbers, parseInt(lessThan))) { 
        return "First" 
    }
    
    // Nested for loop finds if the object meet's the criteria for the moveObjectInbetween() function
    for(let i=0; i<regionObjects.length; i++) { 
        for(let x=0+i; x<regionObjects.length; x++) {
            if(parseInt(greaterThan) >= parseInt(regionObjects[i].lessThanText) && parseInt(lessThan) <= parseInt(regionObjects[x].greaterThanEqualToText) && regionObjects[x].regionNumber - regionObjects[i].regionNumber === 1) {
                return regionObjects[x].regionNumber
            }
        }
    }

    // Checks if the newObject should be placed last; else return an error message in NewRegion.qml's dialog box
    if(parseInt(greaterThan) >= parseInt(regionObjects.slice(-1)[0].lessThanText)) {
        return "Last" 
    } else {
        return "Error" 
    }
}

var createNewRegion = (greaterThan, lessThan) => {
    // Checks if input fields are correct.
    if(greaterThan === "" || lessThan === "") {
        return emitRegionErrorMessage("Please enter your values.", "region")
    } else if(parseInt(greaterThan) >= parseInt(lessThan)) {
        return emitRegionErrorMessage("Please fix your values.", "region")
    } else if(regionObjects.length >= 20)     {
        return emitRegionErrorMessage("Too many regions.", "region")
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
        return emitRegionErrorMessage("Conflict with region values.", "region")
    } else { // Moves an object inbetween values and re-orders the array
        return moveObjectsInbetween(checkRegionsVariable, greaterThan, lessThan)
    }
}

var moveObjectsFirst = (greaterThan, lessThan) => {
    const currentRegionAxis = regionAxis // store the current region axis in a variable
    regionAxis = 5 * scaleFactor // set back to inital value
    objectsToMove = regionObjects // put objects to be moved into a temporary variable
    regionObjects = [] // make list empty so newRegion() pushes the new object into index 0
    moveAndNew(greaterThan, lessThan, objectsToMove)
    regionAxis = currentRegionAxis + 22 * scaleFactor
}

var moveObjectsInbetween = (regionNumber, greaterThan, lessThan) => {
    const currentRegionAxis = regionAxis // store the current region axis in a variable
    regionAxis = regionObjects[regionNumber].y * scaleFactor// set region axis to the regionObject that is going to be moved down
    objectsToMove = regionObjects.slice(regionNumber) // put objects to be moved into a temporary variable
    regionObjects = regionObjects.slice(0, regionNumber) // set regionObjects to all the objects that are not being animated
    moveAndNew(greaterThan, lessThan, objectsToMove)
    regionAxis = currentRegionAxis + 22 * scaleFactor
}

var moveAndNew = (greaterThan, lessThan, otm) => {
    newRegion(greaterThan, lessThan) // create
    moveRegions(otm, "add") // move
    for(let i=0; i<otm.length; i++) {
        regionObjects.push(otm[i]) // push objects from the temporary array back into regionObjects
    } // Everything is now in order
}

var newRegion = (greaterThan, lessThan) => {
    var newObject = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; Region {id: region; y:0; width: 200 * scaleFactor; height: 19 * scaleFactor; anchors.horizontalCenter: parent.horizontalCenter; opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration:150; running: true}}`,
    regionsLoader,
    "dynamicRegion");
    newObject.y += regionAxis
    newObject.greaterThanEqualToText = greaterThan
    newObject.lessThanText = lessThan
    newObject.regionNumber = regionObjects.length
    newObject.chosenRegionColor = chosenRegionColor
    newObject.colorName = getKeyByValue(colorDict, chosenRegionColor.toString().toUpperCase())
    regionObjects.push(newObject)
    regionAxis += 22 * scaleFactor
    for(let i=0; i<regionObjects.length; i++) {
        regionObjects[i].z += 1
    }
}

var getKeyByValue = (object, value) => {
    return Object.keys(object).find(key => object[key] === value);
  }

const clearRegions = () => {
    for(let i=0; i<regionObjects.length; i++) {
            regionObjects[i].destroy()
    }
    regionObjects = []
    regionAxis = 5 * scaleFactor
}


// Delete a region
var deleteRegion = regionNumber => {
    regionAxis -= 22 * scaleFactor
    regionObjects[regionNumber].destroy() // Removes/destroys region
    regionObjects.splice(regionNumber, 1) // Removes destroyed object from the list
    regionObjectsSlice = regionObjects.slice(regionNumber) // Get all of the objects after the destroyed object
    moveRegions(regionObjectsSlice, "subtract")
}

var moveRegions = (regionObjectsSlice, operator) => {
        for(let i=0; i<regionObjectsSlice.length; i++) {
            currentRegionObject = regionObjectsSlice[i] // Have to assign current object to a variable held in QML in order for the PropertyAnimation to work
            if(operator === "subtract") {
                currentRegionY = regionObjectsSlice[i].y - 22  * scaleFactor
                regionObjectsSlice[i].regionNumber -= 1 // Subtract one from regionNumber; necessary for finding the correct index when deleteRegion() is called
            } else if (operator === "add") {
                currentRegionY = regionObjectsSlice[i].y + 22 * scaleFactor
                regionObjectsSlice[i].regionNumber += 1
            }
        Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; PropertyAnimation {target: currentRegionObject; property: "y"; to: currentRegionY; duration: 150; running: true}`,
        regionObjectsSlice[i],
            "propertyAnimation");
        }
}

// Need to figure out how to import this from color-picker.js
const colorDict = {
    "black": "#000000",
    "dimgrey": "#696969",
    "dimgray": "#696969",
    "grey": "#808080",
    "gray": "#808080",
    "darkgrey": "#A9A9A9",
    "darkgray": "#A9A9A9",
    "silver": "#C0C0C0",
    "lightgrey": "#D3D3D3",
    "lightgray": "#D3D3D3",
    "gainsboro": "#DCDCDC",
    "whitesmoke": "#F5F5F5",
    "white": "#FFFFFF",
    "snow": "#FFFAFA",
    "rosybrown": "#BC8F8F",
    "lightcoral": "#F08080",
    "indianred": "#CD5C5C",
    "brown": "#A52A2A",
    "firebrick": "#B22222",
    "maroon": "#800000",
    "darkred": "#8B0000",
    "red": "#FF0000",
    "mistyrose": "#FFE4E1",
    "salmon": "#FA8072",
    "tomato": "#FF6347",
    "darksalmon": "#E9967A",
    "coral": "#FF7F50",
    "orangered": "#FF4500",
    "lightsalmon": "#FFA07A",
    "sienna": "#A0522D",
    "seashell": "#FFF5EE",
    "chocolate": "#D2691E",
    "saddlebrown": "#8B4513",
    "sandybrown": "#FAA460",
    "peachpuff": "#FFDAB9",
    "peru": "#CD853F",
    "linen": "#FAF0E6",
    "bisque": "#FFE4C4",
    "darkorange": "#FF8C00",
    "burlywood": "#DEB887",
    "antiquewhite": "#FAEBD7",
    "tan": "#D2B48C",
    "navajowhite": "#FFDEAD",
    "blanchedalmond": "#FFEBCD",
    "papayawhip": "#FFEFD5",
    "moccasin": "#FFE4B5",
    "orange": "#FFE4B5",
    "wheat": "#F5DEB3",
    "oldlace": "#FDF5E6",
    "floralwhite": "#FFFAF0",
    "darkgoldenrod": "#B8860B",
    "goldenrod": "#DAA520",
    "cornsilk": "#FFF8DC",
    "gold": "#FFD700",
    "lemonchiffon": "#FFFACD",
    "khaki": "#F0E68C",
    "palegoldenrod": "#EEE8AA",
    "darkkhaki": "#BDB76B",
    "ivory": "#FFFFF0",
    "beige": "#F5F5DC",
    "lightyellow": "#FFFFE0",
    "lightgoldenrodyellow": "#FAFAD2",
    "olive": "#808000",
    "yellow": "#FFFF00",
    "olivedrab": "#6B8E23",
    "yellowgreen": "#9ACD32",
    "darkolivegreen": "#556B2F",
    "greenyellow": "#ADFF2F",
    "chartresuse": "#7FFF00",
    "lawngreen": "#7CFC00",
    "sage": "#87AE73",
    "lightsage": "#BCECAC",
    "darksage": "#598556",
    "honeydew": "#F0FFF0",
    "darkseagreen": "#8FBC8F",
    "palegreen": "#98FB98",
    "lightgreen": "#90EE90",
    "forestgreen": "#228B22",
    "limegreen": "#32CD32",
    "darkgreen": "#006400",
    "green": "#008000",
    "lime": "#00FF00",
    "seagreen": "#2E8B57",
    "mediumseagreen": "#3CB371",
    "springgreen": "#00FF7F",
    "mintcream": "#F5FFFA",
    "mediumspringreen": "#00FA9A",
    "mediumaquagreen": "#66CDAA",
    "aquamarine": "#7FFFD4",
    "turquoise": "#40E0D0",
    "lightseagreen": "#20B2AA",
    "mediumturquoise": "#48D1CC",
    "azure": "#F0FFFF",
    "lightcyan": "#E0FFFF",
    "paleturquoise": "#AFEEEE",
    "darkslategray": "#2F4F4F",
    "darkslategrey": "#2F4F4F",
    "teal": "#008080",
    "darkcyan": "#008B8B",
    "cyan": "#00FFFF",
    "aqua": "#00FFFF",
    "darkturquoise": "#00CED1",
    "cadetblue": "#5F9EA0",
    "powderblue": "#B0E0E6",
    "lightblue": "#ADD8E6",
    "deepskyblue": "#00BFFF",
    "skyblue": "#87CEEB",
    "lightskyblue": "#87CEFA",
    "steelblue": "#4682B4",
    "aliceblue": "#F0F8FF",
    "dodgerblue": "#1E90FF",
    "lightslategrey": "#778899",
    "lightslategray": "#778899",
    "slategray": "#708090",
    "slategrey": "#708090",
    "lightsteelblue": "#B0C4DE",
    "cornflowerblue": "#6495ED",
    "royalblue": "#4169E1",
    "ghostwhite": "#F8F8FF",
    "lavender": "#E6E6FA",
    "midnightblue": "#191970",
    "navy": "#000080",
    "darkblue": "#00008B",
    "mediumblue": "#0000CD",
    "blue": "#0000FF",
    "slateblue": "#6A5ACD",
    "darkslateblue": "#483D8B",
    "mediumslateblue": "#7B68EE",
    "mediumpurple": "#9370DB",
    "blueviolet": "#8A2BE2",
    "indigo": "#4B0082",
    "darkorchid": "#9932CC",
    "darkviolet": "#9400D3",
    "mediumorchid": "#BA55D3",
    "thistle": "#D8BFD8",
    "plum": "#DDA0DD",
    "violet": "#EE82EE",
    "purple": "#800080",
    "darkmagenta": "#8B008B",
    "fuchsia": "#FF00FF",
    "magenta": "#FF00FF",
    "orchid": "#DA70D6",
    "mediumvioletred": "#C71585",
    "deeppink": "#FF1493",
    "hotpink": "#FF69B4",
    "lavenderblush": "#FFF0F5",
    "palevioletred": "#DB7093",
    "crimson": "#DC143C",
    "pink": "#FFC0CB",
    "lightpink": "#FFB6C1",
    "deeppink": "#FF1493",
    "k": "#000000",
    "w": "#FFFFFF",
    "r": "#FF0000",
    "y": "#BFBF00",
    "g": "#008000",
    "c": "#00BFBF",
    "b": "#0000FF",
    "m": "#BF00BF"
}