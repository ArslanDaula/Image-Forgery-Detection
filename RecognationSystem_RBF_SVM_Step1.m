%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Recognition System Image Splice Detection WLD 
%   -----------------------------------------------------------------------
%   The classification involves the following steps:
%   1. Preprocessing
%       a. Set path
%       b. Create MAT files for data
%       c. Create Train and test data
%   2. Feature Extraction
%   3. Feature Selection
%   4. Modeling and Classification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ========================================================================
%                           STEP-1:PREPROCESSING
% =========================================================================
clear all;
clc;
% ---------------
% Set-up the path
% ---------------
path=pwd;
addpath(genpath(path)); savepath;
% ------------------------------------------------------------------------
% This function crearts data MAT files. It can be can be called once.
% The names of the data files are read and stored into MAT files.
% Call this function once
% -------------------------------------------------------------------------
createMAT(path);  
% ------------------------------------------------------------------------
% Randomnly swap data, and create test and training data files
% Call this function once.
% -------------------------------------------------------------------------
createTrainTestData(path); 
clear all;
