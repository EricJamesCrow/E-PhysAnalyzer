# E-Phys Analyzer version 2.0
##### E-Phys Analyzer is a program designed to save users time by analyzing and visualizing electrophysiology data in bulk. This program takes .atf files from Clampfit and creates two graphs and two files. The files aim to make the data easier to interpret by processing the data creating files that are comparable. The first file gives a full breakdown of datapoints, including converting the time from miliseconds (ms) to minutes, normalizing the peak amplitudes to the baseline reads, creates timepoints relative to drug addition, and calculates z-statistics to determine outlier datapoints. The second file is a minute averaged graph, that will average datapoints with set axis limits for efficient comparisions between experiments. The program then creates graphs from these two files, which include color coding regions on the graph to quickly identify time points and regions with full control over the output. There are options for different output formats, image quality, and more!
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
-	For the newest version of python, click here https://www.python.org/ftp/python/3.10.7/python-3.10.7-amd64.exe
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
#### Clampfit Data File Format
When using clampfit to analyze your dataset, you want to determine the range of the elicited response. 
This program analyzes that by looking at the absolute peak response from stimulation, and if done properly, it should be labeled R1S1 peak.
The only necessary columns for this program is 'trace number', 'time (ms)' and 'R1S1 peak amplitude'. To avoid errors in the program, please have the data only contain these values.
While viewing the dataset in Clampfit, save the data set as an .atf file and save it to the directory of your choice.
## 3. Using the Program
#### 1. Selecting files and running the program
- Begin by selecting files using the folder button in the top left of the screen, which should bring up your native file browser.
- From there you can navigate to the directory containing the file(s) you would like to analyze and select one or multiple files.  
NOTE: The program will automatically save the results into the input file(s) directory. If you want to use a custom output directory, go to Settings -> General then turn on Custom Output Directory. From there you will be prompted to select a directory to save your files.
- Once files are selected, the file display box will populate with the file name and text entry boxes for: Drug Name, Trace Number, and Excluded Traces
    - Drug Name: Enter the name of the drug used in the experiment, this will be displayed in the x-axis as well as the data files.
    - Trace Number: Enter the trace number in which the drug was added, this becomes the time point where the baseline and time relative to the drug addition is calculated.
    - Excluded Traces: These are traces where there may have been user error or bad reads which you may want to exclude from your analysis, these will also be removed from the standard deviation, baseline average, and minute averaged calculations.
- Once all the data is entered, press the run arrow, which is next to the file selection button. This will bring up a circular progress bar that will update as each file is processed.
- Upon completion, a window will pop up with options to close, or open your native file chooser to the output directory.
- If any files were unable to process, they will appear in red below the completion statement, if this occurs, it is usually due to an incalculable trace number. Such as extremely high or low values.
#### 2. Customizing run settings
Regions and Patterns
- The Regions section is where the user can create color coded regions on the graph.
- There are two ways a user can create these regions. Using the Generate Pattern or New Region buttons.
    - Generate Pattern: This button will give the user options to create regions from a certain start and end time, increasing incrementally by a given number of minutes.
    - Once you enter the information, hit submit, and the program will auto-populate the Regions section with the color defaulting to red.
    - You will be able to change the color by pressing the colored box, which will display a color chooser.
        - The color pallete will allow you to click any color to replace the current color in the region.
        - There is the option to manually enter a python matplotlib library color if you need a separate color.
        - To view a list of all possible matplotlib library colors, use this link https://matplotlib.org/stable/gallery/color/named_colors.html#sphx-glr-gallery-color-named-colors-py.
    - These regions are based on the time, in minutes, that the data point lies between
Post Analysis and Minute Averaged Graphs
- Post Analysis graph
    - This 

<!-- - Within the setup tab lies the parameters and variables that the user can change for running the analysis.
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
If you have further questions, please reach out to us and send us a screenshot of your parameters along with your data set and we can help you troubleshoot from there. -->
#### 3. Help, General Settings, and About 

## 4. Interpreting Results
As mentioned previously, to view results, look in the same directory as the analyzed files and select the 'E-Phys Analyzer YYYY-DD-MM Results' file folder.
The file creates two graphs and two .csv files, both from the same analysis.
1. The first dataset labeled 'Post Analysis' comes from the algorithm in 'AnalyzeData.py'. This file contains every data point and a full analysis of each. The corresponding graph has the same values.
2. The second dataset labeled 'Minute Averaged' comes from the algorithm in 'AnalyzeData.py'. This file contains data points from the baseline (10 minutes prior to drug addition) averaged to create one data point per minute. The graphs have fixed axis and are mainly used to easily compare experiments.
***
## 5. Acknowledgements
I would like to thank the following individuals and organizations who made developing E-Phys Analyzer possible:  
- The TE Brown lab at Washington State University, especially Dr. Travis Brown who gave me the opportunity to work on this software.
- Washington State University for providing graduate student funding for Cameron Cordero while he assisted in the development of E-Phys Analyzer.
