%==========================================================================
% function [bc, bg, d, cf] = ExtractBestParameters(M, nf)
% Function for evaluating the performance of C-SVM using 5X2 cross
% validation
% INPUT:
% =====
%     M : Matrix containing parameters: C, Gamma, degree, coefficient and
%         the correspionding sensitivity, specificity, accuracy values
%     nf: The number of the column in M that corresponds to the 
%         performance measure. Parameters are returned that give maximum
%         value related this measure.
% OUTPUT
% ======
%     bc: best value of C corresponding the given measure
%     bg: best value of g corresponding the given measure
%==========================================================================
function [bc, bg] = ExtractBestParameters_RBF(M, nf)
SortedM = SortMatrixWRTC(M, nf);
bc = SortedM(1, 1);
bg = SortedM(1, 2);

