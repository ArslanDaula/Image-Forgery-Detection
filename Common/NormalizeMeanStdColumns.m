function [MNormalized] = NormalizeMeanStdColumns(M)
    meanM = mean(M);
    stdM  = std(M);
    nr    = size(M, 1);
    meanM = repmat(meanM, nr, 1);
    stdM  = repmat(stdM, nr, 1); I = stdM > 0;
    MI    = M - meanM;
    MI(I)    = MI(I)./stdM(I);
    maxMI = max(MI);
    minMI = min(MI);
    maxM  = [maxMI; abs(minMI)];
    maxM  = max(maxM);
    maxM  = repmat(maxM, nr, 1); I = maxM > 0;
    MI(I) = MI(I)./maxM(I);
    MNormalized = MI;
end

