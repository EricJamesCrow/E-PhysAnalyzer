class GrabSettings {
    constructor(xmin, xmax, ymin, ymax, maxmin, maxmax, maymin, maymax, single, quality, dpi, defaultColor, color, time, display, remove, score){
        this.color = color !== "" ? color : "gray"; // Baseline
        this.time = time !== "" ? parseInt(time) : 10;
        this.display = display;       
        this.xmin = xmin !== "" ? parseInt(xmin) : -this.time; // Post Analysis
        this.xmax = xmax !== "" ? parseInt(xmax) : null;
        this.ymin = ymin !== "" ? parseInt(ymin) : null;
        this.ymax = ymax !== "" ? parseInt(ymax) : null;
        this.maxmin = maxmin !== "" ? parseInt(maxmin) : -this.time; // Minute Averaged
        this.maxmax = maxmax !== "" ? parseInt(maxmax) : null;
        this.maymin = maymin !== "" ? parseInt(maymin) : 25;
        this.maymax = maymax !== "" ? parseInt(maymax) : 225;
        this.single = single; // Graph Quality
        this.quality = quality;
        this.dpi = dpi !== "" ? parseInt(dpi) : 300;
        this.defaultColor = defaultColor !== "" ? defaultColor : "gray";
        this.remove = remove; // Z-Score
        this.score = score !== "" ? parseFloat(score) : 2.5;
    }
    postAnalysis(){
        if(this.xmax !== null && this.xmax <= this.xmin || this.ymax !== null && this.ymax <= this.ymin){
            var msg = "Check Post Analysis values"
            return errorMsg(msg, postAnalysisSection)
        } else {
            return this.minuteAveraged()
        }
    }
    minuteAveraged(){
        if(this.maxmax !== null && this.maxmax <= this.maxmin || this.maymax !== null && this.maymax <= this.maymin){
            var msg = "Check Minute Averaged values"
            return errorMsg(msg, minuteAveragedSection)
        } else {
            return this.graphQuality()
        }
    }
    graphQuality(){
        if(this.quality === 0) {
            this.dpi = 100
        } else if(this.quality === 1){
            this.dpi = 300
        } else if(this.quality === 2){
            this.dpi = 600 
        } else if(this.quality === 3){
            this.dpi = 1000
        }
        return this.returnData()
    }
    returnData(){
        emitReturnData(this.color, this.time, this.display, [this.maxmin, this.maxmax, this.maymin, 
            this.maymax, this.xmin, 
            this.xmax, this.ymin, this.ymax], this.single, this.dpi, this.defaultColor, 
            this.remove, this.score)
        backend.run_analyze_data(fileData, score, remove, display, time, content.regions, defaultcolor, dpi, colorSelected, axisLimits, single, settings.outputFormat, settings.customDirectory, settings.mtkDefaultOutputPath)
    }
}

class GrabRegions {
    constructor(regionObjects){
        this.regionObjects = regionObjects
    }
    createDict(){
        var dict = {}
        for(let i=0; i<this.regionObjects.length; i++) {
            dict[i] = [parseInt(this.regionObjects[i].greaterThanEqualToText), parseInt(this.regionObjects[i].lessThanText), getKeyByValue(colorDict, this.regionObjects[i].chosenRegionColor.toString().toUpperCase())]
        }
        backend.emit_region(JSON.stringify(dict))
    }
}


const runGrabRegions = objects => {
    var grabRegions = new GrabRegions(objects)
    grabRegions.createDict()
}

function runGrabSettings(xmin, xmax, ymin, ymax, maxmin, maxmax, maymin, maymax, single, quality, dpi, defaultColor, color, time, display, remove, score) {
    var grabSettings = new GrabSettings(xmin, xmax, ymin, ymax, maxmin, maxmax, maymin, maymax, single, quality, dpi, defaultColor, color, time, display, remove, score)
    grabSettings.postAnalysis()
}


const grabFiles = () => {
    var data = []
    for(let i=0; i<fileObjects.length; i++) {
        var excludedTraces = fileObjects[i].excludedTraces !== "" ? fileObjects[i].excludedTraces.replace(/, +/g, ",").split(",").map(Number) : "" // Convert to list of integers
        var file = [files[i].toString().substring(8), fileObjects[i].drugName, parseInt(fileObjects[i].traceNumber), excludedTraces]
        data.push(file)
    }
    fileData = data 
    return fileData = data
}

const checkFiles = () => {
    for(let i=0; i<fileData.length; i++) {
        if(fileData[i][1] == "" || fileData[i][2].toString() == "NaN"){
            var msg = "Empty values for drug name or trace number in one or more fields"
            errorMsgFields(msg)
            return "Error"
        }
    }
}

var errorMsgFields = msg => {
    errorMessage = Qt.createQmlObject(`import QtQuick; import QtQuick 2.0; import QtQuick.Controls 6.2; import "../controls"; RegionErrorMsg {id: errorMessage; 
        x: 225 * scaleFactor;
        y: 71 * scaleFactor;
        width: 400 * scaleFactor;
        height: 36 * scaleFactor;
        opacity: 0; OpacityAnimator on opacity {from: 0; to: 1.0; duration: 150; running: true} PropertyAnimation {target: errorMessage; property: "y"; to: 41 * scaleFactor; duration: 150; running: true}}`,
        leftContentLoader,
    "regionErrorMsg");
    errorMessage.errorMessageString = msg
    runBtn.enabled = false // Disable run button while error message is visible
    backend.destroy_error_msg("fields") // Need to call a Python thread so the message is destroyed after 1 second
}

const destroyErrorMsg = () => {
    errorMessage.destroy()
    runBtn.enabled = true // re-enable run button
}

const runAnalyzeData = () => {
    grabFiles()
    if(checkFiles() !== "Error"){
        getRegions()
        getGraphSettings()
    }
}

// figure out how to import this from region.js
var getKeyByValue = (object, value) => {
    return Object.keys(object).find(key => object[key] === value);
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
