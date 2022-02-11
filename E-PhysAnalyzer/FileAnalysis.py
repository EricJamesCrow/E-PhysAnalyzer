import importlib
import os
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
import re


class MainProgram:
    def check_dpi(self, dpi):
        sns.set(rc={'savefig.dpi': int(dpi)})
        

    def check_graphs(self, colorCodes):
        x = sns.scatterplot()
        for i in range(len(colorCodes)):
            x.axhline(100, color=colorCodes[i]).set_linestyle("--")

    def check_baseline(self, baseline_color):
        x = sns.scatterplot()
        x.axhline(100, color=baseline_color).set_linestyle("--")

    def mkdir_outputs(self, files):
        base_name = os.path.basename(files[0])
        self.base_name_no_ext_outputs = os.path.splitext(base_name)[0]
        parent_dir = os.path.dirname(os.path.abspath(files[0]))
        directory = f"E-Phys Analyzer"
        self.output_path = os.path.join(parent_dir, directory)
        os.makedirs(self.output_path, exist_ok=True)

    def mkdir(self, files):
        base_name = os.path.basename(files)
        self.base_name_no_ext = os.path.splitext(base_name)[0]
        parent_dir = self.output_path
        directory = f"{self.base_name_no_ext}" + " Analysis"
        self.path = os.path.join(parent_dir, directory)
        os.makedirs(self.path, exist_ok=True)

    def analyze_data(self, files, drugAdded, whenDrug, excludedTraces, colorCode, colorCodes):
        with open(files, 'r') as atfFile:

            # Skips the first to lines (useless) in .atf file
            for _ in range(2): atfFile.readline()

            # Grabs the headers of the .atf file
            headers = atfFile.readline().strip().split('\t')
            trace = headers[1]
            traceTime = headers[2]
            peakAmp = headers[3]
            ampTotal = 0
            totalTraces = 0
            timeDifference = 0
            timeInMinutes = []
            exTracesInBaseine = []
            excludedTraces = list(map(int, excludedTraces))
            for exTrace in excludedTraces:
                if int(exTrace) in range(int(whenDrug) - 31, whenDrug):
                    exTracesInBaseine.append(int(exTrace))
            for line in atfFile:

                lineColumns = line.strip().split('\t')
                trace = int(lineColumns[1])
                traceTime = lineColumns[2]
                peakAmp = lineColumns[3]
                absAmp = abs(float(peakAmp))

                if int(trace) in excludedTraces:
                    continue
                else:
                    if trace == 1 and trace < ((int(whenDrug) - 31)):
                        timeDifference = traceTime[-1:1]

                    if trace == 1 and trace >= ((int(whenDrug) - 31)):
                        timeDifference = traceTime
                        ampTotal += float(absAmp)
                        totalTraces += 1

                    if trace >= (int(whenDrug) - 31):
                        ampTotal += float(absAmp)
                        totalTraces += 1

                    timeInMinutes.append((float(traceTime) - float(timeDifference)) / 60000)
            baseline = ampTotal / totalTraces

            with open(os.path.join(self.path, self.base_name_no_ext + ' Post Analysis.csv'), 'w') as newCSV:

                newCSV.write(','.join(['Trace', 'Trace Start (ms)', 'Trace Start (minutes)', 'R1S1 Peak Amp (pA)',
                                       'Absolute Value R1S1 Peak Amp (pA)',
                                       'Normalized to Baseline (' + str(baseline) + ')',
                                       'Time From ' + drugAdded + ' Addition', 'Color Code']) + '\n')

                atfFile.seek(0)
                for _ in range(3): atfFile.readline()
                i = 0
                for line in atfFile:

                    lineColumns = line.strip().split('\t')
                    trace = int(lineColumns[1])
                    traceTime = lineColumns[2]
                    peakAmp = lineColumns[3]
                    absAmp = abs(float(peakAmp))
                    normalizedAmp = absAmp / baseline * 100
                    if colorCode:
                        if trace <= (whenDrug - 15):
                            color = colorCodes[0]
                        elif trace <= (whenDrug):
                            color = colorCodes[1]
                        elif trace <= (whenDrug + 15):
                            color = colorCodes[2]
                        elif trace <= (whenDrug + 30):
                            color = colorCodes[3]
                        elif trace <= (whenDrug + 45):
                            color = colorCodes[4]
                        elif trace <= (whenDrug + 60):
                            color = colorCodes[5]
                        elif trace <= (whenDrug + 75):
                            color = colorCodes[6]
                        elif trace <= (whenDrug + 90):
                            color = colorCodes[7]
                        else:
                            color = 'gray'
                    else:
                        color = 'royalblue'

                    if trace in excludedTraces:
                        continue
                    else:
                        timeFromDrug = timeInMinutes[i] - float(whenDrug) / 3
                        if timeFromDrug >= 0:
                            timeFromDrug += (1 / 3)
                            newCSV.write(','.join(
                                [str(trace), str(traceTime), str(timeInMinutes[i]),
                                 str(peakAmp), str(absAmp), str(normalizedAmp),
                                 str(timeFromDrug)]))
                            if colorCode:
                                newCSV.write(','+color+'\n')
                            else:
                                newCSV.write(','+color+'\n')
                        else:
                            newCSV.write(','.join(
                                [str(trace), str(traceTime), str(timeInMinutes[i]),
                                 str(peakAmp), str(absAmp), str(normalizedAmp),
                                 str(timeFromDrug)]))
                            if colorCode:
                                newCSV.write(','+color+'\n')
                            else:
                                newCSV.write(','+color+'\n')
                    i += 1

            with open(os.path.join(self.path, self.base_name_no_ext + ' Minute Averaged.csv'), 'w') as secondCSV:
                with open(os.path.join(self.path, self.base_name_no_ext + ' Post Analysis.csv'), 'r') as firstCSV:
                    secondCSV.write(
                        f"Time from {drugAdded} Addition (min),Absolute Value R1S1 Peak Amp Averages Per Minute (pA),Trace Numbers Used in Average,Color Code\n")
                    minuteTimes = []
                    traceNumbers = []
                    traces = ''
                    total = 0
                    drugTime = -10
                    i = 1
                    firstCSV.readline()
                    for line in firstCSV:
                        lineColumns = line.strip().split(',')
                        timeFromDrug = lineColumns[6]
                        floatTime = float(timeFromDrug)
                        normAmps = lineColumns[5]
                        trace = lineColumns[0]
                        color = lineColumns[7]
                        if floatTime < -10.5:
                            continue
                        else:
                            if floatTime > -10.5 and floatTime < -9.1:
                                minuteTimes.append(float(normAmps))
                                traceNumbers.append(trace)

                            else:
                                floatTimeStr = f'{(floatTime):.6f}'
                                if i == 1:
                                    for entry in range(0, len(minuteTimes)): total += float(minuteTimes[entry])
                                    avg = total / len(minuteTimes)
                                    traces = ' '.join(traceNumbers)
                                    secondCSV.write(','.join([str(drugTime), str(float(avg)), traces, color]) + '\n')
                                    total = 0
                                    prevTrace = round(float(floatTimeStr))
                                    minuteTimes = []
                                    traceNumbers = []
                                    traces = ''
                                    i = 0
                                    drugTime += 1
                                    oldColor = color
                                    minuteTimes.append(float(normAmps))
                                    traceNumbers.append(trace)

                                elif ((floatTimeStr[4] == '0' or floatTimeStr[4] == '9') and floatTimeStr[0] == '-') or (((abs(prevTrace - float(floatTimeStr)))) > .9 and (floatTimeStr[0] == '-')):
                                    for entry in range(len(minuteTimes)): total += float(minuteTimes[entry])
                                    traces = ' '.join(traceNumbers)
                                    avg = total / len(minuteTimes)
                                    secondCSV.write(','.join([str(int(drugTime)), str(float(avg)), traces, oldColor]) + '\n')
                                    total = 0
                                    prevTrace = round(float(floatTimeStr))
                                    drugTime += 1
                                    oldColor = color
                                    minuteTimes = []
                                    traceNumbers = []
                                    traces = ''
                                    traceNumbers.append(trace)
                                    minuteTimes.append(float(normAmps))

                                elif (floatTimeStr[4] == '3' and floatTimeStr[0] != '-') or ((abs(prevTrace - float(floatTimeStr))) > .9):
                                    for entry in range(len(minuteTimes)): total += float(minuteTimes[entry])
                                    traces = ' '.join(traceNumbers)
                                    avg = total / len(minuteTimes)
                                    secondCSV.write(','.join([str(int(drugTime)), str(float(avg)), traces, oldColor]) + '\n')
                                    total = 0
                                    prevTrace = int(float(floatTimeStr)) + 1/3
                                    drugTime += 1
                                    oldColor = color
                                    minuteTimes = []
                                    traceNumbers = []
                                    traces = ''
                                    traceNumbers.append(trace)
                                    minuteTimes.append(float(normAmps))
                                else:
                                    traceNumbers.append(trace)
                                    minuteTimes.append(float(normAmps))
                    for entry in range(len(minuteTimes)): total += float(minuteTimes[entry])
                    traces = ' '.join(traceNumbers)
                    avg = total / len(minuteTimes)
                    secondCSV.write(','.join([str(int(drugTime)), str(float(avg)), traces, color]) + '\n')

    def make_graphs(self, dpi, baseline, baseline_color):
        # Creates the Minute Averaged graph
        with open(os.path.join(self.path, self.base_name_no_ext + ' Minute Averaged.csv'), 'r') as data:
            gdata = pd.read_csv(data)
            headers = list(gdata.columns)
            sns.set(rc={'savefig.dpi': int(dpi)})
            sns.set_theme(style='ticks')
            color_list = []
            for index, row in gdata.iterrows():
                if row[headers[3]] not in color_list: color_list.append(row[headers[3]])
            sns.set_palette(sns.color_palette(color_list))
            g = sns.scatterplot(x=headers[0], y=headers[1], hue=headers[3], data=gdata, legend=False)
            if baseline:
                g.axhline(100, color=baseline_color).set_linestyle("--")
                basedline = True
            else:
                basedline = False
            g.set(ylim=(20, 220))
            g.set(xlim=(-10, 30))
            g.set(title=f"{self.base_name_no_ext} Averaged to Minutes")
            sns.despine()
            graph1 = g.get_figure()
            graph1.savefig(os.path.join(self.path, self.base_name_no_ext + ' Minute Averaged Graph.png'))
            importlib.reload(plt)
            importlib.reload(sns)

            # Creates the Post Analysis graph
            with open(os.path.join(self.path, self.base_name_no_ext + ' Post Analysis.csv'), 'r') as data2:
                gdata2 = pd.read_csv(data2)
                headers2 = list(gdata2.columns)
                sns.set(rc={'savefig.dpi': int(dpi)})
                sns.set_theme(style='ticks')
                color_list2 = []
                for index, row in gdata2.iterrows():
                    if row[headers2[7]] not in color_list2: color_list2.append(row[headers2[7]])
                sns.set_palette(sns.color_palette(color_list2))
                g2 = sns.scatterplot(x=headers2[6], y=headers2[4], data=gdata2, hue=headers2[7], legend=False)
                baseline_string = re.split("\(|\)", headers2[5])
                baseline = float(baseline_string[1])
                baseline_int = int(baseline)
                if basedline:
                    g2.axhline(baseline_int, color=baseline_color).set_linestyle("--")
                else:
                    pass
                g2.set(title=f"{self.base_name_no_ext} Full Data Set")
                g2.set(xlim=(-10, 30))
                sns.despine()
                graph2 = g2.get_figure()
                graph2.savefig(os.path.join(self.path, self.base_name_no_ext + ' Post Analysis Graph.png'))
                importlib.reload(plt)
                importlib.reload(sns)