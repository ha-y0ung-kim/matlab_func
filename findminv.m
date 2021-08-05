
function [aloc, alocf, alocH] = findminv(x, n)
addpath('../'); 
load('frequency.mat');
    % Find the local minimum points of the input
    % Save the values in a structure array
    % Convinent when there are several transfer functions
    % INPUT 
    % n : number of load
    % f : frequncy points (contained in frequency.mat)
    % x : input transfer function
    % OUTPUT 
    % Structure array of local minimum points.
    % aloc : local minimum points
    % alocf : frequency values of the local minimum 
    % alocH : Ampltude of the loc minimum

    for i = 1:n
        locmin = 0; % Initialize/Reset localmin values
        locmin = islocalmin(x{i}, 'MinProminence',1); % Get peak points
        % Change MinPominence value according to useage
        aloc{i} = locmin; 
        alocf{i} = f(locmin);
        alocH{i} = S12final{i}(locmin); 
    end
end