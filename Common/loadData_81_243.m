function [WLDhistoTrain, WLDhistoTrainLabel, WLDhistoTest, WLDhistoTestLabel] = loadData_81_243(T, M, S, patch, NumBlock)
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
    
    WLDhistoTrain1  = WLDhistoTrain(:,1:patch);
    WLDhistoTest1   = WLDhistoTest(:,1:patch);
    WLDhistoTrain2  = WLDhistoTrain(:,1+2*patch:3*patch);
    WLDhistoTest2   = WLDhistoTest(:,1+2*patch:3*patch);
    WLDhistoTrain   = [WLDhistoTrain1 WLDhistoTrain2];
    WLDhistoTest    = [WLDhistoTest1 WLDhistoTest2];
end

