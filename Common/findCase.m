function [cas] = findCase(C)
    switch C
        case 1 % 8_1
            cas = '8_1';
        case 2 % 16_2
            cas = '16_2';
        case 3 % 24_3
            cas = '24_3';
        case 4 % 8_1_16_2
            cas = '8_1_16_2';
        case 5 % 8_1_24_3
            cas = '8_1_24_3';
       case 6 % 16_2_24_3
            cas = '16_2_24_3';
        case 7
            cas = 'all';
    end;
end

