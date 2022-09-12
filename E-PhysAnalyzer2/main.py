# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
import time
import json

from PySide6 import QtCore
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QGuiApplication, QIcon
from PySide6.QtCore import QObject, Slot, Signal
from threading import *

from RunAnalysis import Analysis

class Backend(QObject):
    addObject = Signal(str)
    animateObject = Signal(int)
    newRegion = Signal(str, str)
    adjustHeight = Signal()
    destroyMsg = Signal()
    emitRegions = Signal(str)
    starting_animation_time = 0.2
    object_animation_time = 0.1

    @Slot(str)
    def emit_region(self, region):
        self.emitRegions.emit(region)

    @Slot(list, float, bool, int, str, str, int, str, list)
    def run_analyze_data(self, files, z_limit, z_checking, baseline, color_regions_dict, default_color, dpi, baseline_color, axis_limits):
        for i in range(len(files)):
            analysis = Analysis(files[i], z_limit, z_checking, baseline, json.loads(color_regions_dict), default_color, dpi, baseline_color, axis_limits)
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

    @Slot()
    def destroy_new_region_error_msg(self):
        error_message = ErrorMessage()
        error_message.start()

class StartingAnimation(Thread):
    def run(self):
        time.sleep(backend.starting_animation_time)
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

class ErrorMessage(Thread):
    def run(self):
        time.sleep(1)
        backend.destroyMsg.emit()

if __name__ == "__main__":
    QtCore.QCoreApplication.setAttribute(QtCore.Qt.AA_ShareOpenGLContexts)
    app = QGuiApplication(sys.argv)
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
