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
%                    STEP-4:MODELING AND CLASSIFICATION
% =========================================================================
cross_n=10;
featurepath =[path, '\FeatureSets\'];
T_val=[4, 6, 8, 12];
M_val=[4,6];
S_val=[4,5, 6, 8, 10, 15, 20];
 for i=1;
  for j=1;
      for k=7;
      T=T_val(i); M=M_val(j); S=S_val(k);
        for NumBlock=1;        
             for C=7;
          % Load Feature Matrices 
       patch= T*M*S;
       [dataset]= loadDataFS(T,M,S,NumBlock,C);
      % [log2c, log2g, cf] = SelectOptimalParameters(dataset); 
       numFeatures=size(dataset, 2)-1;
       Exclerow = 1;
       labels = { 'T' 'M' 'S' 'log2c' 'log2g' 'Sensitivity' 'Std' 'Specificity' 'Std' 'Accuracy' 'Std' 'AUC' 'Std' 'TFeatures' 'FeaturesFS' 'sig' 'lam'};
       range = sprintf('A%i:Q%i', Exclerow, Exclerow);
        excelFileName= [path,'\Results\', 'FS_SUN_RBF_10CV','_T',num2str(T),'_M',num2str(M),'_S',num2str(S),'_B',num2str(NumBlock),'_C',num2str(C),'_NR_WLD_WholeIm'];
        xlswrite(excelFileName, labels, range);
        Exclerow = Exclerow +1; 
        %Evaluation using n-fold cross-validation, the defualt value is 5.
        % You can change this value
        %  ------------------------------------------------------------------------
        log2c = 13;  log2g = -21; cf = -14; d = 3;
        log2c = -11;  log2g = -7.5; cf = 16.5; d = 4;
        log2c = -3;  log2g = -3; cf = 10; d = 2;
        p= CSVMClassifyWithCV(dataset, cross_n, log2c, log2g, cf, d);        
        %write Best parameteres into excel file (accuracy)  
         val2 = [ T, M, S,  log2c, log2g, p.Sen_mean, p.Sen_std, p.Spec_mean, p.Spec_std, p.acc_mean, p.acc_std, p.auc_mean, p.auc_std, numFeatures, numFeatures, 0, 0];
         range = sprintf('A%i:Q%i', Exclerow, Exclerow);
            WriteBestParametresinExcelFile(val2, excelFileName, range);
            Exclerow = Exclerow+1;     
            % Select Featues        
                    for sig = 0.1:0.2:2;   
                        for lam = 0.1:0.2:2;
                            param.sig = sig; param.lam = lam; 
                            tic;
                            %SUN PAMI Algorithm for feature Selection
                           [FSdataset] = OptSelectFeatureSUN(dataset, param);
                            time = toc; disp(time);
                            numFeaturesFS = size(FSdataset, 2)-1;
                            % -----------------------------------------------------------------
                            % Evaluation using n-fold cross-validation, the default value is 5. 
                            % -----------------------------------------------------------------
                            cross_n = 10;
                            [log2c, log2g, cf] = SelectOptimalParameters(FSdataset);
                            p= CSVMClassifyWithCV(FSdataset, cross_n, log2c, log2g, cf, d);
                            % Write Best parameters into excel file (accuracy)
                            val2 = [T, M, S, log2c, log2g, p.Sen_mean, p.Sen_std, p.Spec_mean, p.Spec_std, p.acc_mean, p.acc_std, p.auc_mean, p.auc_std, numFeatures, numFeaturesFS, sig, lam];
                            range = sprintf('A%i:Q%i', Exclerow, Exclerow);
                            WriteBestParametresinExcelFile(val2, excelFileName, range); 
                            Exclerow = Exclerow+1;
                        end;  
                    end;
     end;
    end; 
  end;  
 end;
 end;  
 clear all; 
%===================================================================================================================================
