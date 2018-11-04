% Problem 3
% Composite Midpoint Rule

clear
clc
format long




% Assigned Functions
f1 = @(x) (x / sin(x));
f2 = @(x) ((exp(x)-1)/sin(x));
f3 = @(x) (asin(x)/x);

% set which function you want to integrate.
f = f3;

n = 6; % n=8 once we get into the loop
a = 0.00000001;
b = 1;% pi/2, 1
dx= 0;


h = 0.000001;
R = @(x) f(x)^2; % change f(x) to df(x) if you want to approximate instead of supplying f'(x)
df = @(x) (R(x+h)-R(x))/(h); %simpler solution; we can approximate the derivative!



ddf = @(x) (df(x+h)-df(x))/(h); % approximate double derivative


prev = 0;


rounddown = @(x) floor(x * 10000); % modify this to set how many "correct" decimal places you want
error = 1;
while error ~= 0
    n = n+2;
    dx = (b-a)/n;
    smallsum = (((b - a) * dx^2) / 24) * ddf((a+b)/2);
    bigsum = 0;
    for g = a+dx:dx:b
        bigsum = bigsum + R((2*g-dx)/2);
    end
    compositeMid = pi*(smallsum + dx*bigsum);
    error = rounddown(prev) - rounddown(compositeMid);
    if error ~= 0
        prev = compositeMid;
    end
end


disp(n)
disp(prev)
disp(compositeMid)
