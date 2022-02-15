import os
from PyQt6 import QtCore, QtGui, QtWidgets
from PySide6.QtCore import Qt
from PySide6.QtWidgets import QFileDialog, QMessageBox
from FileAnalysis import MainProgram
from ColorSelection import ColorSelectionWindow
from ReadThis import Ui_ReadMe
import subprocess
import datetime


class EphysAnalyzer(object):
    def __init__(self):
        self.fileName = []
        self.drugAdded = []
        self.whenDrug = []
        self.excludedTraces = []
        self.colorCode = True
        self.colorCodes = ['gray', 'black', 'gray', 'purple', 'green', 'blue', 'orange', 'red']
        QtGui.QFontDatabase.addApplicationFont(os.path.abspath("GILC____.ttf"))
        self.font = "Gill Sans MT Condensed"
        self.dpi = 300
        self.baseline = True
        self.baseline_color = "gray"
        self.z_limit = 2.5
        self.z_checking = True
        self.z_works = True

    def setupUi(self, MainWindow):
        self.MainWindow = MainWindow
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 620)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.ephysAnalyzText = QtWidgets.QLabel(self.centralwidget)
        self.ephysAnalyzText.setGeometry(QtCore.QRect(265, 0, 330, 91))
        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(46)
        self.ephysAnalyzText.setFont(font)
        self.ephysAnalyzText.setObjectName("label")

        self.browseFilesButton = QtWidgets.QPushButton(self.centralwidget)
        self.browseFilesButton.setGeometry(QtCore.QRect(50, 80, 141, 51))
        self.browseFilesButton.setObjectName("pushButton")
        font.setPointSize(14)
        self.browseFilesButton.setFont(font)

        self.runButton = QtWidgets.QPushButton(self.centralwidget)
        self.runButton.setGeometry(QtCore.QRect(280, 480, 241, 81))
        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(36)
        self.runButton.setFont(font)
        self.runButton.setObjectName("pushButton_2")

        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(14)
        self.fileSelectedLabel = QtWidgets.QLabel(self.centralwidget)
        self.fileSelectedLabel.setGeometry(QtCore.QRect(220, 80, 300, 70))
        self.fileSelectedLabel.setFont(font)
        self.fileSelectedLabel.setObjectName("label_5")

        font.setPointSize(9)

        self.checkBox = QtWidgets.QCheckBox(self.centralwidget)
        self.checkBox.setGeometry(QtCore.QRect(680, 190, 91, 20))
        self.checkBox.setObjectName("checkBox")
        self.checkBox.setFont(font)
        self.checkBox.setChecked(True)
        self.checkBox.stateChanged.connect(self.clickBox)

        self.showColors = QtWidgets.QPushButton(self.centralwidget)
        self.showColors.setGeometry(QtCore.QRect(670, 210, 81, 24))
        self.showColors.setObjectName("pushButton_3")
        self.showColors.setFont(font)
        self.showColors.show()

        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 22))
        self.menubar.setObjectName("menubar")
        self.menuFile = QtWidgets.QMenu(self.menubar)
        self.menuFile.setObjectName("menuFile")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)


        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

        # easy copy/paste
        self.ui_functions()

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "E-Phys Analyzer"))
        self.ephysAnalyzText.setText(_translate("MainWindow", "E-Phys Analyzer"))
        self.browseFilesButton.setText(_translate("MainWindow", "Browse Files"))

        self.runButton.setText(_translate("MainWindow", "RUN"))
        self.fileSelectedLabel.setText(_translate("MainWindow", "<html><head/><body><p><span style=\" color:#ff0000;\"></span></p></body></html>"))

        self.runButton.setShortcut(_translate("MainWindow", "Return"))

        self.checkBox.setText(_translate("MainWindow", "Color Code"))
        self.showColors.setText(_translate("MainWindow", "Show Colors"))

