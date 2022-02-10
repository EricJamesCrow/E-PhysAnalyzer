from setuptools import setup

REQUIREMENTS = ["PyQt6",
		"PySide6",
		"seaborn",
		"pandas",
		"matplotlib"
                ]

setup(
    name='E-PhysAnalyzer',
    version='0.1.7',
    packages=['E-PhysAnalyzer'],
    url='https://github.com/EricJamesCrow/E-PhysAnalyzer',
    license='MIT',
    author='Cameron Cordero / Eric Crow',
    author_email='EricCrow@pm.me',
    install_requires=REQUIREMENTS
)
