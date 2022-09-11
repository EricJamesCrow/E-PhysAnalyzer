class Settings {
    constructor(objects, axis, xmin, xmax, ymin, ymax, maxmin, maxmax, maymin, maymax, single, quality, dpi, defaultColor, color, time, display, remove, score){
        this.objects = objects;
        this.axis = axis;
        this.xmin = xmin;
        this.xmax = xmax;
        this.ymin = ymin;
        this.ymax = ymax;
        this.maxmin = maxmin;
        this.maxmax = maxmax;
        this.maymin = maymin;
        this.maymax = maymax;
        this.single = single;
        this.quality = quality;
        this.dpi = dpi;
        this.defaultColor = defaultColor;
        this.color = color;
        this.time = time;
        this.display = display;
        this.remove = remove;
        this.score = score;
    }
    deserialization(){
        runDeserialization(this.objects, this.axis);
        return this
    }
    setSettings(){
        postAnalysisSettings(this.xmin,this.xmax,this.ymin,this.ymax);
        minuteAveragedSettings(this.maxmin,this.maxmax,this.maymin,this.maymax);
        graphQualitySettings(this.single, this.quality, this.dpi, this.defaultColor);
        baselineSettings(this.color, this.time, this.display);
        return this
    }
    load(){
        backend.run_starting_animation();
    }
}

function startDeserialization(objects, axis, xmin, xmax, ymin, ymax, maxmin, maxmax, maymin, maymax, single, quality, dpi, defaultColor, color, time, display, remove, score) {
    var settings = new Settings(objects, axis, xmin, xmax, ymin, ymax, maxmin, maxmax, maymin, maymax, single, quality, dpi, defaultColor, color, time, display, remove, score);
    return settings.deserialization().setSettings().load()
}

function serialize() {
    for(let i=0; i<regionObjects.length; i++){
        var serializedObject = {"Index": regionObjects[i].regionNumber, "Position": [regionObjects[i].y, regionObjects[i].z], "Values": [regionObjects[i].greaterThanEqualToText, regionObjects[i].lessThanText], "Colors": [regionObjects[i].chosenRegionColor.toString(), regionObjects[i].colorName.toString()]}
        serializedObjects.push(JSON.stringify(serializedObject))
    }
}

function deserialize(settingsObject) {
    for (let i=0; i<settingsObject.length; i++) { 
        var jsonObject = JSON.parse(settingsObject[i]) // Convert back to a JSON object
        var newObject = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; Region {id: region; y:0; width: 200 * scaleFactor; height: 19 * scaleFactor; anchors.horizontalCenter: parent.horizontalCenter; opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration:150; running: true}}`,
        regionsLoader,
        "dynamicRegion");
        regionObjects.push(newObject);
        regionObjects.slice(-1)[0].regionNumber = jsonObject["Index"]
        regionObjects.slice(-1)[0].y = jsonObject["Position"][0]
        regionObjects.slice(-1)[0].y = regionObjects.slice(-1)[0].y * scaleFactor
        regionObjects.slice(-1)[0].z = jsonObject["Position"][1]
        regionObjects.slice(-1)[0].greaterThanEqualToText = jsonObject["Values"][0]
        regionObjects.slice(-1)[0].lessThanText = jsonObject["Values"][1] 
        regionObjects.slice(-1)[0].chosenRegionColor = jsonObject["Colors"][0].toString()
        regionObjects.slice(-1)[0].colorName = jsonObject["Colors"][1].toString()
        regionAxis += 22 * scaleFactor
            }
    settingsObject = []
    backend.adjust_region_height()
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
