# This Python file uses the following encoding: utf-8
import os
import subprocess
from pathlib import Path
import sys
import datetime

#from PySide6.QtGui import QGuiApplication
from PySide6 import QtGui
from PySide6.QtGui import Qt
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtWidgets import QFileDialog, QApplication, QMessageBox
from PySide6.QtCore import QObject, Slot, Signal

# imports
from FileAnalysis import MainProgram


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.colorCode = True
        self.colorCodes = ['gray', 'black', 'gray', 'purple', 'green', 'blue', 'orange', 'red']
        self.dpi = 300
        self.baseline = True
        self.baselineColor = "gray"
        self.z_limit = 2.5
        self.z_checking = True
        self.z_works = True
        self.fileName = []
        self.dpi_works = True
        self.grabFileName = ""
        self.baselineEntry = 10
        self.baselineEntryWorks = True
        self.axis_limits_works = True
        self.graph_points_works = True

    #Basic UI functionality
    setStackView = Signal()
    clearFilesButton = Signal()
    setGraphsStackView = Signal()
    goClearFiles = Signal()
    getRidOfScrollBar = Signal(int)
    getWindowMargins = Signal()
    goClearFileLabels = Signal()
    showFileLabels = Signal()

    #Sending and receiving data
    setFilenames = Signal(list)
    grabEntries = Signal(list)
    getTheColors = Signal()
    getBaselineColor = Signal()
    getDpi = Signal()
    getZscore = Signal()
    getBaselineValue = Signal()
    setProgressBar = Signal(int, str)
    setColorsBar = Signal(int)
    setRootHeight = Signal(int)
    getAxisLimits = Signal()
    getGraphPoints = Signal()

    @Slot(list)
    def receiveGraphPoints(self, graphPoints):
        self.graph_points_works = True
        try:
            if (graphPoints == [] or graphPoints == ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']):
                self.graphPoints = [-10, -5, -5, 0, 0, 5, 5, 10, 10, 15, 15, 20, 20, 25, 25, 30]
            else:
                self.graphPoints = list(map(int, graphPoints))
        except ValueError:
            self.graph_points_works = False

    @Slot(list)
    def receiveAxisLimits(self, axisLimits):
        self.axis_limits_works = True
        self.axisLimits = []
        try:
            if axisLimits[0] == ['']:
                self.axisLimits.append(-self.baselineEntry)
                self.axisLimits.append(None)
            else:
                for x in axisLimits[0]:
                    if x.strip().lower() == 'none':
                        self.axisLimits.append(None)
                    else:
                        self.axisLimits.append(int(x))
            if axisLimits[1] == ['']:
                self.axisLimits.append(25)
                self.axisLimits.append(225)
            else:
                for x in axisLimits[1]:
                    if x.strip().lower() == 'none':
                        self.axisLimits.append(None)
                    else:
                        self.axisLimits.append(int(x))
            if axisLimits[2] == ['']:
                self.axisLimits.append(-10)
                self.axisLimits.append(None)
            else:
                for x in axisLimits[2]:
                    if x.strip().lower() == 'none':
                        self.axisLimits.append(None)
                    else:
                        self.axisLimits.append(int(x))
            if axisLimits[3] == ['']:
                self.axisLimits.append(None)
                self.axisLimits.append(None)
            else:
                for x in axisLimits[3]:
                    if x.strip().lower() == 'none':
                        self.axisLimits.append(None)
                    else:
                        self.axisLimits.append(int(x))
        except ValueError:
            self.axis_limits_works = False

    @Slot(str)
    def receiveBaselineValue(self, baselineEntry):
        self.baselineEntryWorks = True
        if baselineEntry == "":
            self.baselineEntry = 10
        else:
            try:
                self.baselineEntry = int(baselineEntry.strip())
            except ValueError:
                self.baselineEntryWorks = False

    @Slot()
    def gettingWindowMargins(self):
        # Determines if the window is maximized in main.qml
        self.getWindowMargins.emit()

    @Slot(int)
    def colorsPage(self, num):
    # called from main.qml // emits to ShowColors.qml
        if num == 1:
            self.setColorsBar.emit(303)
            self.setRootHeight.emit(725)
        else:
            self.setColorsBar.emit(496)
            self.setRootHeight.emit(385)

    @Slot(int)
    def scrollBar(self, num):
    # called from main.qml // emits to chosenFiles.qml
        if num == 1:
            size = 404
            self.getRidOfScrollBar.emit(size)
        else:
            x = 0
            try:
                for i in self.files:
                    x += 30
                size = round(x)
                self.getRidOfScrollBar.emit(size)
            except AttributeError:
                pass

    @Slot()
    def gimmeGraphsStackView(self):
        # Grants Stack View functionality upon starting the program
        self.setGraphsStackView.emit()

    @Slot()
    def getFilename(self):
        # Select multiple files
        self.grabFileName, _ = QFileDialog.getOpenFileNames(
            None,
            "Select an ATF File",
            "",
            "ATF File (*.atf)"
        )
        if len(self.grabFileName) > 24:
            self.failure_pop_up(drugNames=[''], traceNumbers=[''])
        elif len(self.grabFileName) < 1:
            pass
        else:
            self.files = []
            self.fileName = self.grabFileName
            for i in self.fileName:
                self.files.append(os.path.basename(i))
            self.setFilenames.emit(self.files)
            self.showFileLabels.emit()

    @Slot()
    def clearFiles(self):
        self.goClearFiles.emit()
        self.goClearFileLabels.emit()
        self.fileName = []
        self.files = []

    @Slot()
    def run(self):
        self.loadGraphicsSettingsPage()
        try:
            self.grabEntries.emit(self.files)
        except AttributeError:
            self.failure_pop_up(drugNames=[''], traceNumbers=[''])

    def loadGraphicsSettingsPage(self):
        engine = QQmlApplicationEngine()
        engine.rootContext().setContextProperty("backend", main)
        engine.load(os.fspath(Path(__file__).resolve().parent / "qml/pages/graphSettings.qml"))
        self.getTheColors.emit()
        self.getBaselineColor.emit()
        self.getDpi.emit()
        self.getZscore.emit()
        self.getBaselineValue.emit()
        self.getAxisLimits.emit()
        self.getGraphPoints.emit()

    @Slot(str)
    def receiveDpi(self, dpi):
        self.dpi_works = True
        if dpi == '':
            self.dpi = 300
        elif dpi == '0':
            self.dpi = 100
        elif dpi == '1':
            self.dpi = 300
        elif dpi == '2':
            self.dpi = 600
        elif dpi == '3':
            self.dpi = 1000
        else:
            try:
                self.dpi = int(dpi.strip())
            except ValueError:
                self.dpi_works = False

    @Slot(str)
    def receiveZscore(self, zScore):
        self.z_works = True
        self.z_checking = True
        if zScore == "false":
            self.z_checking = False
        elif zScore == '':
            self.z_limit = 2.5
        else:
            try:
                self.z_limit = float(zScore.strip())
            except ValueError:
                self.z_works = False


    @Slot(str)
    def receiveBaselineColor(self, baselineColor):
        if baselineColor == "false":
            self.baseline = False
            self.baselineColor = "gray"
        else:
            self.baseline = True
            if baselineColor == "":
                self.baselineColor = "gray"
            else:
                self.baselineColor = baselineColor

    @Slot(list)
    def receiveColors(self, colorCodes):
        if colorCodes[0] == '':
            colorCodes[0] = 'gray'
        if colorCodes[1] == '':
            colorCodes[1] = 'black'
        if colorCodes[2] == '':
            colorCodes[2] = 'gray'
        if colorCodes[3] == '':
            colorCodes[3] = 'purple'
        if colorCodes[4] == '':
            colorCodes[4] = 'green'
        if colorCodes[5] == '':
            colorCodes[5] = 'blue'
        if colorCodes[6] == '':
            colorCodes[6] = 'orange'
        if colorCodes[7] == '':
            colorCodes[7] = 'red'
        self.colorCodes = colorCodes

    @Slot(list, list, list)
    def getEntries(self, drugNames, traceNumbers, excludedTraces):
        # self.run_file_analysis(self.fileName, drugNames, traceNumbers, excludedTraces, self.colorCode, self.colorCodes)
        if (any(len(traceNumbers[i].strip().split(' ')) > 1 or not traceNumbers[i].isdigit() for i in range(len(traceNumbers)))):
            self.failure_pop_up(drugNames, traceNumbers)
        else:
            try:
                self.checkExcludedTraces(self.fileName, excludedTraces)
                if '' in drugNames or '' in self.fileName or '' in traceNumbers or \
                        self.z_works == False or self.dpi_works == False or \
                        self.baselineEntryWorks == False or self.axis_limits_works == False or self.graph_points_works == False:
                    self.failure_pop_up(drugNames, traceNumbers)
                else:
                    try:
                        self.run_file_analysis(self.fileName, drugNames, traceNumbers, excludedTraces, self.colorCode,
                                 self.colorCodes)
                    except ZeroDivisionError:
                        self.zero_division_error()
                    except:
                        self.failure_pop_up(drugNames, traceNumbers)
            except:
                self.excluded_traces_failure_pop_up()

    def run_file_analysis(self, files, drugNames, traceNumbers, excludedTraces, colorCode, colorCodes):
        mP = MainProgram()
        mP.check_dpi(self.dpi)
        mP.check_graphs(colorCodes)
        mP.check_baseline(self.baselineColor)
        mP.mkdir_outputs(files)
        for i in range(len(files)):
            self.excludedTracesStripped = []
            for x in excludedTraces[i]:
                if x.strip():
                    self.excludedTracesStripped.append(x)
            mP.mkdir(self.fileName[i])
            mP.analyze_data(self.fileName[i], drugNames[i], int(traceNumbers[i]), self.excludedTracesStripped,
                            colorCode, colorCodes, self.z_limit, self.z_checking, self.baselineEntry, self.graphPoints)
            mP.make_graphs(self.dpi, self.baseline, self.baselineColor, self.axisLimits)
            num_of_files_complete_string = f"{i+1}/{len(files)} complete"
            num_of_files_complete = (i+1)*int(100/(len(files)))
            self.setProgressBar.emit(num_of_files_complete, num_of_files_complete_string)
            QApplication.processEvents()
        self.excludedTracesStripped = []

        base_name = os.path.basename(self.fileName[0])
        self.base_name_no_ext_outputs = os.path.splitext(base_name)[0]
        parent_dir = os.path.dirname(os.path.abspath(self.fileName[0]))
        directory = f"E-Phys Analyzer {datetime.date.today()} Results"
        path = os.path.join(parent_dir, directory)
        self.new_path = path
        if self.new_path == path:
            self.success_pop_up(path)

############################# Pop-ups #####################################################
    def zero_division_error(self):
        self.msg3 = QMessageBox()
        self.msg3.setIcon(QMessageBox.Critical)
        self.msg3.setWindowIcon(QtGui.QIcon('images/svg_images/activity.svg'))
        self.msg3.setWindowTitle("Error")
        self.msg3.setText("Please enter a value into the 'trace number' entry box "
                          "that is beyond your baseline trace values.")
        self.msg3.setStandardButtons(QMessageBox.Ok)
        x = self.msg3.exec()

    def failure_pop_up(self, drugNames, traceNumbers):
        self.msg2 = QMessageBox()
        self.msg2.setIcon(QMessageBox.Critical)
        self.msg2.setWindowIcon(QtGui.QIcon('images/svg_images/activity.svg'))
        self.msg2.setWindowTitle("Error")

        if self.grabFileName == "":
            self.msg2.setText("Please select a file.")
        elif len(self.grabFileName) > 24:
            self.msg2.setText("Please only select a maximum of twelve files.")
        elif self.baselineEntryWorks == False:
            self.msg2.setText("Please enter an integer for the baseline value.")
        elif self.z_works == False:
            self.msg2.setText("Z-Score is not an integer or decimal value.")
        elif self.fileName == []:
            self.msg2.setText("Choose a file.")
        elif ('' in drugNames) and ('' in traceNumbers):
            self.msg2.setText("Input your values.")
        elif '' in drugNames:
            self.msg2.setText("Missing one or more values for the name of the drug.")
        elif '' in traceNumbers:
            self.msg2.setText("Missing one or more values for the trace number.")
        elif any(len(traceNumbers[i].strip().split(' ')) > 1 for i in range(len(traceNumbers))):
            self.msg2.setText("Make sure you choose only one trace number and there are no spaces.")
        elif any(not traceNumbers[i].isdigit() for i in range(len(traceNumbers))):
            self.msg2.setText("One or more values is not an integer for the trace number.")
        elif self.dpi_works == False:
            self.msg2.setText("DPI is not an integer.")
        elif self.axis_limits_works == False:
            self.msg2.setText("Input either integers or 'None' in the Axis Limits separated by commas.\n"
                              "Example: -10, None")
        elif self.graph_points_works == False:
            self.msg2.setText("Please fill out all of the time ranges in the graph settings.")
        else:
            self.msg2.setText('One or more values in the graph settings is not valid.\n'
                              'Click "Colors" in SETUP to see a list of available colors.')
        self.msg2.setStandardButtons(QMessageBox.Ok)
        x = self.msg2.exec()


    def checkExcludedTraces(self, files, excludedTraces):
        for i in range(len(files)):
            self.excludedTracesStripped = []
            for x in excludedTraces[i]:
                if x.strip():
                    self.excludedTracesStripped.append(x)
            x = list(map(int, self.excludedTracesStripped))

    def excluded_traces_failure_pop_up(self):
        self.msg5 = QMessageBox()
        self.msg5.setIcon(QMessageBox.Critical)
        self.msg5.setWindowIcon(QtGui.QIcon('images/svg_images/activity.svg'))
        self.msg5.setWindowTitle("Error")
        if any(i.isalpha() for i in self.excludedTracesStripped):
            self.msg5.setText("One or more values is not an integer for the excluded traces.")
        else:
            self.msg5.setText("Please separate your values with commas.")
        self.excludedTracesStripped = []
        self.msg5.setStandardButtons(QMessageBox.Ok)
        x = self.msg5.exec()

    def success_pop_up(self, path):
        self.msg = QMessageBox()
        self.msg.setWindowTitle("Successful!")
        self.msg.setText(f"Files saved in {path}!")
        self.msg.setWindowIcon(QtGui.QIcon('images/svg_images/activity.svg'))
        self.msg.setTextInteractionFlags(Qt.TextSelectableByMouse | Qt.TextSelectableByKeyboard)
        self.msg.setStandardButtons(QMessageBox.Ok | QMessageBox.Open)
        self.msg.buttonClicked.connect(self.success_pop_up_buttons)
        x = self.msg.exec()

    def success_pop_up_buttons(self, button):
        if button.text() == "Open":
            self.open_files_saved()
        elif button.text() == "OK":
            pass
        else:
            pass

    def open_files_saved(self):
        if os.name == 'nt':
            subprocess.Popen(rf'explorer /open,{self.new_path}')
        else:
            subprocess.run(['open', f'{self.new_path}'], check=True)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setOrganizationName("Some Company")
    app.setOrganizationDomain("somecompany.com")
    app.setApplicationName("Amazing Application")
    engine = QQmlApplicationEngine()

    # Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))
    main.setStackView.emit()
    main.clearFilesButton.emit()
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
