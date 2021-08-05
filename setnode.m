function nodes = setnode(n)
% function setnode setup the nodes accodring to the number of BE
% INPUT n : Number of BE excluding TX, RX
% OUTPUT nodes
% ex) if n = 2, nodes = {'TX', 'RX', 'BE1', 'BP1', 'BE2', 'BP2'}
    nodes = {'TX', 'RX'}; 
    for i = 1: n
      a = int2str(i);
      str = ['BP' a];
      str2 = ['BE' a];
      nodes{1,2+2*i} = str;
      nodes{1,2+2*i-1} = str2;
    end
end
