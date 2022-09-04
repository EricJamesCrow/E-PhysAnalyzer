function animate(object) {
    var objects = {
        0: generatePatternOpacity, 1: newRegionOpacity, 2: regionsOpacity, 3: postAnalysisOpacity, 
        4: colorCodeOpacity, 5: minuteAveragedOpacity, 6: baselineOpacity, 7: zScoreOpacity, 8: resetBtnOpacity
    }
    objects[object].running = true
}