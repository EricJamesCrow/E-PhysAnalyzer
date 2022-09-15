var runProgressBar = (num) => {
    progressBarOverlay.visible = true
    progressBarOverlayMouseArea.visible = true
    progressBar.value = num
}

var showSuccessDialog = (directory) => {
    progressBar.visible = false
    filesFinishedWindow.visible = true
    filesFinishedBrowseButton.focus = true
    filesFinishedWindowsLabel.text = `Files saved in ${directory}`
    outputDirectory = directory
}

const closeFilesWindow = function() {
    filesFinishedWindow.visible = false
    progressBarOverlay.visible = false
    progressBarOverlayMouseArea.visible = false
    progressBar.visible = true
}