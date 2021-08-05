function y = cnt_char_diff(chas1, chas2)
% find the number of different charaters between two char
% INPUT 
% chas1, chas2 : two char used for comparison
% OUTPUT y : number of differet characters
    y = 0;
    for i = 1:length(chas1)
        if chas1(i) ~= chas2(i)
            y = y+1;
        end
    end
end