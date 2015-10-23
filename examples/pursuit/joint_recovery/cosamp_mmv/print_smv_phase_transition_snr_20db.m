close all;
clear all;
clc;

data_file_path = 'bin/smv_phase_transition_snr_20db.mat';
options.export = true;
options.export_dir = 'bin';
options.export_name = 'snr_20_db';
options.chosen_ks = [2, 4, 8, 16, 32, 64];
SPX_PhaseTransitionAnalysis.print_results(data_file_path, ...
    'CoSaMP @ 20 dB', options);
