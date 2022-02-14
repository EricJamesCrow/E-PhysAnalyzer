from PyQt6 import QtCore, QtWidgets
import os


class Ui_ReadMe(object):
    def setupUi(self, ReadMe):
        ReadMe.setObjectName("ReadMe")
        ReadMe.resize(800, 600)
        self.centralwidget = QtWidgets.QWidget(ReadMe)
        self.centralwidget.setObjectName("centralwidget")
        self.textBrowser = QtWidgets.QTextBrowser(self.centralwidget)
        self.textBrowser.setGeometry(QtCore.QRect(0, 0, 801, 551))
        self.textBrowser.setObjectName("textBrowser")
        ReadMe.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(ReadMe)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 22))
        self.menubar.setObjectName("menubar")
        ReadMe.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(ReadMe)
        self.statusbar.setObjectName("statusbar")
        ReadMe.setStatusBar(self.statusbar)

        self.retranslateUi(ReadMe)
        QtCore.QMetaObject.connectSlotsByName(ReadMe)

    def retranslateUi(self, ReadMe):
        _translate = QtCore.QCoreApplication.translate
        ReadMe.setWindowTitle(_translate("ReadMe", "README"))
        with open(os.path.abspath('../README.md')) as x:
            self.textBrowser.setMarkdown(x.read())
        self.close_button = QtWidgets.QPushButton(self.centralwidget, clicked= lambda: self.close(ReadMe))
        self.close_button.setGeometry(QtCore.QRect(370, 555, 75, 24))
        self.close_button.setObjectName("pushButton")
        self.close_button.setText(_translate("ReadMe", "Close"))

    def close(self, ReadMe):
        ReadMe.close()