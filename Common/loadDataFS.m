%function [WLDhistoTrain, WLDhistoTrainLabel, WLDhistoTest, WLDhistoTestLabel] = loadDataFS(T, M, S, patch, NumBlock, C)
function [dataset] = loadDataFS(T, M, S, NumBlock, C)

% Load Feature Matrices
    patch = T*M*S*NumBlock*NumBlock;
    fileTrain = ['LTrain','_T', num2str(T), '_M', num2str(M), '_S', num2str(S),'_B',num2str(NumBlock*NumBlock)];
   labelTrain = [ 'LTrainLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S),'_B',num2str(NumBlock*NumBlock)];
    fileTest  = ['LTest', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S),'_B',num2str(NumBlock*NumBlock)];
    labelTest = ['LTestLabel', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S),'_B',num2str(NumBlock*NumBlock)];
 
 
    
    WLDhistoTrain       = load (fileTrain);
    WLDhistoTrainLabel  = load (labelTrain);
    WLDhistoTest        = load (fileTest);
    WLDhistoTestLabel   = load (labelTest);
  
    WLDhistoTest       = WLDhistoTest.test_d'; 
    WLDhistoTrain      = WLDhistoTrain.train_d';
    WLDhistoTrainLabel = WLDhistoTrainLabel.train_l';
    WLDhistoTestLabel  = WLDhistoTestLabel.test_l';
 
    %WLDhistoTest  = NormalizeRows(WLDhistoTest);
    %WLDhistoTrain = NormalizeRows(WLDhistoTrain);
    %WLDhistoTest  = NormalizeColumns(WLDhistoTest, -1, 1);
    %WLDhistoTrain = NormalizeColumns(WLDhistoTrain, -1, 1);
    %WLDhistoTest  = NormalizeMeanStdColumns(WLDhistoTest);
    %WLDhistoTrain = NormalizeMeanStdColumns(WLDhistoTrain);
    
    
    if(C < 7);
        switch C
            case 1 % 8_1
                WLDhistoTrain  = WLDhistoTrain(:,1:patch);
                WLDhistoTest   = WLDhistoTest(:,1:patch);
            case 2 % 16_2
                WLDhistoTrain  = WLDhistoTrain(:,1+patch:2*patch);
                WLDhistoTest   = WLDhistoTest(:,1+patch:2*patch);
            case 3 % 24_3
                WLDhistoTrain  = WLDhistoTrain(:,1+2*patch:3*patch);
                WLDhistoTest   = WLDhistoTest(:,1+2*patch:3*patch);
            case 4 % 8_1_16_2
                WLDhistoTrain  = WLDhistoTrain(:,1:2*patch);
                WLDhistoTest   = WLDhistoTest(:,1:2*patch);
            case 5 % 8_1_24_3
                WLDhistoTrain1  = WLDhistoTrain(:,1:patch);
                WLDhistoTest1    = WLDhistoTest(:,1:patch);
                WLDhistoTrain2  = WLDhistoTrain(:,1+2*patch:3*patch);
                WLDhistoTest2   = WLDhistoTest(:,1+2*patch:3*patch);
                WLDhistoTrain  = [WLDhistoTrain1 WLDhistoTrain2];
                WLDhistoTest   = [WLDhistoTest1 WLDhistoTest2];
           case 6 % 16_2_24_3
                WLDhistoTrain  = WLDhistoTrain(:,1+patch:3*patch);
                WLDhistoTest   = WLDhistoTest(:,1+patch:3*patch);
        end;
    end;
     WLDhistoTrain       = [WLDhistoTrain WLDhistoTrainLabel]'; 
     WLDhistoTest        = [WLDhistoTest WLDhistoTestLabel]';
     dataset             = [WLDhistoTrain WLDhistoTest]'; 
     dataset_d           = NormalizeColumns(dataset(:,1:end-1), -1, 1);
     %dataset_d           = NormalizeMeanStdColumns(dataset(:,1:end-1));
     %dataset_d           = NormalizeRows(dataset(:,1:end-1));
     dataset             = [dataset_d dataset(:,end)];
     dataset             =  randswap(dataset, 1);
end

