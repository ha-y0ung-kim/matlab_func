function [src, dst] = srcdstedge(n)
% function srcdstedge gets the src, dst settings according to n
% INPUT n : number of BE excluding TX, RX
% OUTPUT src, dst
% src = {'TX', 'BP1', 'BP1', 'BP2', 'BP2', 'BP3'..., 'BPn'}
% dst = {'BP1', 'BE1', 'BP2', 'BE2', 'BP3',..., 'BEn','RX'}
     src = cell(1, 2*n+1);
     dst = cell(1, 2*n+1);
     
     src{1,1} = 'TX';
     dst{2*n+1} = 'RX';
     
     for i = 1:n
       a = int2str(i);
       str = ['BP' a];
       str2 = ['BE' a];
       
       src{1,2*i} = str;
       src{1, 2*i+1} = str;
 
       dst{1,2*i-1} = str;
       dst{1,2*i} = str2;
     end
end