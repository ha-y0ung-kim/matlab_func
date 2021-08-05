function y = Gray(nbit)
% Returns Gray coding of n bits
% INPUT - nbit: number of bits needed 
    y = {'0';'1'};
    if nbit == 1
        y = y;
    else
        for j = 1:nbit-1
            y = [y; flipud(y)];     
            for i = 1:2^(j)
                y(i) = strcat('0', y(i));
                y(i+2^j) = strcat('1', y(i+2^j));
            end
        end
    end        
end