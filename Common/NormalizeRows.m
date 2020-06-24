function [MNormalized] = NormalizeRows(M)
    M = M';
    minM = min(M);
    nr   = size(M, 1);
    minM = repmat(minM, nr, 1);
    M    = M - minM;
    maxM = max(M);
    maxM = repmat(maxM, nr, 1);
    MNormalized = M./maxM;
    MNormalized = MNormalized';
end

