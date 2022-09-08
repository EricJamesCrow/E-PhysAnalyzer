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