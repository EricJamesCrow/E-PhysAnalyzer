function determineScaleFactor(platform, screen){
    if(platform === "windows") {
        if(screen === 1.5) {
            return 1
        }
    } else if(platform === "linux") {
        if(screen === 1) {
            return 1.39
        }
    } else{
        return 1
    }
}

function checkForUpdates() {
    updateBarAnimation.running = true
}

function displayDropDownMenuPages(menuPage) {
    if(menuPage === "settings") {
        if(settingsPageOverlay.visible == false && settingsPage.visible == false) {
            settingsPageOverlay.visible = true
            settingsPage.visible = true
            closeSettingsPage.visible = true
            runMenuDropDown()
        } else {
            settingsPageOverlay.visible = false
            settingsPage.visible = false
            closeSettingsPage.visible = false
        }
    }
    else if(menuPage === "about") {
        if(settingsPageOverlay.visible == false && aboutPage.visible == false) {
            settingsPageOverlay.visible = true
            aboutPage.visible = true
            closeAboutPage.visible = true
            runMenuDropDown()
        } else {
            settingsPageOverlay.visible = false
            aboutPage.visible = false
            closeAboutPage.visible = false
        }
    }
    else if(menuPage === "help") {
        if(settingsPageOverlay.visible == false && helpPage.visible == false) {
            settingsPageOverlay.visible = true
            helpPage.visible = true
            closeHelpPage.visible = true
            runMenuDropDown()
        } else {
            settingsPageOverlay.visible = false
            helpPage.visible = false
            closeHelpPage.visible = false
        }
    }
    else if(menuPage === "profiles") {
        if(settingsPageOverlay.visible == false && profilesPage.visible == false) {
            settingsPageOverlay.visible = true
            profilesPage.visible = true
            closeProfilesPage.visible = true
            runMenuDropDown()
        } else {
            settingsPageOverlay.visible = false
            profilesPage.visible = false
            closeProfilesPage.visible = false
        }
    } else if(menuPage === "logout") {
        if(settingsPageOverlay.visible == false && logoutPage.visible == false) {
            settingsPageOverlay.visible = true
            logoutPage.visible = true
            closeLogoutPage.visible = true
            runMenuDropDown()
        } else {
            settingsPageOverlay.visible = false
            logoutPage.visible = false
            closeLogoutPage.visible = false
        }
    } else if(menuPage === "exit") {
        closeWindow()
        runMenuDropDown()
    }
}

function runMenuDropDown(){
    if(menuDropDown.opacity === 0) {
        closeDropDownMenuClickAnywhere.visible = true
        menuDropDown.visible = true
        menuDropDownAnimation.running = true
    } else {
        closeDropDownMenuClickAnywhere.visible = false
        menuDropDownAnimation2.running = true
    }
}

function switchPages(page) {
    for(let i=0; i < switchPagesButtons.length; i++) {
        switchPagesButtons[i].btnColorDefault = settings.buttonColorDefault
        switchPagesButtons[i].fontColorDefault = "#ffffff"
        switchPagesButtons[i].checkedState = false
    }

    if(page === "postProcessing") {
        programSelectorButton1.checkedState = true
        leftContentLoader.source = Qt.resolvedUrl("../pages/left/postProcessing.qml")
    } else if(page === "analyzeData") {
        programSelectorButton2.checkedState = true
        leftContentLoader.source = Qt.resolvedUrl("../pages/left/fileAnalysis.qml")
    } else if(page === "preProcessing") {
        programSelectorButton3.checkedState = true
        leftContentLoader.source = Qt.resolvedUrl("../pages/left/preProcessing.qml")
    } else if(page === "testPage") {
        programSelectorButton4.checkedState = true
        leftContentLoader.source = Qt.resolvedUrl("../pages/left/testPage.qml")
    }
}

// Basic UI functionality

function closeWindow() {
    if(closeMainWindow.visible === false && closeMainWindowOverlay.visible === false && clickOffCloseMainWindow.visible === false) {
        closeMainWindow.visible = true
        closeMainWindowOverlay.visible = true
        clickOffCloseMainWindow.visible = true
    } else {
        closeMainWindow.visible = false
        closeMainWindowOverlay.visible = false
        clickOffCloseMainWindow.visible = false
    }
}


function resetResizeBorders(){
    // Resize visibility
    resizeLeft.visible = true
    resizeRight.visible = true
    resizeBottom.visible = true
    resizeWindow.visible = true
}

function maximizeRestore(){
    if(windowStatus == 0){
        mainWindow.showMaximized()
        windowStatus = 1
        windowMargin = 0
        resizeLeft.visible = false
        resizeRight.visible = false
        resizeBottom.visible = false
        resizeWindow.visible = false
        btnMaximizeRestore.btnIconSource = "../../../images/svg_images/restore_icon.svg"
    }
    else{
        mainWindow.showNormal()
        resetResizeBorders()
        windowStatus = 0
        windowMargin = 10
        btnMaximizeRestore.btnIconSource = "../../../images/svg_images/maximize_icon.svg"
    }
}

function ifMaximizedWindowRestore(){
    if(windowStatus == 1){
        mainWindow.showNormal()
        windowStatus = 0
        windowMargin = 10
        resetResizeBorders()
        btnMaximizeRestore.btnIconSource = "../../../images/svg_images/maximize_icon.svg"
    }
}

function restoreMargings(){
    windowMargin = 10
    windowStatus = 0
    resetResizeBorders()
    btnMaximizeRestore.btnIconSource = "../../../images/svg_images/maximize_icon.svg"
}
