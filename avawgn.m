function y = avawgn(x,SNR,avnum, smoothfactor)
% INPUT 
% x : original function
% SNR : signal to noise ratio
% avnum : number of times to average the noise
% smoothfactor : smoothing factor, uncomment it when used
% OUTPUT
% average of AWGN generated for avnum of times is added to input signal x

    y1 = 0; % first awgn sample 
    y1 = awgn(x, SNR); 
    y = 20*log10(abs(y1)); 
    
    for i = 1:avnum
        y2 = 0; %other awgn sample
        y2 = awgn(x, SNR);
        y2 = 20*log10(abs(y2));
        y = [y2 y];
    end
    y = mean(y,2);
    %y = smooth(mean(y,2),smoothfactor);
    
    end