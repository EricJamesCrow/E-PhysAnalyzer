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
- Regions and Patterns
    - The Regions section is where the user can create color coded regions on the graph.
    - There are two ways a user can create these regions. Using the Generate Pattern or New Region buttons.
        - Generate Pattern: This button will give the user options to create regions from a certain start and end time, increasing incrementally by a given number of minutes.
        - Once you enter the information, hit submit, and the program will auto-populate the Regions section with the color defaulting to red.
        - You will be able to change the color by pressing the colored box, which will display a color chooser.
            - The color pallete will allow you to click any color to replace the current color in the region.
            - There is the option to manually enter a python matplotlib library color if you need a separate color.
            - To view a list of all possible matplotlib library colors, use this link https://matplotlib.org/stable/gallery/color/named_colors.html#sphx-glr-gallery-color-named-colors-py.
        - These regions are based on the time, in minutes, that the data point lies between.
- Post Analysis and Minute Averaged Graphs
    - In these settings you can change a few different values. Both of these graph settings are the same, but applied to each graph.
    - X-Min. (default = negative value equivalent to baseline time) is a parameter that allows you to change the x-axis minimum value.
    - X-Max. (default = auto adjust scale based on data) is a parameter that allows you to change the x-axis maximum value.
    - Y-Min. (default = auto adjust scale based on data) is a parameter that allows you to change the y-axis minimum value.
    - Y-Max. (default = auto adjust scale based on data) is a parameter that allows you to change the y-axis maximum value.
    - For the Minute Averaged graph, the defaults for the y axis are consistent (25-225) so that the data is more comparable.
- Outliers
    - We have given the option to remove outliers from the data set as well as graphs (default = True). This will calculate standard deviations for the data set and if on, will remove outliers that are outside of a given z-score (default = 2.5).
    - explained simply, it will remove data points from all calculations and resulting data that occurs outside of given number of standard deviations (default = 2.5). 2.5 is the default based on standard practice in statistics.
- Color Options
    - The first color option is to have the entire graph's data points the same color, regardless of region or pattern information (default = False).
    - If the Single Color option is True, it will make all data points the specified color (default = gray).
    - Graph Quality allows you to select a DPI (dots per inch) for the graph output (default = medium).
        - The following are the dpi settings for the default qualities.
        - Low = 100 dpi
        - Medium = 300 dpi
        - High = 600 dpi
        - Ultra = 1000 dpi
        - The user can also select 'Custom' which will allow them to enter their own dpi.
- **Baseline Settings**
    - The slider allows users to display a dashed line that is equal to the calculated baseline value.
    - The baseline line color can be changed in the text entry box below (default = gray).
    - The time the user measured the baseline and what time region you want to calculate from can be entered in the box at the bottom (default = 10).
- Reset Button
    - To reset all settings to default for THIS PAGE ONLY, press the Reset button.

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