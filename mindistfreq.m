function [IIED, MMED, maxvaridx] = mindistfreq(midpointf, c)
% mineucdist function group the closest minimas together according to the min
% frequency values and choose one group with maximum variance
% INPUT  alocf : frequency values of local minimas
%        alocH : Amplitude values of local minimas
%        c : number of graphs
% OUTPUT IIED : index of minimum euclidian distance
%        MMED : frequency values of minimum euclidian distance
%        HHED : amplitude values of min euclidian distance
%        maxvaridx : group index with the maximum variance
    IIED = {};
    MMED = {};
    for j = 1: length(midpointf{1}) % We set the first graph as reference, change the reference if neccesarry
        med = 0;
        ied = 0;
        for k = 1:c
            IED = 0;
            ed = 0;
            for i = 1: length(midpointf{k})
                ed(i) = abs(midpointf{1}(j)-midpointf{k}(i)); %euclidean distance
            end
            [~, IED] = min(ed); % get the index of the closest point
            ied(k) = IED;
            med(k) = midpointf{k}(IED);
        end
        IIED{j} = ied;
        MMED{j} = med;
    end
    
    vared = 0;
    for i = 1:length(IIED) % Choosing the group with maximum variance
        vared(i) = var(MMED{i});
    end

    [~, maxvaridx] = max(vared);
end