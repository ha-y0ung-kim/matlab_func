function h = rrcfilter(nf,n,b,s)
% Root raised cosine filter
% INPUT
% nf : length of total x axis
% n : number of samples for filtering
% b : number of samples for roll off
% s : starting point

    h = zeros([1,nf]);
    t1 = 1:nf;
    h(1+s:s+n) = ones([1,n]);
    h(1+s:s+b) = (-cos(2*pi*t1(1:b)/(2*b))+1)*0.5;
    h(s+n-b+1:s+n) = (cos(2*pi*t1(1:b)/(2*b))+1)*0.5;
end