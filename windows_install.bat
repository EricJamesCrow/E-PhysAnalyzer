@echo off

::Checks if python is installed
:check
python --version 3.10
if errorlevel 1 goto errorNoPython

::If python is installed then it runs the program
python3.10 -m pip install -r requirements.txt
.\windows_run.bat

::Installes python
:errorNoPython
python
timeout /t 60
goto check
