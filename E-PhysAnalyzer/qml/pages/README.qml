import QtQuick 2.0
import QtQuick.Window 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 6.2

Item {id: root
    visible: true
    width: 499
    height: rootHeight
    property int rootHeight: 385 // 385 or 725
    QtObject{
        id: internals
        property string markdown_text: "
##### Contact: cameroncordero@gmail.com / EricCrow@pm.me
## 1. Using the Program
#### 1. Selecting Files
Begin by selecting files using the 'Browse' button in blue.<br/>
This should bring up your native file browser.<br/>
From there you can navigate to the directory containing the files you would like to analyze.<br/>
You may select as many files as you want from this directory.<br/>
REMEMBER the files will output to this same directory.
#### 2. The 'SETUP' Tab
- Within the setup tab lies the parameters and variables that the user can change<br/>for running the analysis.
- There are up to 3 user profiles with complete control and 1 profile designed<br/>for a single color.
- Defaults for the program are shown in the gray placeholder text.
- Any settings changed in these profiles will be saved automatically and can be<br/>reset at anytime using the 'Reset' button in the bottom right.
- The entry boxes under the column labeled 'Time (min)' allows you to type in time<br/>ranges that you would like to be associated with the corresponding color<br/> in the box directly to the right of it.
<br/>NOTE: To view available colors, click on the 'Colors' tab next to the 'Graphs' tab.<br/>
The default settings are shown in the placeholder text in gray.
- Beneath that are settings for removing outliers. The program calculates the<br/>standard deviation of each data file and assigns each point a 'Z-score'.
<br/>The default is to remove outliers that have a z-score of 2.5 or higher.
<br/>Users can uncheck the box to remove outliers if they would like to keep all of the<br/>data points for their analysis.
<br/>Users can also enter different parameters for the z score if they wish to be<br/>more or less strict with datapoint filtering.
- Under the 'Axis Limits' drop down menu, the user can select each graph and<br/>adjust the axis for each.
The default is to use the negative value of the baseline<br/>time entered by the user, along with auto adjustment for the rest.
<br/>The program will automatically adjust the axis to include all the values with<br/>the least amount of white space.
<br/>If you are entering your own values for these, and you wish to have one <br/>auto-adjusted, please input 'None'.
<br/>Please input the points in the same format shown in the placeholder text.
<br/>Ex. If you want the y-axis to go from 25 to 225, in the 'Y-Axis' box type '25, 225'.
- The 'Color Code' selection box will specify whether or not certain points<br/>or ranges will be colored accordingly.
<br/>If you would not like them colored, uncheck the box and they will default to black.
<br/>If you want them a different color, in the 'Profiles' dropdown menu, select<br/>'Single Color' and type in the desired color.
- The 'Graph Quality' drop down menu contains different settings for DPI.
<br/>Low has 100 DPI, Medium has 300 DPI, High has 600 DPI, and Ultra has 1000 DPI.
<br/>If the user selects 'Custom', an entry box will appear that they can type<br/>in the desired DPI.
<br/>NOTE: The higher the DPI, the longer the program takes to run, this is the<br/>only bottle necking part of the program.
- Under the 'Display Baseline' check box, the user can decide whether or not to have<br/>a dashed line showing the baseline appear on the graph.
<br/>Underneath there is an entry box to type in the color of the baseline dashed line.
<br/>NOTE: To view available colors, click on the 'Colors' tab next to the 'Graphs' tab.
- Lastly, under the 'Baseline time (min)' there is a box for the user to specify what<br/>their baseline value is for the analysis.
<br/>The baseline will be used to calculate what the peak averages are before <br/>adding the drug to find relative increases or decreases in signal
<br/>The default is 10, but if you would like to change it, type an integer into the box.
- Again, the 'Reset' button in the bottom right will reset EVERYTHING for this<br/>profile only. It will not affect any other profiles.
<br/>If you have further questions, please reach out to us and send us a screenshot <br/>of your parameters along with your data set and we can help you troubleshoot <br/>from there.
### 3. Running the Program
- To run the program simply navigate to the 'RUN' tab and select run.
<br/>NOTE: Make sure you have the drug name, the trace number the drug was added, <br/>and any excluded traces you want removed from the data and analysis.
- Please follow the placeholder text for formatting these entries. If you have any <br/>questions or are running into errors, please note the error messages and <br/>resolve the issue. If you cannot, contact us.
## 2. Interpreting Results
As mentioned previously, to view results, look in the same directory as the analyzed files<br/>and select the 'E-Phys Analyzer YYYY-DD-MM Results' file filder.
<br/>The file creates two graphs and two .csv files, both from the same analysis.
1. The first dataset labeled 'Post Analysis' comes from the algorithm in <br/>'AnalyzeData.py'. This file contains every data point and a full analysis of each. <br/>The corresponding graph has the same values.
2. The second dataset labeled 'Minute Averaged' com from the algorithm in <br/>'AnalyzeData.py'. This file contains data points from the baseline (10 minutes prior <br/>to drug addition) averaged to create one data point per minute. <br/>The graphs have fixed axis and are mainly used to easily compare experiments.
***
"
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        clip: true

        Flickable {
            id: flickable
            width: 300
            contentHeight: 1430
            ScrollBar.vertical: ScrollBar {
                id: theScrollBar
                hoverEnabled: true
                active: hovered || pressed
                policy: ScrollBar.AsNeeded
                parent: flickable.parent
                anchors.top: flickable.top
                anchors.left: flickable.right
                anchors.bottom: flickable.bottom
            }

            Rectangle {
                id: rectangle
                color: "#ffffff"
                anchors.fill: parent

                Text{
                    id: t_output
                    Layout.fillWidth: true
                    textFormat: TextEdit.MarkdownText
                    text: internals.markdown_text

                }
            }
        }
    }

    Connections {
        target: backend
        function onSetRootHeight(num) {
            console.log(num)
            rootHeight = num
            root.height = rootHeight
        }
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:1}D{i:6}D{i:5}D{i:3}D{i:2}D{i:7}
}
##^##*/
