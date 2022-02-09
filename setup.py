from setuptools import setup

REQUIREMENTS = ["cython",
                "PyQt6~=6.2.3",
                "PySide6~=6.2.3",
                "seaborn~=0.11.2",
                "pandas~=1.4.0",
                "matplotlib~=3.5.1",
                ]

setup(
    name='E-PhysAnalyzer',
    version='0.1.0',
    packages=['E-PhysAnalyzer'],
    url='',
    license='MIT',
    author='Cameron Cordero / Eric Crow',
    author_email='cameroncordero@gmail.com / EricCrow@pm.me',
    install_requires=REQUIREMENTS
)
