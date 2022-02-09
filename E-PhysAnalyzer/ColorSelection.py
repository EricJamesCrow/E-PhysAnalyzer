from PyQt6 import QtCore, QtGui, QtWidgets


class ColorSelectionWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 600)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.availableColors = QtWidgets.QLabel(self.centralwidget)
        self.availableColors.setGeometry(QtCore.QRect(40, 0, 711, 521))
        self.availableColors.setText("")
        self.availableColors.setPixmap(QtGui.QPixmap("configuration/available_colors.png"))
        self.availableColors.setScaledContents(True)
        self.availableColors.setObjectName("label")
        self.crText = QtWidgets.QLabel(self.centralwidget)
        self.crText.setGeometry(QtCore.QRect(60, 529, 761, 31))
        font = QtGui.QFont()
        font.setPointSize(7)
        self.crText.setFont(font)
        self.crText.setObjectName("label_2")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 22))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.colorButton = QtWidgets.QPushButton(self.centralwidget, clicked= lambda: self.close(MainWindow))
        self.colorButton.setGeometry(QtCore.QRect(370, 550, 75, 24))
        self.colorButton.setObjectName("pushButton")

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "Available Colors"))
        self.crText.setText(_translate("MainWindow", "© Copyright 2002 - 2012 John Hunter, Darren Dale, Eric Firing, Michael Droettboom and the Matplotlib development team; 2012 - 2021 The Matplotlib development team.\n"
"Created using Sphinx 4.3.0."))
        self.colorButton.setText(_translate("MainWindow", "Close"))

    def close(self, MainWindow):
        MainWindow.close()