##########################################################################################################################
    def more_ui_variables(self, MainWindow):
        self.fileLabel = QtWidgets.QLabel(MainWindow)
        self.fileLabel.setGeometry(QtCore.QRect(70, 135, 31, 51))
        self.fileLabel.setText("Files")
        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(11)
        self.fileLabel.setFont(font)
        self.fileLabel.setObjectName("filesLabel")
        self.fileLabel.hide()

        self.drugAddedLabel2 = QtWidgets.QLabel(MainWindow)
        self.drugAddedLabel2.setGeometry(QtCore.QRect(175, 135, 91, 51))
        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(11)
        self.drugAddedLabel2.setFont(font)
        self.drugAddedLabel2.setObjectName("drugAddedLabel")
        self.drugAddedLabel2.setText("Drug Name")
        self.drugAddedLabel2.hide()

        self.traceNumberLabel = QtWidgets.QLabel(MainWindow)
        self.traceNumberLabel.setGeometry(QtCore.QRect(255, 135, 101, 51))
        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(11)
        self.traceNumberLabel.setFont(font)
        self.traceNumberLabel.setObjectName("traceNumberLabel")
        self.traceNumberLabel.setText("Trace Number")
        self.traceNumberLabel.hide()

        self.excludedTraceLabel2 = QtWidgets.QLabel(MainWindow)
        self.excludedTraceLabel2.setGeometry(QtCore.QRect(360, 135, 111, 51))
        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(11)
        self.excludedTraceLabel2.setFont(font)
        self.excludedTraceLabel2.setObjectName("excludedTracesLabel")
        self.excludedTraceLabel2.setText("Excluded Traces")
        self.excludedTraceLabel2.hide()

        self.timeLabel = QtWidgets.QLabel(MainWindow)
        self.timeLabel.setGeometry(QtCore.QRect(477, 200, 111, 22))
        self.timeLabel.setFont(font)
        self.timeLabel.setObjectName("timeLabel")
        self.timeLabel.setText("Time (min)")
        self.timeLabel.show()

        self.checkBox2 = QtWidgets.QCheckBox(self.centralwidget)
        self.checkBox2.setGeometry(QtCore.QRect(670, 310, 91, 20))
        self.checkBox2.setObjectName("checkBox")
        self.checkBox2.setFont(font)
        self.checkBox2.setChecked(True)
        self.checkBox2.stateChanged.connect(self.displayBaseline)

        self.baselineColorEntry = QtWidgets.QLineEdit(MainWindow)
        self.baselineColorEntry.setGeometry(QtCore.QRect(670, 330, 91, 20))
        self.baselineColorEntry.setObjectName("graphEntry6")
        self.baselineColorEntry.setPlaceholderText("Baseline color")
        self.baselineColorEntry.setFont(font)

        font.setPointSize(9)
        self.checkBox2Label = QtWidgets.QLabel(MainWindow)
        self.checkBox2Label.setGeometry(QtCore.QRect(690, 305, 111, 30))
        self.checkBox2Label.setFont(font)
        self.checkBox2Label.setObjectName("timeLabel")
        self.checkBox2Label.setText("Display Baseline")
        self.checkBox2Label.show()

        font.setPointSize(9)
        self.colorsComboBox = QtWidgets.QComboBox(self.centralwidget)
        self.colorsComboBox.setGeometry(QtCore.QRect(530, 190, 111, 22))
        self.colorsComboBox.setObjectName("comboBox")
        self.colorsComboBox.addItem("")
        self.colorsComboBox.addItem("")
        self.colorsComboBox.addItem("")
        _translate = QtCore.QCoreApplication.translate
        self.colorsComboBox.setItemText(0, _translate("MainWindow", "Default Colors"))
        self.colorsComboBox.setItemText(1, _translate("MainWindow", "Custom Colors"))
        self.colorsComboBox.setItemText(2, _translate("MainWindow", "Single Color"))
        self.colorsComboBox.setFont(font)
        self.colorsComboBox.show()

        self.fileSelectedLabel.setText(
            f"<html><head/><body><p><span style=\" color:#ff0000;\">Please select one or more .atf files for analysis.</span></p></body></html>")

    def graph_variables(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        self.graphLabel1 = QtWidgets.QLabel(MainWindow)
        self.graphLabel1.setGeometry(QtCore.QRect(480, 222, 60, 16))
        self.graphLabel1.setObjectName("graphLabel1")
        self.graphLabel2 = QtWidgets.QLabel(MainWindow)
        self.graphLabel2.setGeometry(QtCore.QRect(480, 242, 60, 16))
        self.graphLabel2.setObjectName("graphLabel2")
        self.graphLabel3 = QtWidgets.QLabel(MainWindow)
        self.graphLabel3.setGeometry(QtCore.QRect(480, 262, 49, 16))
        self.graphLabel3.setObjectName("graphLabel3")
        self.graphLabel4 = QtWidgets.QLabel(MainWindow)
        self.graphLabel4.setGeometry(QtCore.QRect(480, 282, 49, 16))
        self.graphLabel4.setObjectName("graphLabel4")
        self.graphLabel5 = QtWidgets.QLabel(MainWindow)
        self.graphLabel5.setGeometry(QtCore.QRect(480, 302, 49, 16))
        self.graphLabel5.setObjectName("graphLabel5")
        self.graphLabel6 = QtWidgets.QLabel(MainWindow)
        self.graphLabel6.setGeometry(QtCore.QRect(480, 322, 49, 16))
        self.graphLabel6.setObjectName("graphLabel6")
        self.graphLabel7 = QtWidgets.QLabel(MainWindow)
        self.graphLabel7.setGeometry(QtCore.QRect(480, 342, 49, 16))
        self.graphLabel7.setObjectName("graphLabel7")
        self.graphLabel8 = QtWidgets.QLabel(MainWindow)
        self.graphLabel8.setGeometry(QtCore.QRect(480, 362, 49, 16))
        self.graphLabel8.setObjectName("graphLabel8")
        self.graphEntry0 = QtWidgets.QLineEdit(MainWindow)
        self.graphEntry0.setGeometry(QtCore.QRect(530, 220, 113, 20))
        self.graphEntry0.setObjectName("graphEntry1")
        self.graphEntry1 = QtWidgets.QLineEdit(MainWindow)
        self.graphEntry1.setGeometry(QtCore.QRect(530, 240, 113, 20))
        self.graphEntry1.setObjectName("graphEntry2")
        self.graphEntry2 = QtWidgets.QLineEdit(MainWindow)
        self.graphEntry2.setGeometry(QtCore.QRect(530, 260, 113, 20))
        self.graphEntry2.setObjectName("graphEntry3")
        self.graphEntry3 = QtWidgets.QLineEdit(MainWindow)
        self.graphEntry3.setGeometry(QtCore.QRect(530, 280, 113, 20))
        self.graphEntry3.setObjectName("graphEntry4")
        self.graphEntry4 = QtWidgets.QLineEdit(MainWindow)
        self.graphEntry4.setGeometry(QtCore.QRect(530, 300, 113, 20))
        self.graphEntry4.setObjectName("graphEntry5")
        self.graphEntry5 = QtWidgets.QLineEdit(MainWindow)
        self.graphEntry5.setGeometry(QtCore.QRect(530, 320, 113, 20))
        self.graphEntry5.setObjectName("graphEntry6")
        self.graphEntry6 = QtWidgets.QLineEdit(MainWindow)
        self.graphEntry6.setGeometry(QtCore.QRect(530, 340, 113, 20))
        self.graphEntry6.setObjectName("graphEntry7")
        self.graphEntry7 = QtWidgets.QLineEdit(MainWindow)
        self.graphEntry7.setGeometry(QtCore.QRect(530, 360, 113, 20))
        self.graphEntry7.setObjectName("graphEntry8")

        self.graphLabel1.setText(_translate("MainWindow", "(-10) - (-6)"))
        self.graphLabel2.setText(_translate("MainWindow", " (-5) - (-1)"))
        self.graphLabel3.setText(_translate("MainWindow", "   0 - 4"))
        self.graphLabel4.setText(_translate("MainWindow", "   5 - 9"))
        self.graphLabel5.setText(_translate("MainWindow", " 10 - 14"))
        self.graphLabel6.setText(_translate("MainWindow", " 15 - 19"))
        self.graphLabel7.setText(_translate("MainWindow", " 20 - 24"))
        self.graphLabel8.setText(_translate("MainWindow", " 25 - 30"))
        self.graphEntry0.setText("gray")
        self.graphEntry1.setText("black")
        self.graphEntry2.setText("gray")
        self.graphEntry3.setText("purple")
        self.graphEntry4.setText("green")
        self.graphEntry5.setText("blue")
        self.graphEntry6.setText("orange")
        self.graphEntry7.setText("red")

        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(10)

        self.graphLabel1.setFont(font)
        self.graphLabel2.setFont(font)
        self.graphLabel3.setFont(font)
        self.graphLabel4.setFont(font)
        self.graphLabel5.setFont(font)
        self.graphLabel6.setFont(font)
        self.graphLabel7.setFont(font)
        self.graphLabel8.setFont(font)
        font.setPointSize(11)
        self.graphEntry0.setFont(font)
        self.graphEntry1.setFont(font)
        self.graphEntry2.setFont(font)
        self.graphEntry3.setFont(font)
        self.graphEntry4.setFont(font)
        self.graphEntry5.setFont(font)
        self.graphEntry6.setFont(font)
        self.graphEntry7.setFont(font)

        self.colorsComboBox.setGeometry(QtCore.QRect(530, 190, 111, 22))

        self.colorsComboBox.activated.connect(self.graphColors)

        self.saveButton = QtWidgets.QPushButton(self.centralwidget)
        self.saveButton.setGeometry(QtCore.QRect(675, 360, 75, 24))
        self.saveButton.setObjectName("pushButton_4")

        self.saveButton.setText(_translate("MainWindow", "Save"))
        self.saveButton.setFont(font)
        self.saveButton.show()

        self.saveButton.clicked.connect(self.saveColorConfig)

        self.resetButton = QtWidgets.QPushButton(self.centralwidget)
        self.resetButton.setGeometry(QtCore.QRect(675, 390, 75, 24))
        self.resetButton.setObjectName("pushButton_4")

        self.resetButton.setText(_translate("MainWindow", "Reset"))
        self.resetButton.setFont(font)
        self.resetButton.show()

        self.resetButton.clicked.connect(self.delColorConfig)

        self.graphEntryOne = QtWidgets.QLineEdit(MainWindow)
        self.graphEntryOne.setGeometry(QtCore.QRect(530, 220, 113, 20))
        self.graphEntryOne.setObjectName("graphEntryOne")
        self.graphEntryOne.hide()
        self.graphEntryOne.setFont(font)

    def box(self):
        self.boxLineBottom = QtWidgets.QFrame(self.centralwidget)
        self.boxLineBottom.setGeometry(QtCore.QRect(463, 410, 324, 21))
        palette = QtGui.QPalette()
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ToolTipText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(240, 240, 240))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(227, 227, 227))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(160, 160, 160))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(160, 160, 160))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(240, 240, 240))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(105, 105, 105))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(245, 245, 245))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ToolTipText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(245, 245, 245))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ToolTipText, brush)
        self.boxLineBottom.setPalette(palette)
        self.boxLineBottom.setLineWidth(0)
        self.boxLineBottom.setMidLineWidth(3)
        self.boxLineBottom.setFrameShape(QtWidgets.QFrame.Shape.HLine)
        self.boxLineBottom.setFrameShadow(QtWidgets.QFrame.Shadow.Sunken)
        self.boxLineBottom.setObjectName("boxLineBottom")
        self.boxLineLeft = QtWidgets.QFrame(self.centralwidget)
        self.boxLineLeft.setGeometry(QtCore.QRect(450, 150, 31, 271))
        palette = QtGui.QPalette()
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ToolTipText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(240, 240, 240))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(227, 227, 227))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(160, 160, 160))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(160, 160, 160))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(240, 240, 240))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(105, 105, 105))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(245, 245, 245))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ToolTipText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(245, 245, 245))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ToolTipText, brush)
        self.boxLineLeft.setPalette(palette)
        self.boxLineLeft.setLineWidth(0)
        self.boxLineLeft.setMidLineWidth(3)
        self.boxLineLeft.setFrameShape(QtWidgets.QFrame.Shape.VLine)
        self.boxLineLeft.setFrameShadow(QtWidgets.QFrame.Shadow.Sunken)
        self.boxLineLeft.setObjectName("boxLineLeft")
        self.boxLineRight = QtWidgets.QFrame(self.centralwidget)
        self.boxLineRight.setGeometry(QtCore.QRect(770, 150, 31, 271))
        palette = QtGui.QPalette()
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ToolTipText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(240, 240, 240))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(227, 227, 227))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(160, 160, 160))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(160, 160, 160))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(240, 240, 240))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(105, 105, 105))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(245, 245, 245))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ToolTipText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(245, 245, 245))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ToolTipText, brush)
        self.boxLineRight.setPalette(palette)
        self.boxLineRight.setLineWidth(0)
        self.boxLineRight.setMidLineWidth(3)
        self.boxLineRight.setFrameShape(QtWidgets.QFrame.Shape.VLine)
        self.boxLineRight.setFrameShadow(QtWidgets.QFrame.Shadow.Sunken)
        self.boxLineRight.setObjectName("boxLineRight")
        self.boxLineTop = QtWidgets.QFrame(self.centralwidget)
        self.boxLineTop.setGeometry(QtCore.QRect(463, 140, 324, 21))
        palette = QtGui.QPalette()
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Active, QtGui.QPalette.ColorRole.ToolTipText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(240, 240, 240))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(227, 227, 227))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(160, 160, 160))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(160, 160, 160))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(240, 240, 240))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(105, 105, 105))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(245, 245, 245))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Inactive, QtGui.QPalette.ColorRole.ToolTipText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.WindowText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Button, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Light, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Midlight, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Dark, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Mid, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Text, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.BrightText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ButtonText, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.Shadow, brush)
        brush = QtGui.QBrush(QtGui.QColor(245, 245, 245))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.AlternateBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 220))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ToolTipBase, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0))
        brush.setStyle(QtCore.Qt.BrushStyle.SolidPattern)
        palette.setBrush(QtGui.QPalette.ColorGroup.Disabled, QtGui.QPalette.ColorRole.ToolTipText, brush)
        self.boxLineTop.setPalette(palette)
        self.boxLineTop.setLineWidth(0)
        self.boxLineTop.setMidLineWidth(3)
        self.boxLineTop.setFrameShape(QtWidgets.QFrame.Shape.HLine)
        self.boxLineTop.setFrameShadow(QtWidgets.QFrame.Shadow.Sunken)
        self.boxLineTop.setObjectName("boxLineTop")


    def evenMoreVariables(self):
        _translate = QtCore.QCoreApplication.translate
        self.graphQualityComboBox = QtWidgets.QComboBox(self.centralwidget)
        self.graphQualityComboBox.setGeometry(QtCore.QRect(660, 260, 111, 22))
        font = QtGui.QFont()
        font.setFamily(self.font)
        self.graphQualityComboBox.setFont(font)
        self.graphQualityComboBox.setObjectName("graphQualityComboBox")
        self.graphQualityComboBox.addItem("")
        self.graphQualityComboBox.addItem("")
        self.graphQualityComboBox.addItem("")
        self.graphQualityComboBox.addItem("")
        self.graphQualityComboBox.addItem("")

        self.graphQualityComboBox.setCurrentIndex(1)

        self.graphQualityLabel = QtWidgets.QLabel(self.centralwidget)
        self.graphQualityLabel.setGeometry(QtCore.QRect(690, 240, 91, 20))
        font = QtGui.QFont()
        font.setFamily(self.font)
        self.graphQualityLabel.setFont(font)
        self.graphQualityLabel.setObjectName("graphQualityLabel")


        self.customEditDPI = QtWidgets.QLineEdit(self.centralwidget)
        self.customEditDPI.setGeometry(QtCore.QRect(680, 285, 61, 21))
        font = QtGui.QFont()
        font.setFamily(self.font)

        self.customEditDPI.setFont(font)
        self.customEditDPI.setObjectName("customEditDPI")
        self.customEditDPI.hide()


        self.dpiLabel = QtWidgets.QLabel(self.centralwidget)
        self.dpiLabel.setGeometry(QtCore.QRect(750, 288, 31, 16))
        font = QtGui.QFont()
        font.setFamily(self.font)

        self.dpiLabel.setFont(font)
        self.dpiLabel.setObjectName("dpiLabel")
        self.dpiLabel.hide()

        self.graphSettingsLabel = QtWidgets.QLabel(self.centralwidget)
        self.graphSettingsLabel.setGeometry(QtCore.QRect(575, 155, 151, 30))
        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(18)
        self.graphSettingsLabel.setFont(font)
        self.graphSettingsLabel.setObjectName("graphSettingsLabel")

        self.graphQualityComboBox.setItemText(0, _translate("MainWindow", "Low"))
        self.graphQualityComboBox.setItemText(1, _translate("MainWindow", "Medium"))
        self.graphQualityComboBox.setItemText(2, _translate("MainWindow", "High"))
        self.graphQualityComboBox.setItemText(3, _translate("MainWindow", "Ultra"))
        self.graphQualityComboBox.setItemText(4, _translate("MainWindow", "Custom"))
        self.graphQualityLabel.setText(_translate("MainWindow", "Graph Quality"))
        self.dpiLabel.setText(_translate("MainWindow", "DPI"))
        self.graphSettingsLabel.setText(_translate("MainWindow", "Graph Settings"))
        self.graphQualityComboBox.activated.connect(self.graphQuality)
        font.setPointSize(12)
        self.clearValuesButton = QtWidgets.QPushButton(self.centralwidget)
        self.clearValuesButton.setGeometry(QtCore.QRect(90, 508, 75, 24))
        self.clearValuesButton.setObjectName("clearValuesButton")
        self.clearValuesButton.setText(_translate("MainWindow", "Clear Files"))
        self.clearValuesButton.setFont(font)
        self.clearValuesButton.clicked.connect(self.clear_button)

        self.readMeButton = QtWidgets.QPushButton(self.centralwidget)
        self.readMeButton.setGeometry(QtCore.QRect(660, 60, 75, 24))
        self.readMeButton.setObjectName("readMeButton")
        self.readMeButton.setText(_translate("MainWindow", "README"))
        self.readMeButton.setFont(font)
        self.readMeButton.clicked.connect(self.show_read_me)

        self.emailsLabel = QtWidgets.QLabel(self.centralwidget)
        self.emailsLabel.setGeometry(QtCore.QRect(287, 583, 400, 16))
        self.emailsLabel.setObjectName("emailsLabel")
        self.emailsLabel.setText(_translate("MainWindow", "cameron.cordero@wsu.edu / EricCrow@pm.me"))
        self.emailsLabel.setFont(font)

        self.copyrightLabel = QtWidgets.QLabel(self.centralwidget)
        self.copyrightLabel.setGeometry(QtCore.QRect(240, 566, 400, 16))
        self.copyrightLabel.setObjectName("copyrightLabel")
        self.copyrightLabel.setText(_translate("MainWindow", "Copyright (c) 2022 Cameron Cordero / Copyright (c) 2022 Eric Crow"))
        self.copyrightLabel.setFont(font)

        self.outliersCheckBox = QtWidgets.QCheckBox(self.centralwidget)
        self.outliersCheckBox.setGeometry(QtCore.QRect(540, 380, 111, 20))
        self.outliersCheckBox.setObjectName("outliersCheckBox")
        self.outliersCheckBox.setText(_translate("MainWindow", "Remove Outliers"))
        self.outliersCheckBox.setChecked(True)
        self.outliersCheckBox.stateChanged.connect(self.displayOutliersSlider)
        font.setPointSize(11)
        self.outliersCheckBox.setFont(font)

        self.zScoreEntryBox = QtWidgets.QLineEdit(self.centralwidget)
        self.zScoreEntryBox.setGeometry(QtCore.QRect(580, 400, 61, 16))
        self.zScoreEntryBox.setObjectName("zScoreEntryBox")
        self.zScoreEntryBox.setFont(font)
        self.zScoreEntryBox.setPlaceholderText("2.5")

        self.zScoreLabel = QtWidgets.QLabel(self.centralwidget)
        self.zScoreLabel.setGeometry(QtCore.QRect(530, 400, 61, 16))
        self.zScoreLabel.setObjectName("zScoreLabel")
        self.zScoreLabel.setText(_translate("MainWindow", "Z-Score >"))
        self.zScoreLabel.setFont(font)



