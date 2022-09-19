# This Python file uses the following encoding: utf-8
from dataclasses import dataclass
import os
from pathlib import Path
import sys
import time
import json
from math import trunc
import subprocess

from PySide6 import QtCore
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtWidgets import QFileDialog, QApplication
from PySide6.QtGui import QIcon
from PySide6.QtCore import QObject, Slot, Signal
from threading import *

from RunAnalysis import Analysis

class Backend(QObject):
    addObject = Signal(str)
    animateObject = Signal(int)
    newRegion = Signal(str, str)
    adjustHeight = Signal()
    destroyMsg = Signal()
    destroyErrorMsg = Signal()
    destroyErrorInputField = Signal()
    destroyGenPtn = Signal(bool)
    destroyColorPicker = Signal()
    emitRegions = Signal(str)
    disableRun = Signal()
    enableRun = Signal()
    emitProgressBar = Signal(float)
    emitInputFieldError = Signal(int)
    emitInputFieldSuccess = Signal(int)
    successDialog = Signal(str)
    analysisError = Signal(str)
    updateDirectory = Signal(str)
    emitStartUp = Signal()
    startUpDrugName = Signal(str)
    startUpTraceNumber = Signal(str)
    startUpGenPtn = Signal(int)
    startUpNewRegion = Signal(int)
    startupClearRegions = Signal()
    startUpClearInputFields = Signal()
    startUpMenuDropDown = Signal(int)
    welcomeToEphysAnalyzer = Signal()
    starting_animation_time = 0.2
    object_animation_time = 0.1

    @Slot()
    def change_default_directory(self):
        new_dir = QFileDialog.getExistingDirectory()
        if new_dir != "":
            return self.updateDirectory.emit(f"{new_dir}/")

    @Slot(str)
    def open_files_saved(self, directory):
        if os.name == 'nt':
            subprocess.Popen(rf'explorer /open,{directory}')
        else:
            subprocess.run(['open', f'{directory}'], check=True)

    @Slot(str)
    def emit_region(self, region):
        self.emitRegions.emit(region)

    @Slot(list, float, bool, bool, int, str, str, int, str, list, bool, int, bool, str)
    def run_analyze_data(self, files, z_limit, z_checking, baseline, baseline_int, color_regions_dict, default_color, dpi, baseline_color, axis_limits, single, graph_format, use_custom_directory, custom_directory):
        color_regions_dict = json.loads(color_regions_dict) # Convert string back to dictioanry
        if color_regions_dict == {}:
            color_regions_dict = {'0': [-10, -5, 'grey'], '1': [-5, 0, 'black'], '2': [0, 5, 'grey'], '3': [5, 10, 'purple'], '4': [10, 15, 'green'], '5': [15, 20, 'blue'], '6': [20, 25, 'orange'], '7': [25, 30, 'red']}
        if single == True:
            for i in range(len(color_regions_dict)):
                color_regions_dict[str(i)][2] = default_color
        analysis = StartAnalysis(files, z_limit, z_checking, baseline, baseline_int, color_regions_dict, default_color, dpi, baseline_color, axis_limits, graph_format, use_custom_directory, custom_directory)
        analysis.start()

    @Slot()
    def run_starting_animation(self):
        starting_animation = StartingAnimation()
        starting_animation.start()

    @Slot()
    def adjust_region_height(self):
        self.adjustHeight.emit()

    @Slot(list)
    def create_objects(self, selected_files):
        input_fields = InputFields(selected_files)
        input_fields.start()

    @Slot(int, int, int)
    def run_generate_pattern(self, every_minutes, start_time, end_time):
        generate_pattern = GeneratePattern(every_minutes, start_time, end_time)
        generate_pattern.start()

    @Slot(str)
    def destroy_error_msg(self, string):
        error_message = ErrorMessage(string)
        error_message.start()

    @Slot()
    def disable_run_button(self):
        self.disableRun.emit()

    @Slot()
    def enable_run_button(self):
        self.enableRun.emit()

    @Slot(int)
    def start_up(self, num):
        start_up = StartUp(num)
        start_up.start()

class StartAnalysis(Thread):
    def __init__(self, file, z_limit, z_checking, baseline, baseline_int, color_regions_dict, default_color, dpi, baseline_color, axis_limits, graph_format, use_custom_directory, custom_directory):
        super(StartAnalysis, self).__init__()
        self.files = file
        self.z_limit = z_limit
        self.z_checking = z_checking
        self.baseline = baseline
        self.baseline_int = baseline_int
        self.color_regions_dict = color_regions_dict
        self.default_color = default_color
        self.dpi = dpi
        self.baseline_color = baseline_color
        self.axis_limits = axis_limits
        self.graph_format = graph_format
        self.use_custom_directory = use_custom_directory
        self.custom_directory = custom_directory


    def run(self):
        backend.emitProgressBar.emit(0/len(self.files)*100)
        if self.graph_format == 0:
            self.graph_format = "png"
        elif self.graph_format == 1:
            self.graph_format = "pdf"
        for i in range(len(self.files)):
            analysis = Analysis()
            try:
                if self.use_custom_directory:
                    analysis.mkdir_outputs(self.custom_directory, self.use_custom_directory)
                else:
                    analysis.mkdir_outputs(self.files[i][0], self.use_custom_directory)
                analysis.mkdir(self.files[i][0])
                analysis.analyze_data(self.files[i][0], self.files[i][1], trunc(self.files[i][2]), [trunc(x) for x in self.files[i][3]], self.z_limit, self.z_checking, self.baseline_int, self.color_regions_dict, self.default_color)
                analysis.make_graphs(self.dpi, self.baseline, self.baseline_color, self.axis_limits, self.graph_format)
                backend.emitProgressBar.emit((i+1)/len(self.files)*100)
                backend.emitInputFieldSuccess.emit(i)
            except Exception as ex:
                backend.analysisError.emit(f"{os.path.basename(self.files[i][0])} Error: {str(ex)}.\nCheck trace number.")
                backend.emitInputFieldError.emit(i)
        directory = analysis.return_directory()
        time.sleep(0.1)
        backend.successDialog.emit(directory)

