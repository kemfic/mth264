%
% Alternative Extended Simpson's Rule
%

clear
clc
format long

% Assigned Functions
f1 = @(x) (x / sin(x));
f2 = @(x) ((exp(x)-1)/sin(x)); 
f3 = @(x) (asin(x)/x);

% set the function  you want to integrate
f = f1;
a = 0.0000000001;
b = pi/2; % pi/2, 1

n = 6; % n=8 once we get into the loop
error = 1;
prev = 0;


rounddown = @(x) floor(x * 10000); % modify this to set how many "correct" decimal places you want
while error ~= 0
    n = n+2;
    dx = (b-a)/n;
    smallsum = 17*f(a) + 59*f(a+dx) + 43*f(a+2*dx) + 49*f(a+3*dx) +49*f(b-3*dx) + 43*f(b-2*dx) + 59*f(b-dx) + 17*f(b);
    bigsum = 0;
    
    for i = a+4*dx:dx:b-4*dx
        bigsum = bigsum + f(i);
    end
    simpson = (dx/48) * (smallsum + 48*bigsum);
    error = rounddown(simpson) - rounddown(prev);
    if error ~= 0 % this is here so we can compare values manually(sanity check)
        prev = simpson;
    end
end


disp(n)
disp(prev)
disp(simpson)
