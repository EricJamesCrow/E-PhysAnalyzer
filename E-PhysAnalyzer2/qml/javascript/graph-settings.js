function startDeserialization(graphSettings, postAnalysis, minuteAveraged, graphQuality, baseline, zscore) {
    runDeserialization(graphSettings.objects1, graphSettings.regionAxis1);
    setSettings1(postAnalysis, minuteAveraged, graphQuality, baseline, zscore)
    backend.run_starting_animation()
}

function startDeserialization2(graphSettings, postAnalysis, minuteAveraged, graphQuality, baseline, zscore) {
    runDeserialization(graphSettings.objects2, graphSettings.regionAxis2);
    setSettings2(postAnalysis, minuteAveraged, graphQuality, baseline, zscore)
    backend.run_starting_animation()
}

function startDeserialization3(graphSettings, postAnalysis, minuteAveraged, graphQuality, baseline, zscore) {
    runDeserialization3(graphSettings.objects3, graphSettings.regionAxis3);
    setSettings3(postAnalysis, minuteAveraged, graphQuality, baseline, zscore)
    backend.run_starting_animation()
}

// NEED TO REWRITE THESE AS ONE FUNCTION !!!!!
function setSettings1(postAnalysis, minuteAveraged, graphQuality, baseline, zscore) {
    postAnalysisSettings(postAnalysis.xmin,postAnalysis.xmax,postAnalysis.ymin,postAnalysis.ymax);
    minuteAveragedSettings(minuteAveraged.maxmin,minuteAveraged.maxmax,minuteAveraged.maymin,minuteAveraged.maymax);
    graphQualitySettings(graphQuality.single, graphQuality.quality, graphQuality.dpi, graphQuality.defaultColor);
    baselineSettings(baseline.color, baseline.time, baseline.display);
    zscoreSettings(zscore.remove, zscore.score);
}

function setSettings2(postAnalysis, minuteAveraged, graphQuality, baseline, zscore) {
    postAnalysisSettings(postAnalysis.xmin2,postAnalysis.xmax2,postAnalysis.ymin2,postAnalysis.ymax2);
    minuteAveragedSettings(minuteAveraged.maxmin2,minuteAveraged.maxmax2,minuteAveraged.maymin2,minuteAveraged.maymax2);
    graphQualitySettings(graphQuality.single2, graphQuality.quality2, graphQuality.dpi2, graphQuality.defaultColor2);
    baselineSettings(baseline.color2, baseline.time2, baseline.display2);
    zscoreSettings(zscore.remove2, zscore.score2);
}

function setSettings3(postAnalysis, minuteAveraged, graphQuality, baseline, zscore) {
    postAnalysisSettings(postAnalysis.xmin3,postAnalysis.xmax3,postAnalysis.ymin3,postAnalysis.ymax3);
    minuteAveragedSettings(minuteAveraged.maxmin3,minuteAveraged.maxmax3,minuteAveraged.maymin3,minuteAveraged.maymax3);
    graphQualitySettings(graphQuality.single3, graphQuality.quality3, graphQuality.dpi3, graphQuality.defaultColor3);
    baselineSettings(baseline.color3, baseline.time3, baseline.display3);
    zscoreSettings(zscore.remove3, zscore.score3);
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
