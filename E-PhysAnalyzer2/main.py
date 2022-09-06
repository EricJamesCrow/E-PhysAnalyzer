# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
import time

from PySide6 import QtCore
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QGuiApplication
from PySide6.QtCore import QObject, Slot, Signal
from threading import *

class Backend(QObject):
    addObject = Signal(str)
    animateObject = Signal(int)
    newRegion = Signal(str, str)
    destroyMsg = Signal()  

    @Slot()
    def run_starting_animation(self):
        starting_animation = StartingAnimation()
        starting_animation.start()

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
        time.sleep(0.2)
        for i in range(9):
            time.sleep(0.1)
            backend.animateObject.emit(i)

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
    engine = QQmlApplicationEngine()
    backend = Backend()
    engine.rootContext().setContextProperty("backend", backend)
    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
