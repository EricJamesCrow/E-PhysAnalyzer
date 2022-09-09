function serialize() {
    for(let i=0; i<regionObjects.length; i++){
        var serializedObject = {"Index": regionObjects[i].regionNumber, "Position": [regionObjects[i].y, regionObjects[i].z], "Values": [regionObjects[i].greaterThanEqualToText, regionObjects[i].lessThanText], "Colors": [regionObjects[i].chosenRegionColor.toString(), regionObjects[i].colorName.toString()]}
        serializedObjects.push(JSON.stringify(serializedObject))
    }
}

function deserialize(settingsObject) {
    for (let i=0; i<settingsObject.length; i++) { 
        var jsonObject = JSON.parse(settingsObject[i]) // Convert back to a JSON object
        var newObject = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; Region {id: region; y:0; width: 200; height: 19; anchors.horizontalCenter: parent.horizontalCenter; opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration:150; running: true}}`,
        regionsLoader,
        "dynamicRegion");
        regionObjects.push(newObject);
        regionObjects.slice(-1)[0].regionNumber = jsonObject["Index"]
        regionObjects.slice(-1)[0].y = jsonObject["Position"][0]
        regionObjects.slice(-1)[0].z = jsonObject["Position"][1]
        regionObjects.slice(-1)[0].greaterThanEqualToText = jsonObject["Values"][0]
        regionObjects.slice(-1)[0].lessThanText = jsonObject["Values"][1] 
        regionObjects.slice(-1)[0].chosenRegionColor = jsonObject["Colors"][0].toString()
        regionObjects.slice(-1)[0].colorName = jsonObject["Colors"][1].toString()
        regionAxis += 22
            }
        settingsObject = []
}



function animate(object) {
    var objects = {
        0: generatePatternOpacity, 1: newRegionOpacity, 2: regionsOpacity, 3: postAnalysisOpacity, 
        4: colorCodeOpacity, 5: minuteAveragedOpacity, 6: baselineOpacity, 7: zScoreOpacity, 8: resetBtnOpacity
    }
    objects[object].running = true
}

function nextPage() {
    if(rightContentLoader.source.toString() === graphSettingsPage[0]){
        rightContentLoader.source = graphSettingsPage[1]
        leftArrow.checkedState = true
        pageSelected = 2
    } else if(rightContentLoader.source.toString() === graphSettingsPage[1]) {
        rightContentLoader.source = graphSettingsPage[2]
        rightArrow.checkedState = false
        pageSelected = 3
    }
}

function prevPage() {
    if(rightContentLoader.source.toString() === graphSettingsPage[1]) {
        rightContentLoader.source = graphSettingsPage[0]
        leftArrow.checkedState = false  
        pageSelected = 1                     
    } else if(rightContentLoader.source.toString() === graphSettingsPage[2]) {
        rightContentLoader.source = graphSettingsPage[1]
        rightArrow.checkedState = true
        pageSelected = 2
    }
}
