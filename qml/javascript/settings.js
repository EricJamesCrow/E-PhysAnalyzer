var adjustInputFields = (scale) => {
    objectHeight = 10 * scale
    flickableContentHeight = 696 * scale
    for(let i=0; i<fileObjects.length; i++) {
        fileObjects[i].y = objectHeight
        objectHeight += 40 * scale
        if(i > 16) {
            flickableContentHeight += 40 * scale
        }
    }
}

var adjustRegionHeight = (scale) => {
    regionAxis = 5 * scale
    for(let i=0; i<regionObjects.length; i++) {
        regionObjects[i].y = regionAxis
        regionAxis += 22 * scale
}
}

var scaleFactorDict = {
    0.5: 0,
    0.6: 1,
    0.7: 2,
    0.8: 3,
    0.9: 4,
    1 : 5,
    1.1: 6,
    1.2: 7,
    1.3: 8,
    1.39: 9,
    1.5: 10
};

var updateScaleDict = {       
    0 : 0.5,
    1: 0.6,
    2: 0.7,
    3: 0.8,
    4: 0.9,
    5: 1,
    6: 1.1,
    7: 1.2,
    8: 1.3,
    9: 1.39,
    10: 1.5
};

const increaseScale = () => {
    return settings.scaleFactor = updateScaleFactor(scaleFactorDictFunction()+1)
}

const decreaseScale = () => {
   return settings.scaleFactor = updateScaleFactor(scaleFactorDictFunction()-1) 
}

const scaleFactorDictFunction = () => {
    return scaleFactorDict[settings.scaleFactor]
}
const updateScaleFactor = index => {
    return updateScaleDict[index]
}

const resetSettings = (determineScaleFactor, url) => {
    settings.scaleFactor = determineScaleFactor
    settings.repeatDrugNames = false
    settings.outputFormat = 0
    settings.customDirectory = false
    settings.mtkDefaultOutputPath = url
}