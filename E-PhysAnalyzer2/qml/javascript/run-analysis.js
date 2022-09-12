class GrabSettings {
    constructor(xmin, xmax, ymin, ymax, maxmin, maxmax, maymin, maymax, single, quality, dpi, defaultColor, color, time, display, remove, score){
        this.color = color !== "" ? color : "gray"; // Baseline
        this.time = time !== "" ? parseInt(time) : 10;
        this.display = display;       
        this.xmin = xmin !== "" ? parseInt(xmin) : -this.time; // Post Analysis
        this.xmax = xmax !== "" ? parseInt(xmax) : null;
        this.ymin = ymin !== "" ? parseInt(ymin) : 25;
        this.ymax = ymax !== "" ? parseInt(ymax) : 225;
        this.maxmin = maxmin !== "" ? parseInt(maxmin) : -this.time; // Minute Averaged
        this.maxmax = maxmax !== "" ? parseInt(maxmax) : null;
        this.maymin = maymin !== "" ? parseInt(maymin) : 25;
        this.maymax = maymax !== "" ? parseInt(maymax) : 225;
        this.single = single; // Graph Quality
        this.quality = quality;
        this.dpi = dpi !== "" ? parseInt(dpi) : 300;
        this.defaultColor = defaultColor !== "" ? defaultColor : "gray";
        this.remove = remove; // Z-Score
        this.score = score;
    }
    postAnalysis(){
        console.log(`xmin: ${this.xmin}`)
        console.log(`xmin: ${this.xmax}`)
        console.log(`xmin: ${this.ymin}`)
        console.log(`xmin: ${this.ymax}`)
        return this
    }
    minuteAveraged(){
        console.log(`maxmin: ${this.maxmin}`)
        console.log(`maxmin: ${this.maxmax}`)
        console.log(`maxmin: ${this.maymin}`)
        console.log(`maxmin: ${this.maymax}`)
        return this
    }
    graphQuality(){
        console.log(`use_single_color: ${this.single}`)
        console.log(`graph_quality: ${this.quality}`)
        console.log(`dpi: ${this.dpi}`)
        console.log(`default_color: ${this.defaultColor}`)
        return this
    }
    baseline(){
        console.log(`baseline_color = ${this.color}`)
        console.log(`baseline = ${this.time}`) // Integer
        console.log(`display_baseline = ${this.display}`) // Boolean
        return this
    }
    zScore(){
        console.log(`z_checking = ${this.remove}`) // Boolean
        console.log(`z_limit = ${this.score}`) // Float
        return this
    }
}

class GrabRegions {
    constructor(regionObjects){
        this.regionObjects = regionObjects
    }
    createDict(){
        // const children = {};
        // this.regionObjects.forEach(item => {
        //     const dict = {0: [parseInt(item.greaterThanEqualToText), item.lessThanText, item.colorName.toString()]}          
        //     children.push(dict);
        // });      
        // console.log(JSON.stringify(children))
        var dict = {}
        for(let i=0; i<this.regionObjects.length; i++) {
            dict[i] = [parseInt(this.regionObjects[i].greaterThanEqualToText), this.regionObjects[i].lessThanText, this.regionObjects[i].colorName.toString()]
        }
        backend.run_analyze_data(JSON.stringify(dict))
    }
}

function runGrabRegions(objects) {
    var grabRegions = new GrabRegions(objects)
    grabRegions.createDict()
}

function runGrabSettings(xmin, xmax, ymin, ymax, maxmin, maxmax, maymin, maymax, single, quality, dpi, defaultColor, color, time, display, remove, score) {
    var grabSettings = new GrabSettings(xmin, xmax, ymin, ymax, maxmin, maxmax, maymin, maymax, single, quality, dpi, defaultColor, color, time, display, remove, score)
    grabSettings.postAnalysis().minuteAveraged().graphQuality().baseline().zScore()
}


function grabFiles() {
    var files = []
    for(let i=0; i<fileObjects.length; i++) {
        var excludedTraces = fileObjects[i].excludedTraces.replace(/, +/g, ",").split(",").map(Number) // Convert to list of integers
        var file = [fileObjects[i].file, fileObjects[i].drugName, parseInt(fileObjects[i].traceNumber), excludedTraces]
        files.push(file)
    }
    return files
}
