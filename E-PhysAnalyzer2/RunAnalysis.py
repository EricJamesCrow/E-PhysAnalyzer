import importlib
import os
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
plt.switch_backend('agg') # switches the backend for matplotlib so it doesn't use a GUI
import re
import datetime
from uncertainties import ufloat
from threading import *
from math import trunc

class Analysis(Thread):
    def __init__(self, file, z_limit, z_checking, baseline, color_regions_dict, default_color, dpi, baseline_color, axis_limits):
        super(Analysis, self).__init__()
        self.file = file[0]
        self.drug_name = file[1]
        self.when_drug = trunc(file[2]) # QML converts the int to a float; use trunc() to grab just the integer
        self.excluded_traces = [trunc(i) for i in file[3]]
        self.z_limit = z_limit
        self.z_checking = z_checking
        self.baseline = baseline
        self.color_regions_dict = color_regions_dict
        self.default_color = default_color
        self.dpi = dpi
        self.baseline_color = baseline_color
        self.axis_limits = axis_limits

    def run(self):
        # print(self.file)
        # print(self.drug_name)
        # print(self.when_drug)
        # print(self.excluded_traces)
        # print(self.z_limit)
        # print(self.z_checking)
        # print(self.baseline)
        print(self.color_regions_dict)
        # print(self.default_color)
        # print(self.dpi)
        # print(self.baseline_color)
        # print(self.axis_limits)
        self.analyze_data(self.file, self.drug_name, self.when_drug, self.excluded_traces, self.z_limit, self.z_checking, self.baseline, self.color_regions_dict, self.default_color)
        self.make_graphs(self.dpi, self.baseline, self.baseline_color, self.axis_limits)

    def calc_standard_dev(self, file, excludedTraces):
        '''Calculates standard deviation for all the values in the file and uses them throughout the analysis.'''
        with open(file, 'r') as atfFile:
            for _ in range(3): atfFile.readline()
            totalPA = 0
            totalTraces = 0
            sigma = 0
            self.standDev = 0
            PAList = []
            self.mean = 0
            for line in atfFile:
                tsv = line.strip().split('\t')
                peakAmp = abs(float(tsv[3]))
                trace = int(tsv[1])
                excludedTraces = list(map(int, excludedTraces))
                if trace not in excludedTraces:
                    totalPA += peakAmp
                    totalTraces += 1
                    PAList.append(peakAmp)
            self.mean = totalPA / totalTraces
            for i in range(len(PAList)):
                sigma += (float(PAList[i]) - self.mean) ** 2
            self.standDev = (sigma / totalTraces) ** (1 / 2)

    def calc_z_score(self, peakAmp):
        '''Calculates the number of standard deviations away from the mean? Or some stats stuff.'''
        self.z_score = ((abs(float(peakAmp)) - self.mean) / self.standDev)
        return str(self.z_score)

    def calc_traces_per_min(self, file):
        '''Calculates initial time offset, time between traces in minutes, and number of traces per minute.'''
        with open(file, 'r') as atfFile:
            for _ in range(3): atfFile.readline()
            time_list_min = []
            self.offset_start = 0
            line_1 = atfFile.readline().strip().split('\t')
            first_time = line_1[2]
            line_2 = atfFile.readline().strip().split('\t')
            second_time = line_2[2]
            if first_time != 0: self.offset_start = first_time
            time_list_min.append((float(first_time) - float(self.offset_start)) / 60000)
            time_list_min.append((float(second_time) - float(self.offset_start)) / 60000)
            self.time_between_traces_min = float(time_list_min[1]) - float(time_list_min[0])
            traces_per_minute = round(1 / self.time_between_traces_min)
            return traces_per_minute

    def analyze_data(self, file, drug_name: str, when_drug: int, excluded_traces: list, z_limit: int,
                        z_checking: bool, user_baseline: int, color_regions_dict: dict, default_color: str):
        '''Analyzes the data file to create the .tsv files for use by the graphing software'''
        
        # if removing values based on standard deviations from mean, this calculates both values
        self.calc_standard_dev(file, excluded_traces)
        
        # initializing variables used
        traces_per_minute = self.calc_traces_per_min(file)
        baseline_start = when_drug - (user_baseline * traces_per_minute + 1)
        excluded_traces = list(map(int, excluded_traces))
        exTracesInBaseine = []
        ampTotal = 0
        traces_in_baseline = 0
        with open(file, 'r') as atf_file:

            # looks for excluded traces that occur in the baseline time period and append the list
            for exTrace in excluded_traces:
                if int(exTrace) in range(baseline_start, when_drug): exTracesInBaseine.append(int(exTrace))
            
            # reads past the headers in first 3 lines
            for _ in range(3): atf_file.readline()
            
            for line in atf_file:
                
                # initializes variables from each line in the file
                tsv = line.strip().split('\t')
                trace = int(tsv[1])
                trace_time = tsv[2]
                peak_amp = tsv[3]
                absolute_amp = abs(float(peak_amp))


                # also excludes traces in the user list of inputted traces
                if trace in excluded_traces:
                    continue
                # excludes traces that have a z-score that is higher than the one inputted by user
                elif z_checking and abs(float(self.calc_z_score(peak_amp)) > z_limit):
                    continue
                # if the trace is within the baseline, it adds them together to calculate the baseline
                elif trace < baseline_start:
                    continue
                elif (trace >= baseline_start) and (trace < when_drug):
                    ampTotal += absolute_amp
                    traces_in_baseline += 1
                else:
                    break
            baseline = ampTotal / traces_in_baseline

            # resets the file to data before moving on
            atf_file.seek(0)
            for _ in range(3): atf_file.readline()

            # analyzes the data and writes to a new file
            with open('Post_Analysis.tsv', 'w') as newTSV:

                # write the headers of the data file
                newTSV.write('\t'.join(['Trace', 'Trace Start (ms)', 'Trace Start (minutes)', 'R1S1 Peak Amp (pA)',
                                       'Abs Val R1S1 Peak Amp (pA)', 'Normalized to Baseline (' + str(baseline)[:8] + ')',
                                       'Time From ' + drug_name + ' Addition', 'Color Code', 'Z-score']) + '\n')
                region_number = 0
                for line in atf_file:
                    
                    # initialize variables
                    tsv = line.strip().split('\t')
                    trace = tsv[1]
                    trace_int = int(trace)
                    trace_time = tsv[2]
                    peak_amp = tsv[3]
                    absolute_amp = abs(float(peak_amp))
                    normalized_amp = absolute_amp / baseline * 100
                    time_in_minutes = (float(trace_time) - float(self.offset_start)) / 60000
                    time_from_drug = time_in_minutes - (float(when_drug-1)) / traces_per_minute
                    last_region = False
                    
                    # sets up regions to apply certian color filters
                    current_region = str(region_number)
                    next_region = str(region_number+1)
                    try:
                        _ = color_regions_dict[next_region]
                    except KeyError:
                        last_region = True
                    except:
                        print('I do not work properly (I\'m at line 140 in Analysis.py). Come find me bitch!')

                    if not last_region:
                        if time_from_drug < color_regions_dict[current_region][0]:
                            color = default_color
                        elif time_from_drug >= color_regions_dict[current_region][0] and time_from_drug < color_regions_dict[current_region][1]:
                            color = color_regions_dict[current_region][2]
                        elif time_from_drug >= color_regions_dict[current_region][1] and time_from_drug < color_regions_dict[next_region][0]:
                            color = default_color
                            region_number += 1
                        elif time_from_drug >= color_regions_dict[next_region][0] and time_from_drug < color_regions_dict[next_region][1]:
                            color = color_regions_dict[next_region][2]
                            region_number += 1
                        else:
                            color = default_color
                    elif last_region:
                        if time_from_drug < color_regions_dict[current_region][0]:
                            color = default_color
                        elif time_from_drug >= color_regions_dict[current_region][0] and time_from_drug < color_regions_dict[current_region][1]:
                            color = color_regions_dict[current_region][2]
                        elif time_from_drug >= color_regions_dict[current_region][1]:
                            color = default_color
                        else:
                            print("shits broken bro at last region section line 166")
                    else:
                        print("wtf is happening rn line 145")


                    # if the trace is part of the excluded traces, or is going to be ignored for its z-score
                    # then the file will skip through the lines and ignore them
                    if z_checking and abs(float(self.calc_z_score(peak_amp)) > z_limit):
                        continue
                    if trace_int in excluded_traces:
                        continue
                    # since there is no '0' time point, we are removing that by noting when it becomes positive
                    if time_from_drug >= 0:
                        time_from_drug += (self.time_between_traces_min)
                        newTSV.write('\t'.join(
                            [str(trace), str(trace_time), str(time_in_minutes),
                                str(peak_amp), str(absolute_amp), str(normalized_amp),
                                str(time_from_drug)]))
                        newTSV.write('\t' + color + '\t' + self.calc_z_score(peak_amp) + '\n')

                    # anytime before the '0' time point
                    else:
                        newTSV.write('\t'.join(
                            [str(trace), str(trace_time), str(time_in_minutes),
                                str(peak_amp), str(absolute_amp), str(normalized_amp),
                                str(time_from_drug)]))
                        newTSV.write(
                            '\t' + color + '\t' + self.calc_z_score(peak_amp) + '\n')


        with open('Minute_Averaged.tsv', 'w') as minute_averaged_tsv:
            with open('Post_Analysis.tsv', 'r') as full_analysis_tsv:
                minute_averaged_tsv.write(
                    f"Time from {drug_name} Addition (min)\tAbs Val R1S1 Peak Amp Normalized to Baseline (pA)\tTrace Numbers Used in Average\tColor Code\n")
                minuteTimes = []
                traceNumbers = []
                traces = ''
                total = 0
                drugTime = -user_baseline
                minute_counter = -user_baseline + 1

                # skip past headers
                full_analysis_tsv.readline()

                for line in full_analysis_tsv:
                    tsv = line.strip().split('\t')
                    time_from_drug = tsv[6]
                    normalized_amplitude = tsv[5]
                    trace = tsv[0]
                    color = tsv[7]
                    if time_from_drug[0] == '-' and int(trace) + 1 < (when_drug - (user_baseline * traces_per_minute)):
                        continue

                    if (int(trace) + 1 >= (when_drug + (minute_counter * traces_per_minute + 1))):
                        minute_counter += 1
                        for entry in range(0, len(minuteTimes)): total += float(minuteTimes[entry])
                        avg = total / len(minuteTimes)
                        traces = ' '.join(traceNumbers)
                        minute_averaged_tsv.write('\t'.join([str(drugTime), str(float(avg)), traces, color]) + '\n')
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
                    minute_averaged_tsv.write('\t'.join([str(int(drugTime)), str(float(avg)), traces, color]) + '\n')

    def make_graphs(self, dpi: int, baseline: bool, baseline_color: str, axis_limits: list):
        # Creates the Minute Averaged graph
        with open('Minute_Averaged.tsv', 'r') as data:
            gdata = pd.read_csv(data, sep = '\t')
            headers = list(gdata.columns)
            sns.set(rc={'savefig.dpi': dpi})
            sns.set_theme(style='ticks')
            color_list = []            
            for index, row in gdata.iterrows():
                if row[headers[3]] not in color_list: color_list.append(row[headers[3]])
            sns.set_palette(sns.color_palette(color_list))
            g = sns.scatterplot(x=headers[0], y=headers[1], hue=headers[3], data=gdata, legend=False)
            if baseline:
                g.axhline(100, color=baseline_color).set_linestyle("--")
                baseline = True
            else:
                baseline = False
            g.set(xlim=(axis_limits[0], axis_limits[1]))
            g.set(ylim=(axis_limits[2], axis_limits[3]))
            g.set(title=f"Minute Averages Normalized to Baseline")
            sns.despine()
            graph1 = g.get_figure()
            graph1.savefig('Minute_Averages.png')
            importlib.reload(plt)
            importlib.reload(sns)

        # Creates the Post Analysis graph
        with open('Post_Analysis.tsv', 'r') as data2:
            gdata2 = pd.read_csv(data2, sep = '\t')
            headers2 = list(gdata2.columns)
            sns.set(rc={'savefig.dpi': dpi})
            sns.set_theme(style='ticks')
            color_list2 = []
            for index, row in gdata2.iterrows():
                if row[headers2[7]] not in color_list2: color_list2.append(row[headers2[7]])
            sns.set_palette(sns.color_palette(color_list2))
            g2 = sns.scatterplot(x=headers2[6], y=headers2[4], data=gdata2, hue=headers2[7], legend=False)
            baseline_float = float(re.split("\(|\)", headers2[5])[1])
            if baseline:
                g2.axhline(baseline_float, color=baseline_color).set_linestyle("--")
                baseline = True
            else:
                baseline = False
            g2.set(title=f"Peak Amplitude Over Time")
            g2.set(xlim=(axis_limits[4], axis_limits[5]))
            g2.set(ylim=(axis_limits[6], axis_limits[7]))
            sns.despine()
            graph2 = g2.get_figure()
            graph2.savefig('Post_Analysis.png')
            importlib.reload(plt)
            importlib.reload(sns)


file = 'test.atf'
drug_name = 'SNAP'
when_drug = 45
excluded_traces = []
z_limit = 2.5
z_checking = False
user_baseline = 10
color_regions_dict = {'0': [0,5,'red'], '1': [5,10,'blue'], '2': [20,30,'purple']}
default_color = 'grey'
####
dpi = 300
baseline = 10
baseline_color = 'purple'
axis_limits = [-user_baseline, 30, 25, 225, None, None, 0, None]
# main_program = Analysis()
# main_program.analyze_data(file, drug_name, when_drug, excluded_traces, z_limit, z_checking, user_baseline, color_regions_dict, default_color)
# main_program.make_graphs(dpi, baseline, baseline_color, axis_limits)

