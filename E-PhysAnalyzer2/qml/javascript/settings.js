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

function scaleFactorDictFunction(){
    return scaleFactorDict[settings.scaleFactor]
}
function updateScaleFactor(index){
    return updateScaleDict[index]
}

function resetSettings(determineScaleFactor) {
    settings.mtkDefaultOutputPath = Qt.resolvedUrl("./../../").toString().slice(8)
    settings.scaleFactor = determineScaleFactor
    lightTheme()
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

// Connections
function onUpdateDirectory(dir) {
    settings.mtkDefaultOutputPath = dir
}

function onGetCwd() {
    pptools.push_cwd(settings.mtkDefaultOutputPath)
}