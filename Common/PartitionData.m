function [train_d, train_l, test_d, test_l] = PartitionData(dataset, incr_s, incr_e)
    %dataset = randswap(dataset, 1);
    [nr, nc] = size(dataset);
    train_d = dataset(incr_s:incr_e, 1:nc-1);
    train_l = dataset(incr_s:incr_e, nc);
    test_d1  = dataset(1:incr_s-1, 1:nc-1)';
    test_l1  = dataset(1:incr_s-1, nc)';
    test_d2  = dataset(incr_e+1:nr, 1:nc-1)';
    test_l2  = dataset(incr_e+1:nr, nc)';
    test_d   = [test_d1 test_d2]';
    test_l   = [test_l1 test_l2]';
end

