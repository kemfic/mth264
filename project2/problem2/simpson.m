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
df2 = @(x) ((exp(x)-(exp(x)*cot(x)) + cot(x))*csc(x))
df3 = @(x) ();

f = f3; % set which function you want to integrate
a = 0.0000000001;
b = 1; % pi/2, 1

simpson = @(x,dx) f(x) + 4*f(x + dx) + f(x + 2*dx);
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
