const tooltips = () => {
    settings.startup += 1
    if(startup === 2) {
        let sampleFiles = ["example1.atf", "example2.atf", "example3.atf", "example4.atf", "example5.atf", "example6.atf", "example7.atf", "example8.atf"]
        backend.create_objects(sampleFiles)
        return backend.start_up(startup)
    } 
    if(startup === 23) {
        App.displayDropDownMenuPages("settings")
    }
    backend.start_up(startup)
}

const skipTutorial = () => {
    settings.startup = 23
    tooltips()
}

const genPattern = num => {
    if(num === 0) {
        return Region.expandDialogBox()
    } else if(num === 1 ) {
        return every_minutesTextField.text = "5"
    } else if(num === 2) {
        return startTimeEntry.text = "-"
    } else if(num === 3) {
        return startTimeEntry.text = "-1"
    } else if(num === 4) {
        return startTimeEntry.text = "-10"
    } else if(num === 5) {
        return endTimeEntry.text = "3"
    } else if(num === 6) {
        return endTimeEntry.text = "30"
    } else if(num === 7) {
        return submitButton.focus = true
    } else if(num === 8) {
        return Region.generatePattern(every_minutesTextField.text, startTimeEntry.text, endTimeEntry.text)
    } else if(num === 9) {
        every_minutesTextField.text = ""
        startTimeEntry.text = ""
        endTimeEntry.text = ""
        return Region.expandDialogBox()
    }
}

const newRegion = num => {
    if(num === 0) {
        return Region.expandDialogBox()
    } else if(num === 1) {
        return greaterThanOrEqualEntry.text = "-"
    } else if(num === 2) {
        return greaterThanOrEqualEntry.text = "-1"
    } else if(num === 3) {
        return greaterThanOrEqualEntry.text = "-10"
    } else if(num === 4) {
        return lessThanEntry.text = "-"
    } else if(num === 5) {
        return lessThanEntry.text = "-5"
    } else if(num === 16) {
        return submitButton.focus = true
    } else if(num === 18) {
        greaterThanOrEqualEntry.text = ""
        lessThanEntry.text = ""
        return Region.expandDialogBox()
    }
}

const colorPicker = num => {
    if(num === 7) {
        return Region.expandDialogBox()
    } else if(num === 8) {
        return customColorEntry.text = "m"
    } else if(num === 9) {
        return customColorEntry.text = "ma"
    } else if(num === 10) {
        return customColorEntry.text = "mag"
    } else if(num === 11) {
        return customColorEntry.text = "mage"
    } else if(num === 12) {
        return customColorEntry.text = "magen"
    } else if(num === 13) {
        return customColorEntry.text = "magent"
    } else if(num === 14) {
        return customColorEntry.text = "magenta"
    } else if(num === 15) {
        Region.expandDialogBox()
        return customColorEntry.text = "";
    }
}

const menu = num => {
    if(num === 0) {
        menuDropDownButton.focus = true
    }
    else if(num === 1) {
        App.runMenuDropDown()
    } else if(num === 2) {
        aboutMenuButton.focus = true
    } else if(num === 3) {
        settingsMenuButton.focus = true
    } else if(num === 4) {
        App.displayDropDownMenuPages("settings")
    }
}

const checkStartup = () => {
    if(settings.startup < 25) {
        return settings.startup = -1
    }
}

const closeWelcome = () => {
    welcomeAnimation2.running = true
}