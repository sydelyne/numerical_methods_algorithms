function [root,fx,ea,iter] = falsePosition(func,xl,xh,es,maxiter)
% falsePosition takes in a symbolic function, initial bracketing xvalues,
% error cap(in percent), and the maximum number of iterations
% INPUTS
%   func is the symbolic function to be evaluated to find a root
%   xl is the original lower bound, xh is the original upper bound
%   es is the user-given maximum error that acts as a stopping point for
%       the falsePosition algorithm
%   maxiter is the user given maximum number of iterations of the
%       falsePosition algorithm, also acts as a stopping point
%   if es or maxiter are not given by the user, es defaults to 0.0001% and
%       maxiter defaults to 200
% OUTPUTS
%   root is the root found through the false position process
%   fx is the last calculated value of the function at the root found
%   ea is the last error calculation of the root
%   iter is the number of iterations
% By: Collin Elmer
% February 27, 2019


% if the number of arguments is less than 3, return an error, if nargin =
% 3, set the error and maxiter to default values
if nargin < 3
    error('Not enough arguments');
elseif nargin == 3
    es = .0001;
    maxiter = 200;
end

%arbitrary var presets:
xm = 1;
er = 100;
xmprev = 1;
iter = 0;

%calc initial y values at xl and xh by plugging in to the symbolic function
%given
yl = double(subs(func(xl)));
yh = double(subs(func(xh)));

%if the lower y value and upper y value have the same sign, there is no
%root dummy
if yl > 0 && yh > 0 || yl < 0 && yh < 0
    error('No root in these bounds');
end
    
while er>es && iter+1 <= maxiter
    
    %calc xm and the corresponding f(x) value
    xm = xh-(yh*(xl-xh))/(yl-yh);
    f = double(subs(func(xm)));
    
    % if the midpoint is negative and the upper value is negative, set xh =
    % xm, so on
    if f < 0 && yh < 0
        xh = xm;
    elseif f < 0 && yl < 0
        xl = xm;
    elseif f > 0 && yh > 0
        xh = xm;
    elseif f > 0 && yl > 0
        xl = xm;
    end
    
    %error calc
    if iter~=0
        er = abs((xm-xmprev)/xm)*100;
    end
    
    %save xm to xmprev AFTER the error calc so the next one can be
    %calculate
    xmprev = xm;
    
    %iterate the variable iter (used as a checking method for error calc)
    iter = iter + 1;
end

%store the output values in the function output variables
root = xm;
fx = f;
ea = er;

end