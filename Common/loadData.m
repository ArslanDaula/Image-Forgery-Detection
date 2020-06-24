function [WLDhistoTrain, WLDhistoTrainLabel, WLDhistoTest, WLDhistoTestLabel] = loadData(T, M, S, patch, NumBlock)
% Load Feature Matrices
    patch = T*M*S*NumBlock*NumBlock;
    fileTrain = ['WLDhistoTrain', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S), '_B', num2str(NumBlock*NumBlock)];
   labelTrain = ['WLDhistoTrainLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S), '_B', num2str(NumBlock*NumBlock)];
    fileTest  = ['WLDhistoTest', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S), '_B', num2str(NumBlock*NumBlock)];
    labelTest = ['WLDhistoTestLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S), '_B', num2str(NumBlock*NumBlock)];
 
    WLDhistoTrain       = load (fileTrain);
    WLDhistoTrainLabel  = load (labelTrain);
    WLDhistoTest        = load (fileTest);
    WLDhistoTestLabel   = load (labelTest);
  
    WLDhistoTest       = WLDhistoTest.test_d'; 
    WLDhistoTrain      = WLDhistoTrain.train_d';
    WLDhistoTrainLabel = WLDhistoTrainLabel.train_l';
    WLDhistoTestLabel  = WLDhistoTestLabel.test_l';
    
    WLDhistoTest  = NormalizeRows(WLDhistoTest);
    WLDhistoTrain = NormalizeRows(WLDhistoTrain);
   % WLDhistoTrainLabel = (1+WLDhistoTrainLabel)/2;
   % WLDhistoTestLabel  = (1+WLDhistoTestLabel)/2;
    
    WLDhistoTrain  = WLDhistoTrain(:,1:patch);
    WLDhistoTest   = WLDhistoTest(:,1:patch);
end

