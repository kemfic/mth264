clear
clc
format long

% Assigned Functions
f1 = @(x) sin(x.^2);
f2 = @(x) (x./sin(x)); 
f3 = @(x) ((exp(x)-1)/(sin(x)));


f = f1;
a=0;
b=pi/2;

n = 1000;
dx = (b-a)/n;

X = a:dx:b;
fx = f(X);
M = max((fx))+dx;

x = a + rand(n,1)*(b-a);
y = rand(n,1) * M;

mask = y < f(x);

mean(mask)*(M*(b-a))