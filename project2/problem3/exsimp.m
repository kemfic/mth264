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

% Derivatives of assigned functions
df1 = @(x) (1-x*cot(x))*csc(x);
df2 = @(x) (exp(x) + cot(x) -exp(x)*cot(x))*(csc(x));
df3 = @(x) ((x/(sqrt(1-x^2)))-asin(x))/(x^2);


f = df3; % set which function you want to integrate
arclen = @(x) sqrt(1+(f(x))^2)

a = 0.0000000001;
b = 0.9999; % pi/2, 0.9999

n = 6; % n=8 once we get into the loop
error = 1;
prev = 0;


rounddown = @(x) floor(x * 10000); % modify this to set how many "correct" decimal places you want
while error ~= 0
    n = n+2;
    dx = (b-a)/n;
    smallsum = 17*arclen(a) + 59*arclen(a+dx) + 43*arclen(a+2*dx) + 49*arclen(a+3*dx) +49*arclen(b-3*dx) + 43*arclen(b-2*dx) + 59*arclen(b-dx) + 17*arclen(b);
    bigsum = 0;
    
    for i = a+4*dx:dx:b-4*dx
        bigsum = bigsum + arclen(i);
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
