import importlib
import os
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
import re
import datetime
from uncertainties import ufloat


# import mpld3
# import numpy as np

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
        importlib.reload(plt)
        importlib.reload(sns)

    def mkdir_outputs(self, files):
        base_name = os.path.basename(files[0])
        self.base_name_no_ext_outputs = os.path.splitext(base_name)[0]
        parent_dir = os.path.dirname(os.path.abspath(files[0]))
        directory = f"E-Phys Analyzer {datetime.date.today()} Results"
        self.output_path = os.path.join(parent_dir, directory)
        os.makedirs(self.output_path, exist_ok=True)

    def mkdir(self, files):
        base_name = os.path.basename(files)
        self.base_name_no_ext = os.path.splitext(base_name)[0]
        parent_dir = self.output_path
        directory = f"{self.base_name_no_ext}" + " Analysis"
        self.path = os.path.join(parent_dir, directory)
        os.makedirs(self.path, exist_ok=True)

    def calc_standard_dev(self, files, excludedTraces):
        with open(files, 'r') as atfFile:
            for _ in range(3): atfFile.readline()
            totalPA = 0
            totalTraces = 0
            sigma = 0
            self.standDev = 0
            PAList = []
            self.mean = 0
            for line in atfFile:
                lineColumns = line.strip().split('\t')
                peakAmp = abs(float(lineColumns[3]))
                trace = int(lineColumns[1])
                excludedTraces = list(map(int, excludedTraces))
                if trace not in excludedTraces:
                    totalPA += peakAmp
                    totalTraces += 1
                    PAList.append(peakAmp)
            self.mean = totalPA / totalTraces
            for i in range(len(PAList)):
                sigma += (float(PAList[i]) - self.mean) ** 2
            self.standDev = (sigma / totalTraces) ** (1 / 2)

    def calc_z_score(self, mean, standDev, peakAmp):
        self.z_score = ((abs(float(peakAmp)) - mean) / standDev)
        return str(self.z_score)

    def analyze_data(self, files, drugAdded, whenDrug, excludedTraces, colorCode, colorCodes, z_limit, z_checking, user_baseline, graphPoints):
        self.calc_standard_dev(files, excludedTraces)
        with open(files, 'r') as atfFile:

            # calculates initial time offset, time between traces in minutes, and number of traces per minute
            time_list_min = []
            offset_start = 0
            for _ in range(3): atfFile.readline()
            first_time = atfFile.readline().strip().split('\t')
            second_time = atfFile.readline().strip().split('\t')
            if first_time[2] != 0: offset_start = first_time[2]
            time_list_min.append((float(first_time[2]) - float(offset_start)) / 60000)
            time_list_min.append((float(second_time[2]) - float(offset_start)) / 60000)
            time_between_traces_min = float(time_list_min[1]) - float(time_list_min[0])
            traces_per_minute = round(1 / time_between_traces_min)

            # resets the file to the first line of data and headers
            atfFile.seek(0)
            for _ in range(3): atfFile.readline()
            excludedTraces = list(map(int, excludedTraces))
            exTracesInBaseine = []

            # looks for excluded traces up to ten minutes before the drug was added (baseline) time period
            for exTrace in excludedTraces:
                if int(exTrace) in range(int(whenDrug) - (user_baseline * traces_per_minute + 1), whenDrug):
                    exTracesInBaseine.append(int(exTrace))
            ampTotal = 0
            totalTraces = 0
            baseline = 0
            timeInMinutes = []
            exTracesInBaseine = []

            for line in atfFile:

                file_columns = line.strip().split('\t')
                trace = int(file_columns[1])
                traceTime = file_columns[2]
                peakAmp = file_columns[3]
                absAmp = abs(float(peakAmp))

                # excludes traces that have a z-score that is higher than the one inputted by user
                # also excludes traces in the user list of inputted traces
                if trace in excludedTraces:
                    continue
                if z_checking and abs(float(self.calc_z_score(self.mean, self.standDev, peakAmp)) > z_limit):
                    continue
                # if the trace is within the baseline, it adds them together to calculate the baseline
                else:
                    if (trace >= (int(whenDrug) - (user_baseline * traces_per_minute + 1))) and (trace < int(whenDrug)):
                        ampTotal += float(absAmp)
                        totalTraces += 1

                    timeInMinutes.append((float(traceTime) - float(offset_start)) / 60000)
            baseline = ampTotal / totalTraces

            # resets the file before moving on
            atfFile.seek(0)
            for _ in range(3): atfFile.readline()

            # analyzes the data and writes to a new file
            with open(os.path.join(self.path, self.base_name_no_ext + ' Post Analysis.csv'), 'w') as newCSV:

                # write the headers of the data file
                newCSV.write(','.join(['Trace', 'Trace Start (ms)', 'Trace Start (minutes)', 'R1S1 Peak Amp (pA)',
                                       'Abs Val R1S1 Peak Amp (pA)',
                                       'Normalized to Baseline (' + str(baseline)[:8] + ')',
                                       'Time From ' + drugAdded + ' Addition', 'Color Code', 'Z-score']) + '\n')
                i = 0
                for line in atfFile:
                    # if the trace is part of the excluded traces, or is going to be ignored for its z-score
                    # then the file will skip through the lines and ignore them

                    file_columns = line.strip().split('\t')
                    trace = file_columns[1]
                    trace_int = int(trace)
                    traceTime = file_columns[2]
                    peakAmp = file_columns[3]
                    absAmp = abs(float(peakAmp))
                    normalizedAmp = absAmp / baseline * 100

                    a1 = graphPoints[0]
                    a2 = graphPoints[1]
                    b1 = graphPoints[2]
                    b2 = graphPoints[3]
                    c1 = graphPoints[4]
                    c2 = graphPoints[5]
                    d1 = graphPoints[6]
                    d2 = graphPoints[7]
                    e1 = graphPoints[8]
                    e2 = graphPoints[9]
                    f1 = graphPoints[10]
                    f2 = graphPoints[11]
                    g1 = graphPoints[12]
                    g2 = graphPoints[13]
                    h1 = graphPoints[14]
                    h2 = graphPoints[15]
                    # color codes the trace depending on the time frame its in
                    # with the int being the time relative to drug addition
                    if colorCode:
                        if trace_int >= (whenDrug+1 + a1 * traces_per_minute) and trace_int < (whenDrug+1 + a2 * traces_per_minute):
                            color = colorCodes[0]
                        elif trace_int >= (whenDrug+1 + b1 * traces_per_minute) and trace_int < (whenDrug+1 + b2 * traces_per_minute):
                            color = colorCodes[1]
                        elif trace_int >= (whenDrug+1 + c1 * traces_per_minute) and trace_int < (whenDrug+1 + c2 * traces_per_minute):
                            color = colorCodes[2]
                        elif trace_int >= (whenDrug+1 + d1 * traces_per_minute) and trace_int < (whenDrug+1 + d2 * traces_per_minute):
                            color = colorCodes[3]
                        elif trace_int >= (whenDrug+1 + e1 * traces_per_minute) and trace_int < (whenDrug+1 + e2 * traces_per_minute):
                            color = colorCodes[4]
                        elif trace_int >= (whenDrug+1 + f1 * traces_per_minute) and trace_int < (whenDrug+1 + f2 * traces_per_minute):
                            color = colorCodes[5]
                        elif trace_int >= (whenDrug+1 + g1 * traces_per_minute) and trace_int < (whenDrug+1 + g2 * traces_per_minute):
                            color = colorCodes[6]
                        elif trace_int >= (whenDrug+1 + h1 * traces_per_minute) and trace_int < (whenDrug+1 + h2 * traces_per_minute):
                            color = colorCodes[7]
                        else:
                            color = 'gray'
                    else:
                        color = 'royalblue'

                    if trace_int in excludedTraces:
                        continue
                    if z_checking and abs(float(self.calc_z_score(self.mean, self.standDev, peakAmp)) > z_limit):
                        continue
                    else:
                        # time from drug calculation based on given metrics
                        time_from_drug = timeInMinutes[i] - (float(whenDrug)-1) / traces_per_minute

                        # since there is no '0' time point, we are removing that by noting when it becomes positive
                        if time_from_drug >= 0:
                            time_from_drug += (time_between_traces_min)
                            newCSV.write(','.join(
                                [str(trace), str(traceTime), str(timeInMinutes[i]),
                                 str(peakAmp), str(absAmp), str(normalizedAmp),
                                 str(time_from_drug)]))
                            newCSV.write(',' + color + ',' + self.calc_z_score(self.mean, self.standDev, peakAmp) + '\n')

                        # anytime before the '0' time point
                        else:
                            newCSV.write(','.join(
                                [str(trace), str(traceTime), str(timeInMinutes[i]),
                                 str(peakAmp), str(absAmp), str(normalizedAmp),
                                 str(time_from_drug)]))
                            newCSV.write(
                                ',' + color + ',' + self.calc_z_score(self.mean, self.standDev, peakAmp) + '\n')
                        i += 1


        with open(os.path.join(self.path, self.base_name_no_ext + ' Minute Averaged.csv'), 'w') as minute_averaged_csv:
            with open(os.path.join(self.path, self.base_name_no_ext + ' Post Analysis.csv'), 'r') as full_analysis_csv:
                minute_averaged_csv.write(
                    f"Time from {drugAdded} Addition (min),Abs Val R1S1 Peak Amp Normalized to Baseline (pA),Trace Numbers Used in Average,Color Code\n")
                minuteTimes = []
                traceNumbers = []
                traces = ''
                total = 0
                drugTime = -user_baseline
                minute_counter = -user_baseline + 1

                # skip past headers
                full_analysis_csv.readline()

                for line in full_analysis_csv:
                    file_columns = line.strip().split(',')
                    time_from_drug = file_columns[6]
                    time_from_drug_float = float(time_from_drug)
                    normalized_amplitude = file_columns[5]
                    trace = file_columns[0]
                    color = file_columns[7]
                    if time_from_drug[0] == '-' and int(trace) < (whenDrug - (user_baseline * traces_per_minute)):
                        continue

                    if (int(trace) >= (whenDrug + (minute_counter * traces_per_minute + 1))):
                        minute_counter += 1
                        for entry in range(0, len(minuteTimes)): total += float(minuteTimes[entry])
                        avg = total / len(minuteTimes)
                        traces = ' '.join(traceNumbers)
                        minute_averaged_csv.write(','.join([str(drugTime), str(float(avg)), traces, color]) + '\n')
                        total = 0
                        traces = ''
                        minuteTimes = []
                        traceNumbers = []
                        drugTime += 1
                        minuteTimes.append(normalized_amplitude)
                        traceNumbers.append(trace)

                    else:
                        minuteTimes.append(normalized_amplitude)
                        traceNumbers.append(trace)

                # add the remaining points together and average them
                for entry in range(len(minuteTimes)): total += float(minuteTimes[entry])
                if len(minuteTimes) > 0:
                    traces = ' '.join(traceNumbers)
                    avg = total / len(minuteTimes)
                    minute_averaged_csv.write(','.join([str(int(drugTime)), str(float(avg)), traces, color]) + '\n')

    def make_graphs(self, dpi, baseline, baseline_color, axis_limits):
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
            g.set(xlim=(axis_limits[0], axis_limits[1]))
            g.set(ylim=(axis_limits[2], axis_limits[3]))
            g.set(title=f"{self.base_name_no_ext} Minute Averages Normalized to Baseline")
            sns.despine()
            graph1 = g.get_figure()
            graph1.savefig(os.path.join(self.path, self.base_name_no_ext + ' Minute Averages.png'))
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
                g2.set(title=f"{self.base_name_no_ext} Peak Amplitude Over Time")
                g2.set(xlim=(axis_limits[4], axis_limits[5]))
                g2.set(ylim=(axis_limits[6], axis_limits[7]))
                sns.despine()
                graph2 = g2.get_figure()
                graph2.savefig(os.path.join(self.path, self.base_name_no_ext + ' Post Analysis Graph.png'))
                importlib.reload(plt)
                importlib.reload(sns)
