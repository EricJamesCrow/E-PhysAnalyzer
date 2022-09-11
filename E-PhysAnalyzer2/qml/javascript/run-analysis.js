function grabFiles() {
    var files = []
    for(let i=0; i<fileObjects.length; i++) {
        var excludedTraces = fileObjects[i].excludedTraces.replace(/, +/g, ",").split(",").map(Number)
        var file = [fileObjects[i].file, fileObjects[i].drugName, parseInt(fileObjects[i].traceNumber), excludedTraces]
        files.push(file)
    }
    return files
}

function grabZscore(zscore) {
    var remove = zscore.remove
    var score = `${zscore.score}`!== "" ? parseFloat(zscore.score) : 2.5
    console.log(remove)
    console.log(score)
}