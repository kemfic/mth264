% Composite Midpoint Rule

clear
clc
format long




% Assigned Functions
f1 = @(x) (x / sin(x));
f2 = @(x) ((exp(x)-1)/sin(x));
f3 = @(x) (asin(x)/x);

% double derivatives of functions
ddf1 = @(x) (csc(x)*(x*cot(x)^2 -2*cot(x)+ x*csc(x)^2));
ddf2 = @(x) (csc(x)*(exp(x) - 2*exp(x)*cot(x) + ((exp(x) - 1)*(cot(x)^2 + csc(x)^2))));
ddf3 = @(x) ((2*asin(x))/x^3 - 2/(x^2 * sqrt(1-x^2)) + 1/sqrt(( 1-x^2)^3));

% set which function you want to integrate.
f = f3;
ddf = ddf3;


n = 6; % n=8 once we get into the loop
a = 0.0000000001;
b = 1;% pi/2, 1

prev = 0;


rounddown = @(x) floor(x * 10000); % modify this to set how many "correct" decimal places you want
error = 1;
while error ~= 0
    n = n+2;
    dx = (b-a)/n;
    
    smallsum = (((b - a) * dx^2) / 24) * ddf((a+b)/2);
    bigsum = 0;
    for g = a+dx:dx:b
        bigsum = bigsum + f((2*g-dx)/2);
    end
    compositeMid = smallsum + dx*bigsum;
    
    
    error = rounddown(compositeMid) - rounddown(prev);
    if error ~= 0 % this is here so we can compare values manually(sanity check)
        prev = compositeMid;
    end
end


disp(n)
disp(prev)
disp(compositeMid)
