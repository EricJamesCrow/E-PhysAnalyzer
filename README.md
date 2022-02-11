# E-Phys Analyzer
##### A data analysis and visualization tool for Clampfit data.
***
## Table of Contents
1. [Installation Guide](#installation-guide)
2. [Input Files and Formats](#input-files-and-formats)
3. [Interpreting Results](#interpreting-results)
4. [Acknowledgements](#acknowledgements)
***
## Installation Guide
#### 1. Install EPhysAnalyzer 
To run EPhysAnalyzer through apt using the following two commands in the Windows PowerShell or Linux terminal:  
  If you are on a Linux Terminal, use the following command:
-	'wget https://github.com/EricJamesCrow/E-PhysAnalyzer/archive/refs/heads/main.zip'
-	'unzip E-PhysAnalyzer-main.zip'
-	'cd E-PhysAnalyzer-main'
-	'pip install -r requirements.txt'
-	'cd E-PhysAnalyzer'
-	'python main.py'

If you are on a Windows PowerShell, use the following command:
-	'curl https://github.com/EricJamesCrow/E-PhysAnalyzer/archive/refs/heads/main.zip'
***
## Input Files and Formats
#### Directory Structure
There is no directory setup required for this program.
To use E-Phys Analyzer, simply use the 'Browse Files' button in the top left of the program to select your Clampfit .atf files.
The program will create an 'EphysAnalyzer Outputs' folder in the same directory as your input files. Within this folder will be individual folders for each inputted data file.
#### Admin Privileges
This program should not ask for administrative privileges to access your files, the only reason it would ask for this is becuase it needs to create new files within the same directory as your input.
If you come accross any issues like this, please let us know.
#### Clampfit Data File Format
When using clampfit to analyze your dataset, you want to deterime the range of the elicited response. 
This program analyzes that by looking at the absolute peak response from stimulation, and if done properly, it should be labeled R1S1 peak.
The only necessary columns for this program is trace number, time (ms) and R1S1 peak amplitude. To avoid errors in the program, please have the data only have this format.
While viewing the dataset in Clampfit, save the data set as an .atf file and save it to the directory of your choice. Just a reminder, the output from the program saves to the same directory.
***
## Interpreting Results
As mentioned previously, to view results, look in the same directory as the analyzed files and select the 'EphysAnalyzer Outputs' file filder.
The file creates two graphs and two .csv files, both from the same analysis.
1. The first dataset labeled 'Post Analysis' comes from the algorithm in 'AnalyzeData.py'. This file contains every data point and a full analysis of each. The corresponding graph has the same values.
2. The second dataset labeled 'Minute Averaged' com from the algorithm in 'AnalyzeData.py'. This file contains data points from the baseline (10 minutes prior to drug addition) averaged to create one data point per minute. The graphs have fixed axis and are mainly used to easily compare experiments.
***
## Acknowledgements
I would like to thank the following individuals and organizations who made developing mutperiod possible:  
- The TE Brown lab at Washington State University, especially Dr. Travis Brown who gave me the opportunity to work on this software
- Washington State University for funding me as a graduate student while I developed E-Phys Analyzer.
- Ben Morledge-Hampton from Washington State Unversity who taught me most of my python knowledge.
- Lastly, I would like to thank my collaborator, Eric Crow for his dedication and persistence on making this program user friendly. Without him, none of this would have been possible.
