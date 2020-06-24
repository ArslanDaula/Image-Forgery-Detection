function [WLDhistoTrain, WLDhistoTrainLabel, WLDhistoTest, WLDhistoTestLabel] = uploadData(T, M, S, patch)
% Load Feature Matrices
    fileTrain = ['WLDhistoTrain', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S)];
   labelTrain = ['WLDhistoTrainLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S)];
    fileTest  = ['WLDhistoTest', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S)];
    labelTest = ['WLDhistoTestLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S)];
 
    WLDhistoTrain       = load (fileTrain);
    WLDhistoTrainLabel  = load (labelTrain);
    WLDhistoTest        = load (fileTest);
    WLDhistoTestLabel   = load (labelTest);
  
%     WLDhistoTrain      = load ([featurepath, 'WLDhistoTrain', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S)]);
%     WLDhistoTrainLabel = load ([featurepath, 'WLDhistoTrainLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S)]);
%     WLDhistoTest       = load ([featurepath, 'WLDhistoTest', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S)]);
%     WLDhistoTestLabel  = load ([featurepath, 'WLDhistoTestLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S)]);
    WLDhistoTest = WLDhistoTest.test_d'; 
    WLDhistoTrain = WLDhistoTrain.train_d';
    WLDhistoTrainLabel = WLDhistoTrainLabel.train_l';
    WLDhistoTestLabel  = WLDhistoTestLabel.test_l';
end

