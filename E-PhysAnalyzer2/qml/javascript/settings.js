function adjustInputFields(scale) {
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

function adjustRegionHeight(scale) {
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

function increaseScale() {
    return settings.scaleFactor = Settings.updateScaleFactor(scaleFactorDictFunction()+1)
}

function decreaseScale() {
   return settings.scaleFactor = Settings.updateScaleFactor(scaleFactorDictFunction()-1) 
}

function scaleFactorDictFunction(){
    return scaleFactorDict[settings.scaleFactor]
}
function updateScaleFactor(index){
    return updateScaleDict[index]
}

function resetSettings(determineScaleFactor) {
    settings.scaleFactor = determineScaleFactor
}

function logDeviceInformation() {
    mutationspectra.terminal_update_info(`Operating System: ${Qt.platform.os}`)
    mutationspectra.terminal_update_info(`Pixel Density: ${Screen.pixelDensity}`)
    mutationspectra.terminal_update_info(`Device Pixel ratio: ${Screen.devicePixelRatio}`)
    mutationspectra.terminal_update_info(`Desktop Available Height: ${Screen.desktopAvailableHeight}`)
    mutationspectra.terminal_update_info(`Desktop Available Width: ${Screen.desktopAvailableWidth}`)
    mutationspectra.terminal_update_info(`X-coordinate Virtual: ${Screen.virtualX}`)
    mutationspectra.terminal_update_info(`Y-coordinate Virtual: ${Screen.virtualY}`)
    mutationspectra.terminal_update_info(`Width: ${Screen.width}`)
    mutationspectra.terminal_update_info(`Manufacturer: ${Screen.manufacturer}`)
    mutationspectra.terminal_update_info(`Model: ${Screen.model}`)
    mutationspectra.terminal_update_info(`Name: ${Screen.name}`)
    mutationspectra.terminal_update_info(`Serial Number: ${Screen.serialNumber}`)
}