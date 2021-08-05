function [midpoint, midpointf, point3dB] = getmid3db(x, alocf, alocH, f, c)
% Get the nearest two point that is 3dB lower than the local maxima
% from those two point, get the middle point
% INPUT
% x: original tranfer function
% alocH : Amplitude values of local maxima of x
% alocf : frequency values of local maxima of x
% f : orginal tranfer function frequency values
% c : number of transfer functions
% OUTPUT
% midpoint : middle point 
% midpointf: frequency values of the middle point
% point3dB : Amplitdue values of the middle point
for v = 1:c
    midpoint = [];
    point3dBf = [];
    for i = 1:length(alocf{v})
        tmpA = find(abs(x{v} - (alocH{v}(i) - 3))<0.5);
        [~, minidx] = min(abs(alocf{v}(i)-f(tmpA)));
    
        if minidx < 2
            point3dB = [tmpA(minidx) tmpA(minidx)];
        elseif minidx == 1
            point3dB = [tmpA(minidx), tmpA(minidx+1)];
        elseif minidx == length(tmpA)
            point3dB = [tmpA(minidx-1), tmpA(minidx)];
            
        elseif f(tmpA(minidx))<alocf{v}(i)
            point3dB = [tmpA(minidx), tmpA(minidx+1)];
        elseif f(tmpA(minidx))>alocf{v}(i)
            point3dB = [tmpA(minidx-1), tmpA(minidx)];
        end

        point3dBf = [point3dBf;point3dB];

    end
    for i = 1:length(point3dBf)-1
        if f(point3dBf(i,2))>alocf{v}(i+1)
            point3dBf(i,2) = point3dBf(i+1,1);
        elseif f(point3dBf(i+1,1))<alocf{v}(i)
            point3dBf(i+1,1) = point3dBf(i,2);
        end
    end

    for i = 1:length(point3dBf)  
        tp = (f(point3dBf(i,1))+f(point3dBf(i,2)))/2;
         midpoint = [midpoint tp];
    end

    midpointf{v} = midpoint;
end

