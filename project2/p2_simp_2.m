%
%    Find the minimum N required to yield 4 correct decimal places for each function using the following integration methods:
%        - Simpson's rule
%        - Composite Midpoint Rule
%        - Alternative Extended Simpson's Rule
%      
%    Start with N=8, and only use even values of N.

clear
clc
format long


n = 6; % n=8 once we get into the loop
a = 0.0000000001;
b = (pi / 2); % pi/2, 1

% Assigned Functions

f1 = @(x) (x / sin(x));
f2 = @(x) ((exp(x)-1)/sin(x)); 
f3 = @(x) (asin(x)/x);

f = f1;
deltaH = 1;
prev = 0;

method = @(x, dx) f(x) + 4*f(x + dx) + f(x + 2*dx);

while deltaH > 0.000001
    n = n+2;
    dx = (b-a)/n;
    H = 0;
    for i = 1:2:n
        xL = a+(i-1)*dx;
        H = H+method(xL, dx);
    end
    simpson = H*dx/3;
    deltaH = abs(simpson - prev);
    if deltaH > 0.00001 % this is here so we can compare values manually(sanity check)
        prev = simpson;
    end
end


disp(n)
disp(prev)
disp(simpson)
