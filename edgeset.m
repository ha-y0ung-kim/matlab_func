function [numwirestemp, srcConntemp, dscConntemp] = edgeset(n)
% function edgeset gives the edge settings of numwirestemp,
% srcConntemp, dscConntemp according to the BE number n
% INPUT n : number of BE excluding TX, RX
% for information of OUTPUT, check the documentation of MTL program

    numwirestemp = cell(1,2*n+1);
    srcConntemp = cell(1,2*n+1);
    dscConntemp = cell(1,2*n+1);
    
    for i = 1:2*n+1
      numwirestemp{i} = 2;
      srcConntemp{i} = [1 2];
      dscConntemp{i} = [1 2];
    end
end
