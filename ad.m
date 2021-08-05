function y = ad(x, f) 
% Function ad(x,f) change device impedence to admittance matrix in different dimension
% INPUT  x : impedenc matrix 
%        f : frequency
% OUTPUT admittance matrix of x in 3rd dimension(other is 0) 
    y = zeros(2,2, length(f));
    for i = 1:length(f)
    y(:,:,i) = diag([1/x(i) 0]);
    end
end
