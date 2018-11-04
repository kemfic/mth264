% Problem 2
% Composite Midpoint Rule

clear
clc
format long




% Assigned Functions
f1 = @(x) (x / sin(x));
f2 = @(x) ((exp(x)-1)/sin(x));
f3 = @(x) (asin(x)/x);

% derivatives of assigned functions
df1 = @(x) (1-x*cot(x))*csc(x);
df2 = @(x) (exp(x) + cot(x) -exp(x)*cot(x))*(csc(x));
df3 = @(x) ((x/(sqrt(1-x^2)))-asin(x))/(x^2);




% set which function you want to integrate.
f = df2;

n = 6; % n=8 once we get into the loop
a = 0.00000001;
b = pi/2;% pi/2, 1
dx= 0;


h = 0.000001;
df = @(x) (f(x+h)-f(x))/(h); %simpler solution; we can approximate the derivative!

arclen = @(x) sqrt(1+(f(x)^2)); % change f(x) to df(x) if you want to approximate instead of supplying f'(x)

dfarclen = @(x) (arclen(x+h)-arclen(x))/(h);
ddf = @(x) (dfarclen(x+h)-dfarclen(x))/(h); % approximate double derivative


prev = 0;


rounddown = @(x) floor(x * 10000); % modify this to set how many "correct" decimal places you want
error = 1;
while error ~= 0
    n = n+2;
    dx = (b-a)/n;
    smallsum = (((b - a) * dx^2) / 24) * ddf((a+b)/2);
    bigsum = 0;
    for g = a+dx:dx:b
        bigsum = bigsum + arclen((2*g-dx)/2);
    end
    compositeMid = smallsum + dx*bigsum;
    error = rounddown(prev) - rounddown(compositeMid);
    if error ~= 0
        prev = compositeMid;
    end
end


disp(n)
disp(prev)
disp(compositeMid)
