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

f = f2;
deltaH = 1;
prev = 0;

while deltaH > 0.0001
    n = n+2;
    dx = (b-a)/n;
    smallsum = 17*f(a) + 59*f(a+dx) + 43*f(a+2*dx) + 49*f(a+3*dx) +49*f(b-3*dx) + 43*f(b-2*dx) + 59*f(b-dx) + 17*f(b);
    bigsum = 0;
    
    for i = a+4*dx:dx:b-4*dx
        bigsum = bigsum + f(i);
    end
    simpson = (dx/48) * (smallsum + 48*bigsum);
    deltaH = abs(simpson - prev);
    if deltaH > 0.0001 % this is here so we can compare values manually(sanity check)
        prev = simpson;
    end
end


disp(n)
disp(prev)
disp(simpson)
