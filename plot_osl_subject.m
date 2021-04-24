% Design, Control, and Clinical Implementation of an Open Source Bionic Leg
% Alejandro F. Azocar, afazocar@umich.edu
% Elliott Rouse, ejrouse@umich.edu
% 
% 31 July 2020
%
% Plot all data for 3 OSL subjects

%%% Strucuture hierarchy:
% osl_subject: contains mass and activity for each subject
% osl_subject.activity: contains sensor variables and other estimated data

%%% Variables included for the knee and ankle:
% accel_(x,y,z): accelerometer data, g
% angle: joint angle, deg
% angle_shank: shank angle relative to vertical, deg
% angle_thigh: thigh angle relative to vertical, deg
% current: measured motor current from Dephy, A
% current_qaxis: measured motor current in q-axis, A
% ground_reaction_force_vertical: estimated GRF from loadcell, bodyweight
%   fraction
% gyro_(x,y,z): gyroscope data, deg/s
% impedance_current_desired: impedance controller desired current, A/kg
%   note: this is the CBM's, not Dephy's, impedance controller
% impedance_damping: impedance controller damping, Nms/deg/kg
%   note: this is the CBM's, not Dephy's, impedance controller
% impedance_equilibrium_angle: impedance controller equilibrium angle, deg
%   note: this is the CBM's, not Dephy's, impedance controller
% impedance_stiffness: impedance controller stiffness, Nm/kg 
%   note: this is the CBM's, not Dephy's, impedance controller
% impedance_torque_desired: impedance controller desired torque, Nm/kg
%   note: this is the CBM's, not Dephy's, impedance controller
% loadcell_force_sagittal: force from resolving x and y forces, N/kg
%   note: this was needed because the x and y axes are rotated 45 deg from
%     the sagittal plane
% loadcell_force_(x,y,z): force from six-axis loadcell, N/kg
% loadcell_moment_(x,y,z): moment from six-axis loadcell, Nm/kg
% velocity: joint velocity, deg/s

% Cleanup and make pretty plots
clear all; close all; clc;
set(groot,'defaultAxesLineWidth',1.5,'defaultLineLineWidth',2,...
  'defaultFigureColor',[1 1 1],'defaultAxesFontSize',14,...
  'defaultFigurePosition',[10 100 1400 400],...
  'defaultAxesTitleFontWeight','normal');

% Load data
load osl_subject

% Get all variable names, except for percent_gaint
variable_labels = fieldnames(osl_subject(1).activity(1));
variable_labels(strcmp(variable_labels,'percent_gait')) = [];
activity_labels = {'\it Walking','\it Ramp Ascent','\it Ramp Descent',...
  '\it Stair Ascent','\it Stair Descent'};

% Get lengths for plotting
n_subject   = length(osl_subject);
n_activity  = length(activity_labels);
n_variable  = length(variable_labels);

%% Plots
% Loop through variables
for i_var = 1:n_variable
    figure
    
    % Loop through activities
    for i_act = 1:n_activity
        subplot(1,n_activity,i_act)
        hold all

        % Loop through subjects
        for i_sub = 1:n_subject
            plot(osl_subject(i_sub).activity(i_act).percent_gait,...
              osl_subject(i_sub).activity(i_act).(variable_labels{i_var}))
        end
        
        if i_act == 1
            ylabel(variable_labels{i_var},'Interpreter','none')
        elseif i_act == 3
            xlabel('Percent Gait')
        end
        title(activity_labels{i_act})
    end
end