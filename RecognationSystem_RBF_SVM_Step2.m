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
% =========================================================================
clear all;
clc;
% ---------------
% Set-up the path
% ---------------
path=pwd;
addpath(genpath(path)); savepath;
%% ========================================================================
%                        STEP-2:FEATURE EXTRACTION
% =========================================================================
% Calculate features and store them into a matrix such
% that each row of the matrix is a feacture vector corresponding to one
% sample. This part will extract WLD features and will store in 'FeatureSets' 
% -----------------------------------------------------------------------
% Load Data Files
% clear all;
load train_Au;
load train_Sp;
load test_Au;
load test_Sp;
% %Change this path according to the location of your files
 featurepath =[path,'\FeatureSets\'];
 T_val=[4, 6, 8, 12];
 M_val=[4,6];
 S_val=[4,5, 6, 8, 10, 15, 20];
 for i=1;
  for j=1;
      for k=7;
      T=T_val(i); M=M_val(j); S=S_val(k);
        for NumBlock=1;        
               param.T = T; param.M = M; param.S = S; param.NumBlock=NumBlock;
             [train_d, train_l] = ComputeLocalWLDFeaturesBlock(train_Au, train_Sp, param);
             [test_d, test_l]   = ComputeLocalWLDFeaturesBlock(test_Au, test_Sp, param);
             save([featurepath, 'LTrain', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S),'_B',num2str(NumBlock*NumBlock)], 'train_d');
             save([featurepath, 'LTrainLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S),'_B',num2str(NumBlock*NumBlock)], 'train_l');
             save([featurepath, 'LTest', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S),'_B',num2str(NumBlock*NumBlock)], 'test_d');
             save([featurepath, 'LTestLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S),'_B',num2str(NumBlock*NumBlock)], 'test_l');
             clear train_d; clear train_l;
             clear test_d; clear test_l;
        end;
      end;
  end;
 end;
%------------------------------------------------------------------------
%These files are not needed now, so close them
 clear train_Au; clear train_Sp;
 clear test_Au; clear test_Sp;
clear all;