
function idxx = getcode(x, maxvaridx, sections, c)
% Find out which section the input is included 
% INPUT 
% x : input points
% maxvaridx : index of the maximum value group
% sections : section division values
% c : number of graph
% OUTPUT 
% idxx: index of the section where the inputs are located

    idxofmin = [];
    for i = 1:c
        fi = {};
        tmpa = [];
        for j = 1: length(sections)- 1
            fi{j} = find(x{maxvaridx}(i) > sections(j) & x{maxvaridx}(i) < sections(j+1));
            if fi{j} == 1
                idxx(i) = j;
            end
        end
    end
end