class StartUp(Thread):
    def __init__(self, num):
        super(StartUp, self).__init__()
        self.num = num

    def run(self):
        if self.num == 2:
            time.sleep(0.4)
            backend.emitStartUp.emit()
        elif self.num == 4:
            time.sleep(0.1)
            backend.startUpDrugName.emit("S")
            time.sleep(0.1)
            backend.startUpDrugName.emit("SN")
            time.sleep(0.1)
            backend.startUpDrugName.emit("SNA")
            time.sleep(0.1)
            backend.startUpDrugName.emit("SNAP")
            time.sleep(0.1)
            backend.startUpTraceNumber.emit("6")
            time.sleep(0.1)
            backend.startUpTraceNumber.emit("68")
            time.sleep(0.25)
            backend.emitStartUp.emit()
        elif self.num == 6:
            for i in range(10):
                time.sleep(0.1)
                backend.startUpGenPtn.emit(i)
            time.sleep(0.25)
            backend.emitStartUp.emit()
        elif self.num == 8:
            time.sleep(0.25)
            backend.startupClearRegions.emit()
            for i in range(20):
                time.sleep(0.1)
                backend.startUpNewRegion.emit(i)
            time.sleep(0.25)
            backend.emitStartUp.emit()
        elif self.num == 15:
            for i in range(8):
                time.sleep(0.25)
                if i != 5:
                    backend.emitInputFieldSuccess.emit(i)
                else:
                    backend.emitInputFieldError.emit(i)
            backend.emitStartUp.emit()
        elif self.num == 17:
            backend.startUpClearInputFields.emit()
            backend.startupClearRegions.emit()
            backend.startUpNewRegion.emit(123)
        elif self.num == 18:
            for i in range(5):
                time.sleep(0.2)
                backend.startUpMenuDropDown.emit(i)
            backend.emitStartUp.emit()
        elif self.num == 23:
            backend.emitStartUp.emit()
        elif self.num == 24:
            time.sleep(5)
            backend.welcomeToEphysAnalyzer.emit()
            time.sleep(0.25)
            backend.emitStartUp.emit()
        


class StartingAnimation(Thread):
    def run(self):
        time.sleep(backend.starting_animation_time)
        backend.emitStartUp.emit()
        backend.starting_animation_time = 0
        for i in range(9):
            time.sleep(backend.object_animation_time)
            backend.animateObject.emit(i)
        backend.object_animation_time = 0.04

class InputFields(Thread):
    def __init__(self, selected_files):
        super(InputFields, self).__init__()
        self.selected_files = selected_files

    def run(self):
        for i in range(len(self.selected_files)):
            time.sleep(0.03)
            backend.addObject.emit(self.selected_files[i])

class GeneratePattern(Thread):
    def __init__(self, every_minutes, start_time, end_time):
        super(GeneratePattern, self).__init__()
        self.every_minutes = every_minutes
        self.start_time = start_time
        self.end_time = end_time
    
    def run(self):
        greater_than = self.start_time
        for i in range(int(abs(self.start_time - self.end_time) / self.every_minutes)):
            time.sleep(0.05)
            less_than = greater_than + self.every_minutes
            backend.newRegion.emit(str(greater_than), str(less_than))
            greater_than = less_than
        backend.destroyGenPtn.emit(False)

class ErrorMessage(Thread):
    def __init__(self, string):
        super(ErrorMessage, self).__init__()
        self.string = string
    
    def run(self):
        if self.string == "region":
            time.sleep(1)
            backend.destroyMsg.emit()
        elif self.string == "settings":
            time.sleep(2)
            backend.destroyErrorMsg.emit()
        elif self.string == "fields":
            time.sleep(3)
            backend.destroyErrorInputField.emit()
        elif self.string == "generate":
            time.sleep(1)
            backend.destroyGenPtn.emit(True)
        elif self.string == "colorpicker":
            time.sleep(1)
            backend.destroyColorPicker.emit()
        


if __name__ == "__main__":
    QtCore.QCoreApplication.setAttribute(QtCore.Qt.AA_ShareOpenGLContexts)
    app = QApplication(sys.argv)
    app.setOrganizationName("Washington State University")
    app.setOrganizationDomain("github.com/EricJamesCrow/E-PhysAnalyzer")
    app.setApplicationName("E-PhysAnalyzer")
    app.setWindowIcon(QIcon("images/activity.png"))
    engine = QQmlApplicationEngine()
    backend = Backend()
    engine.rootContext().setContextProperty("backend", backend)
    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
