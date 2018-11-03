% Problem 1
% Simpson's rule

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


f = df2; % set which function you want to integrate
arclen = @(x) sqrt(1+(f(x))^2)

a = 0.00000001;
b = pi/2;%0.9999; % pi/2, 0.9999

simpson = @(x,dx) arclen(x) + 4*arclen(x + dx) + arclen(x + 2*dx);
n = 8;
H = 0;
Aold = 0;
dx = (b-a)/n;

for i = 1:2:n
    xL = a+(i-1)*dx;
    H = H+simpson(xL, dx);
end

Anew = H*dx /3;
error = 1;

rounddown = @(x) floor(x * 10000); % modify this to set how many "correct" decimal places you want
while error ~= 0 
    % compare how many digits are "incorrect"
    % Anew -  Aold > 0.0001 doesn't work since 1.00012 and 1.00009 would come out to be true
    Aold = Anew;
    n = n+2;
    dx = (b-a)/n;
    H=0;
    for g = 1:2:n
        xL = a+(g-1)*dx;
        H = H+simpson(xL, dx);
    end
    Anew = H*dx/3;
    error = abs(rounddown(Anew) - rounddown(Aold));
end

disp(n)
disp(Aold)
disp(Anew)
