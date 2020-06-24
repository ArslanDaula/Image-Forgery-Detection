function createTrainTestData(pathm)
load Au;
load Sp;
% -------------------------------------------------------------------------
% Randomnly swap Authenticate data files and create training and test datafiles
% 50% of the Authenticate data files are used as training data
% -------------------------------------------------------------------------
Au1 = randswap(Au);
[m,n] = size(Au1);
m1 = round(m/2);
train_Au = Au1(1:m1,:); 
test_Au  = Au1(m1+1:m, :);
% -------------------------------------------------------------------------
% Randomnly swap Splice data files and create training and test datafiles
% 50% of the Splice data files are used as training data
% -------------------------------------------------------------------------
Sp1 = randswap(Sp);
[m,n] = size(Sp1);
m1 = round(m/2);
train_Sp = Sp1(1:m1,:);
test_Sp  = Sp1(m1+1:m,:);

save([pathm, '\MATFiles\','train_Au.mat'], 'train_Au');
save([pathm, '\MATFiles\','test_Au.mat'], 'test_Au');
save([pathm, '\MATFiles\','train_Sp.mat'], 'train_Sp');
save([pathm, '\MATFiles\','test_Sp.mat'], 'test_Sp');
clear all;
close all;