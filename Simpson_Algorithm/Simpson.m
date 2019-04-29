function [I] = Simpson(x,y)
% By: Collin Elmer, 15 April 2019
% Function performs Numerical Integration using Simpson 1/3 rule (with 
% single trapezoidal rule if there is an odd number of segments)
%   INPUTS:
%   x - row array of tabulated independent data
%   y - row array of tabulated dependent data
%   OUTPUTS:
%   I - Numerical integration value

% check if the wrong number of inputs
if nargin < 2 || nargin > 2
    error('must input 2 equal lenth arrays')
end

% check if the length of x and y are not consistent
if length(x) ~= length(y)
    error('x and y must be an equal number of terms');
end

% define variables
I=0;
sumEven = 0;
sumOdd = 0;

%% equal spacing check

spaceCheck = linspace(x(1),x(length(x)),length(x));
for n = 1:length(x)
    if x(n)~=spaceCheck(n)
        error('x-array must have equal spacing')
    end
end

%% Define h and number of segments
h=abs(x(2)-x(1));
segments = length(x)-1;

%% Simpsons rule

% check if even or odd number of terms
% evenOdd variable keeps track of whether the number of segments is even or
% odd
if rem(segments,2) == 0
    % even
    evenOdd = 0;
elseif rem(segments,2) ~= 0
    % odd
    evenOdd = 1;
end

% sum of even terms (not the last one)
for m = 2:2:length(x)-1-evenOdd
    sumEven = sumEven + y(m);
end

% sum of odd terms (not the first one)
for k = 3:2:length(x)-2-evenOdd
    sumOdd = sumOdd + y(k);
end

% total 1/3 simpson rule
I = (h/(3))*(y(1) + 4*sumEven + 2*sumOdd + y(length(x)-evenOdd));

%% Trap code
% for only the last segment if odd number of segments
if evenOdd == 1    
    I = I + h*(y(length(x)-1)+y(length(x)))/2;
    fprintf('Trapezoidal rule was used on the last segment');
end

end