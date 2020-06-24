%function [log2c, log2g, cases]  = readParameters(T, M, S, numB, C)
function [param, cases]  = readParameters(T, M, S, numB, C)
    %nB = numB*numB;
    switch C
            case 1 % 8_1
                cases = '8_1';
            case 2 % 16_2
                cases = '16_2';
            case 3 % 24_3
                cases = '24_3';
            case 4 % 8_1_16_2
                cases = '8_1_16_2';
            case 5 % 8_1_24_3
                cases = '8_1_24_3';
           case 6 % 16_2_24_3
                cases = '16_2_24_3';
           case 7 % 16_2_24_3
                cases = 'All';
    end;
    range = sprintf('A%i:N%i', numB+1, numB+1);
    excelFileName = ['CSVMBestParametersRBF_CV', '_T', num2str(T), '_M', num2str(M), '_S', num2str(S), '_B_', cases, '_NR'];
    param = xlsread(excelFileName, range);
%     log2c = param(1);
%     log2g = param(2);
end