########################################################################################################################
    def grabZscore(self):
        self.z_works = True
        if self.zScoreEntryBox.text() != '':
            try:
                self.z_limit = float(self.zScoreEntryBox.text().strip())
                return self.z_limit
            except:
                self.z_works = False
                return self.z_works
        else:
            pass

    def displayOutliersSlider(self, state):
        if state == Qt.Checked:
            self.zScoreEntryBox.show()
            self.zScoreLabel.show()
            self.z_checking = True
        else:
            self.zScoreEntryBox.hide()
            self.zScoreLabel.hide()
            self.z_checking = False

    def displayBaseline(self, state):
        if state == Qt.Checked:
            self.baseline = True
            self.baselineColorEntry.show()
        else:
            self.baseline = False
            self.baselineColorEntry.hide()

    def graphQuality(self):
        if self.graphQualityComboBox.currentText() == "Low":
            self.hideDpiStuff()
            self.dpi = 100
        elif self.graphQualityComboBox.currentText() == "Medium":
            self.hideDpiStuff()
            self.dpi = 300
        elif self.graphQualityComboBox.currentText() == "High":
            self.hideDpiStuff()
            self.dpi = 600
        elif self.graphQualityComboBox.currentText() == "Ultra":
            self.hideDpiStuff()
            self.dpi = 1000
        elif self.graphQualityComboBox.currentText() == "Custom":
            self.showDpiStuff()

    def grabCustomDpi(self):
        self.dpi = self.customEditDPI.text().strip()
        if self.dpi == '':
            self.dpi = 300


    def hideDpiStuff(self):
        self.dpiLabel.hide()
        self.customEditDPI.hide()

    def showDpiStuff(self):
        self.dpiLabel.show()
        self.customEditDPI.show()

    def delColorConfig(self):
        try:
            os.remove("config.txt")
            os.remove("dpi.txt")
        except:
            pass
        self.zScoreEntryBox.clear()
        self.outliersCheckBox.setChecked(True)
        self.z_limit = 2.5
        self.z_checking = True
        self.graphEntryOne.hide()
        self.graphEntryOne.clear()
        self.showGraphs()
        self.setDefaultColorValues()
        self.colorsComboBox.setCurrentIndex(0)
        self.graphQualityComboBox.setCurrentIndex(1)
        self.dpiLabel.hide()
        self.customEditDPI.hide()
        self.checkBox.setChecked(True)
        self.checkBox2.setChecked(True)
        self.baselineColorEntry.clear()
        self.customEditDPI.clear()
        self.dpi = 300
        self.msg3 = QMessageBox()
        self.msg3.setWindowTitle("Successful!")
        self.msg3.setText("Configurations reset!")
        self.msg3.setStandardButtons(QMessageBox.Ok)
        x = self.msg3.exec()
        

    def saveColorConfig(self):
        self.grabColors()
        self.grabCustomDpi()
        self.grabBaselineColor()
        mP = MainProgram()
        try:
            self.grabZscore()
            mP.check_graphs(self.colorCodes)
            mP.check_baseline(self.baseline_color)
            if (isinstance(self.dpi, int) or self.dpi.isnumeric()) and self.z_works != False:
                self.msg = QMessageBox()
                self.msg.setWindowTitle("Successful!")
                self.msg.setText("Configurations saved!")
                self.msg.setStandardButtons(QMessageBox.Ok)
                with open("config.txt", "w") as config:
                    for i in self.colorCodes:
                        config.writelines(f"{i}\n")
                self.setColorConfig()
                with open("dpi.txt", "w") as dpi:
                    if self.graphQualityComboBox.currentText() == "Custom":
                        self.grabCustomDpi()
                        dpi.writelines(str(self.dpi)+"\n")
                    else:
                        dpi.writelines(str(self.dpi)+"\n")
                    if self.baseline == False:
                        dpi.writelines("False\n")
                        dpi.writelines(f"{self.baseline_color}\n")
                    elif self.baseline == True:
                        dpi.writelines("True\n")
                        if self.baselineColorEntry.text() != '' and not self.baselineColorEntry.text().isnumeric():
                            dpi.writelines(f"{self.baselineColorEntry.text().strip().lower()}\n")
                        else:
                            dpi.writelines("gray\n")
                    if self.colorCode == False:
                        dpi.writelines("False\n")
                    elif self.colorCode == True:
                        dpi.writelines("True\n")
                    if self.z_checking == True:
                        dpi.writelines("True\n")
                        dpi.writelines(f"{self.z_limit}\n")
                    elif self.z_checking == False:
                        dpi.writelines("False\n")
                        dpi.writelines(f"{self.z_limit}\n")

                x = self.msg.exec()
            else:
                self.second_failure_pop_up()
        except:
            self.second_failure_pop_up()

    def setColorConfig(self):
        with open("config.txt", "r") as config:
            self.colorCodes = []
            for i in config.readlines():
                self.colorCodes.append(i.replace('\n', ''))
        if self.colorCodes[0] == self.colorCodes[-1]:
            self.colorsComboBox.setCurrentIndex(2)
            self.graphEntryOne.setText(f"{self.colorCodes[0]}")
            self.hideGraphs()
            self.graphEntryOne.show()
        else:
            self.colorsComboBox.setCurrentIndex(1)
            self.graphEntry0.setText(f"{self.colorCodes[0]}")
            self.graphEntry1.setText(f"{self.colorCodes[1]}")
            self.graphEntry2.setText(f"{self.colorCodes[2]}")
            self.graphEntry3.setText(f"{self.colorCodes[3]}")
            self.graphEntry4.setText(f"{self.colorCodes[4]}")
            self.graphEntry5.setText(f"{self.colorCodes[5]}")
            self.graphEntry6.setText(f"{self.colorCodes[6]}")
            self.graphEntry7.setText(f"{self.colorCodes[7]}")


    def loadDpiConfig(self):
        with open("dpi.txt", "r") as dpi:
            newDpi = int(dpi.readline().replace("\n", ""))
            if newDpi == 100:
                self.graphQualityComboBox.setCurrentIndex(0)
                self.dpi = 100
            elif newDpi == 300:
                self.graphQualityComboBox.setCurrentIndex(1)
                self.dpi = 300
            elif newDpi == 600:
                self.graphQualityComboBox.setCurrentIndex(2)
                self.dpi = 600
            elif newDpi == 1000:
                self.graphQualityComboBox.setCurrentIndex(3)
                self.dpi = 1000
            else:
                self.graphQualityComboBox.setCurrentIndex(4)
                self.customEditDPI.show()
                self.dpiLabel.show()
                self.customEditDPI.setText(f"{newDpi}")
            secondLine = dpi.readline()
            thirdLine = dpi.readline()
            fourthLine = dpi.readline()
            fifthLine = dpi.readline()
            sixthLine = dpi.readline()
            if secondLine == "True\n":
                self.baseline = True
                self.baseline_color = thirdLine.replace("\n", "")
                if thirdLine != "gray\n":
                    self.baselineColorEntry.setText(f"{self.baseline_color}")
            else:
                self.baseline = False
                self.checkBox2.setChecked(False)
            if fourthLine == "True\n":
                self.checkBox.setChecked(True)
            else:
                self.checkBox.setChecked(False)
            if fifthLine == "True\n":
                self.outliersCheckBox.setChecked(True)
            else:
                self.outliersCheckBox.setChecked(False)
            self.z_limit = float(sixthLine.replace("\n", ""))
            self.zScoreEntryBox.setText(str(self.z_limit))


    def ui_functions(self):
        # easy to copy/paste for new UI
        self.browseFilesButton.clicked.connect(self.get_filename)
        self.runButton.clicked.connect(self.run_the_program)
        self.showColors.clicked.connect(self.showColorsWindow)

    def clickBox(self, state):
        if state == Qt.Checked:
            self.colorCode = True
            self.showColors.show()
            self.colorsComboBox.show()
            self.showGraphs()
            self.graphEntryOne.hide()
        else:
            self.colorCode = False
            self.showColors.hide()
            self.colorsComboBox.hide()

            self.hideGraphs()

            self.colorsComboBox.setCurrentIndex(0)
            self.graphEntryOne.hide()

            self.setDefaultColorValues()

    def showGraphs(self):
        self.graphLabel1.show()
        self.graphLabel2.show()
        self.graphLabel3.show()
        self.graphLabel4.show()
        self.graphLabel5.show()
        self.graphLabel6.show()
        self.graphLabel7.show()
        self.graphLabel8.show()

        self.graphEntry0.show()
        self.graphEntry1.show()
        self.graphEntry2.show()
        self.graphEntry3.show()
        self.graphEntry4.show()
        self.graphEntry5.show()
        self.graphEntry6.show()
        self.graphEntry7.show()
        self.timeLabel.show()

    def hideGraphs(self):
        self.graphLabel1.hide()
        self.graphLabel2.hide()
        self.graphLabel3.hide()
        self.graphLabel4.hide()
        self.graphLabel5.hide()
        self.graphLabel6.hide()
        self.graphLabel7.hide()
        self.graphLabel8.hide()

        self.graphEntry0.hide()
        self.graphEntry1.hide()
        self.graphEntry2.hide()
        self.graphEntry3.hide()
        self.graphEntry4.hide()
        self.graphEntry5.hide()
        self.graphEntry6.hide()
        self.graphEntry7.hide()
        self.timeLabel.hide()


    def setDefaultColorValues(self):
        self.graphEntry0.setText("gray")
        self.graphEntry1.setText("black")
        self.graphEntry2.setText("gray")
        self.graphEntry3.setText("purple")
        self.graphEntry4.setText("green")
        self.graphEntry5.setText("blue")
        self.graphEntry6.setText("orange")
        self.graphEntry7.setText("red")

    def clearGraphs(self):
        self.graphEntry0.clear()
        self.graphEntry1.clear()
        self.graphEntry2.clear()
        self.graphEntry3.clear()
        self.graphEntry4.clear()
        self.graphEntry5.clear()
        self.graphEntry6.clear()
        self.graphEntry7.clear()
        self.graphEntry0.setText("")
        self.graphEntry1.setText("")
        self.graphEntry2.setText("")
        self.graphEntry3.setText("")
        self.graphEntry4.setText("")
        self.graphEntry5.setText("")
        self.graphEntry6.setText("")
        self.graphEntry7.setText("")

    def graphColors(self):
        if self.colorsComboBox.currentText() == "Default Colors":
            self.colorCodes = ['gray', 'black', 'gray', 'purple', 'green', 'blue', 'orange', 'red']
            self.clearGraphs()
            self.setDefaultColorValues()
            self.graphEntryOne.hide()
            self.showGraphs()
        elif self.colorsComboBox.currentText() == "Custom Colors":
            try:
                self.setColorConfig()
            except:
                pass
            self.colorsComboBox.setCurrentIndex(1)
            self.clearGraphs()
            self.showGraphs()
            self.graphEntryOne.hide()

        elif self.colorsComboBox.currentText() == "Single Color":
            self.hideGraphs()
            self.clearGraphs()
            self.graphEntryOne.show()

    def grabColors(self):
        if self.colorsComboBox.currentText() == "Single Color":
            self.colorCodes[0] = self.graphEntryOne.text().lower().strip() or "gray"
            self.colorCodes[1] = self.graphEntryOne.text().lower().strip() or "gray"
            self.colorCodes[2] = self.graphEntryOne.text().lower().strip() or "gray"
            self.colorCodes[3] = self.graphEntryOne.text().lower().strip() or "gray"
            self.colorCodes[4] = self.graphEntryOne.text().lower().strip() or "gray"
            self.colorCodes[5] = self.graphEntryOne.text().lower().strip() or "gray"
            self.colorCodes[6] = self.graphEntryOne.text().lower().strip() or "gray"
            self.colorCodes[7] = self.graphEntryOne.text().lower().strip() or "gray"
        else:
            self.colorCodes[0] = self.graphEntry0.text().lower().strip() or "gray"
            self.colorCodes[1] = self.graphEntry1.text().lower().strip() or "gray"
            self.colorCodes[2] = self.graphEntry2.text().lower().strip() or "gray"
            self.colorCodes[3] = self.graphEntry3.text().lower().strip() or "gray"
            self.colorCodes[4] = self.graphEntry4.text().lower().strip() or "gray"
            self.colorCodes[5] = self.graphEntry5.text().lower().strip() or "gray"
            self.colorCodes[6] = self.graphEntry6.text().lower().strip() or "gray"
            self.colorCodes[7] = self.graphEntry7.text().lower().strip() or "gray"

    def showColorsWindow(self):
        self.second_window = QtWidgets.QMainWindow()
        self.colorSelect = ColorSelectionWindow()
        self.colorSelect.setupUi(self.second_window)
        self.second_window.show()

    def show_read_me(self):
        self.read_me_window = QtWidgets.QMainWindow()
        self.read_me_class = Ui_ReadMe()
        self.read_me_class.setupUi(self.read_me_window)
        self.read_me_window.show()

    def clear_ui(self):
        # Clears the text in the Line Edit boxes
        self.fileSelectedLabel.setText("<html><head/><body><p><span style=\" color:#ff0000;\">Please select one or "
                                       "more .atf files for analysis.</span></p></body></html>")

    def clear_values(self):
        self.fileName = []
        self.drugAdded = []
        self.whenDrug = []
        self.excludedTraces = []

    def get_filename(self):
        # Select multiple files
        self.fileName, _ = QFileDialog.getOpenFileNames(
            None,
            "Select an ATF File",
            "",
            "ATF File (*.atf)"
        )
        if len(self.fileName) > 12:
            self.fileSelectedLabel.setText(
                f"<html><head/><body><p><span style=\" color:#ff0000;\">Please select one or more .atf files for analysis.</span></p></body></html>")
            self.failure_pop_up()
        elif len(self.fileName) > 1:
            self.fileSelectedLabel.setText(f"<html><head/><body><p><span style=\" color:#ff0000;\">Please input analysis data.</span></p></body></html>")
            self.clearAndNew(self.fileName)
            self.prevFiles = self.fileName

        elif len(self.fileName) == 1:
            self.fileSelectedLabel.setText(
                f"<html><head/><body><p><span style=\" color:#ff0000;\">Please input analysis data.</span></p></body></html>")
            self.clearAndNew(self.fileName)
            self.prevFiles = self.fileName
        else:
            self.fileSelectedLabel.setText(
                f"<html><head/><body><p><span style=\" color:#ff0000;\">Please select one or more .atf files for analysis.</span></p></body></html>")
            try:
                self.clearPrevFiles()
            except:
                pass

    def clearPrevFiles(self):
        self.fileLabel.hide()
        self.drugAddedLabel2.hide()
        self.traceNumberLabel.hide()
        self.excludedTraceLabel2.hide()
        for i in range(len(self.prevFiles)):
            globals()[f"self.filesLabel{i}"].clear()
            globals()[f"self.drugAddedEntry{i}"].clear()
            globals()[f"self.traceNumberEntry{i}"].clear()
            globals()[f"self.excludedTracesEntry{i}"].clear()
            globals()[f"self.filesLabel{i}"].hide()
            globals()[f"self.drugAddedEntry{i}"].hide()
            globals()[f"self.traceNumberEntry{i}"].hide()
            globals()[f"self.excludedTracesEntry{i}"].hide()

    def success_pop_up(self, path):
        self.msg = QMessageBox()
        self.msg.setWindowTitle("Successful!")
        self.msg.setText(f"Files saved in {path}!")
        self.msg.setTextInteractionFlags(Qt.TextSelectableByMouse|Qt.TextSelectableByKeyboard)
        self.msg.setStandardButtons(QMessageBox.Ok|QMessageBox.Open)
        self.msg.buttonClicked.connect(self.success_pop_up_buttons)
        x = self.msg.exec()

    def failure_pop_up(self):
        self.msg2 = QMessageBox()
        self.msg2.setIcon(QMessageBox.Critical)
        self.msg2.setWindowTitle("Error")
        if self.z_works == False:
            self.msg2.setText("Z-Score is not an integer or decimal value.")
        elif len(self.fileName) > 12:
            self.msg2.setText("Please only select a maximum of twelve files.")
            try:
                self.clearPrevFiles()
            except:
                pass
        elif self.fileName == []:
            self.msg2.setText("Choose a file.")
        elif ('' in self.drugAdded) and ('' in self.whenDrug):
            self.msg2.setText("Input your values.")
        elif '' in self.drugAdded:
            self.msg2.setText("Missing one or more values for the name of the drug.")
        elif '' in self.whenDrug:
            self.msg2.setText("Missing one or more values for the trace number.")
        elif any(len(self.whenDrug[i].strip().split(' ')) > 1 for i in range(len(self.whenDrug))):
            self.msg2.setText("Make sure you choose only one trace number.")
        elif any(not self.whenDrug[i].isdigit() for i in range(len(self.whenDrug))):
            self.msg2.setText("One or more values is not an integer for the trace number.")
        else:
            try:
                mP = MainProgram()
                mP.check_dpi(self.dpi)
                try:
                    mP.check_graphs(self.colorCodes)
                    try:
                        mP.check_baseline(self.baseline_color)
                    except:
                        self.msg2.setText('Baseline color is invalid.\n'
                                          'Click "Show Colors" to see a list of available colors.')
                except:
                    self.msg2.setText('One or more values in the graph settings is not valid.\n'
                              'Click "Show Colors" to see a list of available colors.')
            except:
                self.msg2.setText("DPI is not an integer.")
        self.msg2.setStandardButtons(QMessageBox.Ok)
        x = self.msg2.exec()

    def second_failure_pop_up(self):
        self.msg4 = QMessageBox()
        self.msg4.setIcon(QMessageBox.Critical)
        self.msg4.setWindowTitle("Error")
        mP = MainProgram()
        try:
            mP.check_graphs(self.colorCodes)
            try:
                mP.check_baseline(self.baseline_color)
                if self.z_works == False:
                    self.msg4.setText("Z-Score is not an integer or decimal value.")
                elif self.baselineColorEntry.text().isnumeric():
                    self.msg4.setText("Baseline color isn't a valid string.")
                elif any(i.isdigit() for i in self.colorCodes):
                    self.msg4.setText("One or more graph colors is not a valid string.")
                elif not self.dpi.isnumeric():
                    self.msg4.setText("DPI isn't an integer.")
            except:
                self.msg4.setText('Baseline color is invalid.\n'
                                          'Click "Show Colors" to see a list of available colors.')
        except:
            self.msg4.setText('One or more values in the graph settings is not valid.\n'
                              'Click "Show Colors" to see a list of available colors.')
        self.msg4.setStandardButtons(QMessageBox.Ok)
        x = self.msg4.exec()

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

