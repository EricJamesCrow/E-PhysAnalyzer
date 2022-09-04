# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
import time

from PySide6 import QtCore
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot, Signal
from threading import *

class Backend(QObject):
    addObject = Signal(str)

    @Slot(list)
    def create_objects(self, selected_files):
        input_fields = InputFields(self, selected_files)
        input_fields.start()

class InputFields(Thread):
    def __init__(self, backend, selected_files):
        super(InputFields, self).__init__()
        self.backend = backend
        self.selected_files = selected_files

    def run(self):
        for i in range(len(self.selected_files)):
            time.sleep(0.03)
            self.backend.addObject.emit(self.selected_files[i])

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
