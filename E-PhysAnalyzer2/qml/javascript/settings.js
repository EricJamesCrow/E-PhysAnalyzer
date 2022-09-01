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

function lightTheme() {
    settings.topBarColor = "#02323a"
    settings.topBarSecondaryColor = "#015967"
    settings.columnColor ="#5ac1d0"
    settings.backgroundColor ="#b8e3ee"
    settings.backgroundBorderColor = "#e9efec"
    settings.buttonColorDefault = "#087589"
    settings.buttonColorPressed = "#357aac"
    settings.checkBoxHighlighted = "#33aac0"
    settings.terminalUnderlineColor = "#51abb9"
    settings.terminalText = "#2aafd3"
    settings.menuDropDownMouseOverColor = "#af025967"
    settings.addFilterSvgIcon = "../../images/svg_images/plus_icon_087589.svg"
    settings.closeBtnSvgIcon = "../../../images/svg_images/close_icon.svg"
    settings.checkBoxIcon = "../../../images/svg_images/checkmark_icon_087589.svg"
    settingsPage.changeTheme()
}

function darkTheme() {
    settings.topBarColor = "#1e202f" //"#282828"
    settings.topBarSecondaryColor = "#292a3e"
    settings.columnColor ="#282828" //"#6B3487"
    settings.backgroundColor = "#212121"
    settings.backgroundBorderColor = "#A0ACFB"
    settings.buttonColorDefault = "#bb86fc" //"#B155DF"
    settings.buttonColorPressed = "#CA62FF"
    settings.checkBoxHighlighted = "#cda5fe" //"#760afa"
    settings.terminalUnderlineColor = "#A951D6"
    settings.terminalText = "#bb86fc"
    settings.menuDropDownMouseOverColor = "#a762fd"
    settings.addFilterSvgIcon = "../../images/svg_images/plus_icon_bb86fc.svg"
    settings.closeBtnSvgIcon = "../../../images/svg_images/close_icon_white.svg"
    settings.checkBoxIcon = "../../../images/svg_images/checkmark_icon_bb86fc.svg"
    settingsPage.changeTheme()
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