###########################################################################################################################
    def clearAndNew(self, files):
        try:
            self.clearDynamicVariables()
            self.dynamic_variables(files)
        except:
            self.dynamic_variables(files)

    def dynamic_variables(self, files):
        self.fileLabel.show()
        self.drugAddedLabel2.show()
        self.traceNumberLabel.show()
        self.excludedTraceLabel2.show()
        self.fileName = files

        font = QtGui.QFont()
        font.setFamily(self.font)
        font.setPointSize(11)
        n = 135
        x = 150
        for i in range(len(self.fileName)):
            n += 25
            x += 25
            globals()[f"self.filesLabel{i}"] = QtWidgets.QLabel(self.MainWindow)
            globals()[f"self.filesLabel{i}"].setGeometry(QtCore.QRect(10, n, 150, 51))
            font.setBold(True)
            globals()[f"self.filesLabel{i}"].setFont(font)
            globals()[f"self.filesLabel{i}"].setObjectName(f'filesLabel{i}')
            globals()[f"self.filesLabel{i}"].setText(f"{os.path.basename(self.fileName[i])}")
            globals()[f"self.filesLabel{i}"].show()
            globals()[f"self.drugAddedEntry{i}"] = QtWidgets.QLineEdit(self.MainWindow)
            globals()[f"self.drugAddedEntry{i}"].setGeometry(QtCore.QRect(165, x, 71, 21))
            globals()[f"self.drugAddedEntry{i}"].setObjectName(f"drugAddedLineEdit{i}")
            globals()[f"self.drugAddedEntry{i}"].setFont(font)
            globals()[f"self.drugAddedEntry{i}"].show()
            globals()[f"self.traceNumberEntry{i}"] = QtWidgets.QLineEdit(self.MainWindow)
            globals()[f"self.traceNumberEntry{i}"].setGeometry(QtCore.QRect(250, x, 75, 21))
            globals()[f"self.traceNumberEntry{i}"].setObjectName(f"traceNumberLineEdit{i}")
            globals()[f"self.traceNumberEntry{i}"].setFont(font)
            globals()[f"self.traceNumberEntry{i}"].show()
            globals()[f"self.excludedTracesEntry{i}"] = QtWidgets.QLineEdit(self.MainWindow)
            globals()[f"self.excludedTracesEntry{i}"].setGeometry(QtCore.QRect(336, x, 121, 21))
            globals()[f"self.excludedTracesEntry{i}"].setObjectName(f"excludedTracesLineEdit{i}")
            globals()[f"self.excludedTracesEntry{i}"].setFont(font)
            globals()[f"self.excludedTracesEntry{i}"].show()

    def clearDynamicVariables(self):
        self.fileLabel.hide()
        self.drugAddedLabel2.hide()
        self.traceNumberLabel.hide()
        self.excludedTraceLabel2.hide()
        try:
            self.clearPrevFiles()
            for i in range(len(self.fileName)):
                globals()[f"self.filesLabel{i}"].clear()
                globals()[f"self.drugAddedEntry{i}"].clear()
                globals()[f"self.traceNumberEntry{i}"].clear()
                globals()[f"self.excludedTracesEntry{i}"].clear()
                globals()[f"self.filesLabel{i}"].hide()
                globals()[f"self.drugAddedEntry{i}"].hide()
                globals()[f"self.traceNumberEntry{i}"].hide()
                globals()[f"self.excludedTracesEntry{i}"].hide()
        except:
            for i in range(len(self.fileName)):
                globals()[f"self.filesLabel{i}"].clear()
                globals()[f"self.drugAddedEntry{i}"].clear()
                globals()[f"self.traceNumberEntry{i}"].clear()
                globals()[f"self.excludedTracesEntry{i}"].clear()
                globals()[f"self.filesLabel{i}"].hide()
                globals()[f"self.drugAddedEntry{i}"].hide()
                globals()[f"self.traceNumberEntry{i}"].hide()
                globals()[f"self.excludedTracesEntry{i}"].hide()

    def run_the_program(self):
        self.grabColors()
        self.drugAdded = []
        self.whenDrug = []
        self.excludedTraces = []
        for i in range(len(self.fileName)):
            self.drugAdded.append(globals()[f"self.drugAddedEntry{i}"].text())
            self.whenDrug.append(globals()[f"self.traceNumberEntry{i}"].text().strip())
            self.excludedTraces.append(list(globals()[f"self.excludedTracesEntry{i}"].text().split(" ")))
        if (any(len(self.whenDrug[i].strip().split(' ')) > 1 or not self.whenDrug[i].isdigit() for i in range(len(self.whenDrug)))):
            self.failure_pop_up()
        else:
            try:
                self.checkExcludedTraces(self.fileName, self.excludedTraces)
                self.grabZscore()
                if '' in self.drugAdded or '' in self.fileName or '' in self.whenDrug or self.z_works == False:
                    self.failure_pop_up()
                else:
                    try:
                        self.run(self.fileName, self.drugAdded, self.whenDrug, self.excludedTraces, self.colorCode,
                                 self.colorCodes)
                    except:
                        self.failure_pop_up()
            except:
                self.excluded_traces_failure_pop_up()

    def excluded_traces_failure_pop_up(self):
        self.msg5 = QMessageBox()
        self.msg5.setIcon(QMessageBox.Critical)
        self.msg5.setWindowTitle("Error")
        self.msg5.setText("One or more values is not an integer for the excluded traces.")
        self.msg5.setStandardButtons(QMessageBox.Ok)
        x = self.msg5.exec()

    def grabBaselineColor(self):
        self.baseline_color = self.baselineColorEntry.text().strip()
        if self.baseline_color == '':
            self.baseline_color = "gray"

    def checkExcludedTraces(self, files, excludedTraces):
        excludedTracesStripped = []
        exTracesInBaseline = []
        for i in range(len(files)):
            excludedTracesStripped = []
            for x in excludedTraces[i]:
                if x.strip():
                    excludedTracesStripped.append(x)
            x = list(map(int, excludedTracesStripped))

    def run(self, files, drugAdded, whenDrug, excludedTraces, colorCode, colorCodes):
        if self.graphQualityComboBox.currentText() == "Custom":
            self.grabCustomDpi()
        self.grabBaselineColor()
        mP = MainProgram()
        mP.check_dpi(self.dpi)
        mP.check_graphs(colorCodes)
        mP.check_baseline(self.baseline_color)
        self.grabZscore()
        mP.mkdir_outputs(files)
        for i in range(len(files)):
            self.excludedTracesStripped = []
            for x in excludedTraces[i]:
                if x.strip():
                    self.excludedTracesStripped.append(x)
            mP.mkdir(files[i])
            mP.analyze_data(files[i], drugAdded[i], int(whenDrug[i]), self.excludedTracesStripped, colorCode, colorCodes, self.z_limit, self.z_checking)
            mP.make_graphs(self.dpi, self.baseline, self.baseline_color)
        self.excludedTracesStripped = []

        base_name = os.path.basename(files[0])
        self.base_name_no_ext_outputs = os.path.splitext(base_name)[0]
        parent_dir = os.path.dirname(os.path.abspath(files[0]))
        directory = f"E-Phys Analyzer {datetime.date.today()} Results"
        path = os.path.join(parent_dir, directory)
        self.new_path = path
        if self.new_path == path:
            self.success_pop_up(path)

    def clear_button(self):
        self.clearDynamicVariables()
        self.clear_ui()
        self.clear_values()

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = EphysAnalyzer()
    ui.setupUi(MainWindow)
    ui.more_ui_variables(MainWindow)
    ui.graph_variables(MainWindow)
    ui.evenMoreVariables()
    ui.box()
    try:
        ui.setColorConfig()
        ui.loadDpiConfig()
    except:
        pass
    MainWindow.show()
    sys.exit(app.exec())