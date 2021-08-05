
function [aloc, alocf, alocH] = findmaxv(x, n)
addpath('../'); 
load('frequency.mat');
    % Find the local maximum points of the input
    % Save the values in a structure array
    % Convinent when there are several transfer functions
    % INPUT 
    % n : number of load
    % f : frequncy points (contained in frequency.mat)
    % x : input transfer function
    % OUTPUT 
    % Structure array of local maximum points.
    % aloc : local maximum points
    % alocf : frequency values of the local maximum 
    % alocH : Ampltude of the loc maximum

    for i = 1:n
        locmax = 0; % Initialize/Reset localmin values
        locmax = islocalmin(-x{i}, 'MinProminence',1); % Get peak points
        % Change MinPominence value according to useage
        aloc{i} = locmax;
        alocf{i} = f(locmax); 
        alocH{i} = x{i}(locmax); 
    end
end