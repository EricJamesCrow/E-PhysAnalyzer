# E-Phys Analyzer version 2.0
![](https://raw.githubusercontent.com/EricJamesCrow/E-PhysAnalyzer/development/E-PhysAnalyzer2/images/gifs/ephysAnalyzerJavascript.gif)
##### A data analysis and visualization tool for Clampfit data.
***
## Table of Contents
1. [Installation Guide](#installation-guide)
2. [Input Files and Formats](#input-files-and-formats)
3. [Using the Program](#using-the-program)
4. [Interpreting Results](#interpreting-results)
5. [Acknowledgements](#acknowledgements)
***
## 1. Installation Guide
#### Install EPhysAnalyzer 
Windows installation instructions:
-	*REQUIRES PYTHON 3.8 OR ABOVE*
-	For the newest version of python, click here https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe
-	Download this package from https://github.com/EricJamesCrow/E-PhysAnalyzer/archive/refs/heads/main.zip
-	Unzip the downloaded file to your desired directory
-	Within the E-Phys Analyzer-main folder run 'install.bat'
-	To properly run the program with all of the features, use the 'run.bat' file to start the program

Linux installation instructions:
- From the Linux command line, input the following commands:
  - git clone https://github.com/EricJamesCrow/E-PhysAnalyzer.git
  - pip install -r E-PhysAnalyzer/Info/requirements.txt
  - cd E-PhysAnalyzer/E-PhysAnalyzer
  - python3 main.py

***
## 2. Input Files and Formats
#### Directory Structure
There is no directory setup required for this program.
To use E-Phys Analyzer, simply use the 'Browse Files' button in the top left of the program to navigate to and select your Clampfit .atf files.
The program will create an 'E-Phys Analyzer YYYY-MM-DD Results' folder in the same directory as your input files. Within this folder will be individual folders for each inputted data file with the corresponding analysis files.
#### Admin Privileges
This program should not ask for administrative privileges to access your files, the only reason it would ask for this is becuase it needs to create new files within the same directory as your input.
If you come accross any issues like this, please let us know.
#### Clampfit Data File Format
When using clampfit to analyze your dataset, you want to determine the range of the elicited response. 
This program analyzes that by looking at the absolute peak response from stimulation, and if done properly, it should be labeled R1S1 peak.
The only necessary columns for this program is 'trace number', 'time (ms)' and 'R1S1 peak amplitude'. To avoid errors in the program, please have the data only have this format.
While viewing the dataset in Clampfit, save the data set as an .atf file and save it to the directory of your choice. Just a reminder, the output from the program saves to the same directory.
***
## 3. Using the Program
#### 1. Selecting Files
Begin by selecting files using the 'Browse' button in blue.
This should bring up your native file browser.
From there you can navigate to the directory containing the files you would like to analyze.
You may select as many files as you want from this directory.
REMEMBER the files will output to this same directory.

![](https://github.com/EricJamesCrow/E-PhysAnalyzer/blob/main/E-PhysAnalyzer/images/gifs/browsefiles.gif)
#### 2. The 'SETUP' Tab
![](https://github.com/EricJamesCrow/E-PhysAnalyzer/blob/main/E-PhysAnalyzer/images/gifs/setupfeatures.gif)
- Within the setup tab lies the parameters and variables that the user can change for running the analysis.
- There are up to 3 user profiles with complete control and 1 profile designed for a single color.
- Defaults for the program are shown in the gray placeholder text.
- Any settings changed in these profiles will be saved automatically and can be reset at anytime using the 'Reset' button in the bottom right.
- The entry boxes under the column labeled 'Time (min)' allows you to type in time ranges that you would like to be associated with the corresponding color in the box directly to the right of it.
NOTE: To view available colors, click on the 'Colors' tab next to the 'Graphs' tab.
The default settings are shown in the placeholder text in gray.
- Beneath that are settings for removing outliers. The program calculates the standard deviation of each data file and assigns each point a 'Z-score'.
The default is to remove outliers that have a z-score of 2.5 or higher.
Users can uncheck the box to remove outliers if they would like to keep all of the data points for their analysis.
Users can also enter different parameters for the z score if they wish to be more or less strict with datapoint filtering.
- Under the 'Axis Limits' drop down menu, the user can select each graph and adjust the axis for each.
The default is to use the negative value of the baseline time entered by the user, along with auto adjustment for the rest.
The program will automatically adjust the axis to include all the values with the least amount of white space.
If you are entering your own values for these, and you wish to have one auto-adjusted, please input 'None'.
Please input the points in the same format shown in the placeholder text.
Ex. If you want the y-axis to go from 25 to 225, in the 'Y-Axis' box type '25, 225'.
- The 'Color Code' selection box will specify whether or not certain points or ranges will be colored accordingly.
If you would not like them colored, uncheck the box and they will default to black.
If you want them a different color, in the 'Profiles' dropdown menu, select 'Single Color' and type in the desired color.
- The 'Graph Quality' drop down menu contains different settings for DPI (dots per inch).
Low has 100 DPI, Medium has 300 DPI, High has 600 DPI, and Ultra has 1000 DPI.
If the user selects 'Custom', an entry box will appear that they can type in the desired DPI.
NOTE: The higher the DPI, the longer the program takes to run, this is the only bottle necking part of the program.
- Under the 'Display Baseline' check box, the user can decide whether or not to have a dashed line showing the baseline on the graph.
Underneath there is an entry box to type in the color of the baseline dashed line.
NOTE: To view available colors, click on the 'Colors' tab next to the 'Graphs' tab.
- Lastly, under the 'Baseline time (min)' there is a box for the user to specify what their baseline value is for the analysis.
The baseline will be used to calculate what the peak averages are before adding the drug to find relative increases or decreases in signal.
The default is 10, but if you would like to change it, type an integer into the box.
- Again, the 'Reset' button in the bottom right will reset EVERYTHING for this profile only. It will not affect any other profiles.
If you have further questions, please reach out to us and send us a screenshot of your parameters along with your data set and we can help you troubleshoot from there.
#### 3. Running the Program
- To run the program simply navigate to the 'RUN' tab and select run.
NOTE: Make sure you have the drug name, the trace number the drug was added, and any excluded traces you want removed from the data and analysis.
- Please follow the placeholder text for formatting these entries. If you have any questions or are running into errors, please note the error messages and resolve the issue. If you cannot, contact us.

![](https://github.com/EricJamesCrow/E-PhysAnalyzer/blob/main/E-PhysAnalyzer/images/gifs/runtheprogram.gif)
## 4. Interpreting Results
As mentioned previously, to view results, look in the same directory as the analyzed files and select the 'E-Phys Analyzer YYYY-DD-MM Results' file folder.
The file creates two graphs and two .csv files, both from the same analysis.
1. The first dataset labeled 'Post Analysis' comes from the algorithm in 'AnalyzeData.py'. This file contains every data point and a full analysis of each. The corresponding graph has the same values.
2. The second dataset labeled 'Minute Averaged' comes from the algorithm in 'AnalyzeData.py'. This file contains data points from the baseline (10 minutes prior to drug addition) averaged to create one data point per minute. The graphs have fixed axis and are mainly used to easily compare experiments.
***
## 5. Acknowledgements
I would like to thank the following individuals and organizations who made developing E-Phys Analyzer possible:  
- The TE Brown lab at Washington State University, especially Dr. Travis Brown who gave me the opportunity to work on this software.
- Washington State University for funding me as a graduate student while I developed E-Phys Analyzer.
- Ben Morledge-Hampton from Washington State Unversity who taught me most of my python knowledge and helped me create this program and others.
- Lastly, I would like to thank my collaborator, Eric Crow for his dedication and persistence on co-writing this program and making it user friendly. Without him, none of this would have been possible.
