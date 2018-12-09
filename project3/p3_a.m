clear
clc
format long

% Assigned Functions
f1 = @(x) sin(x.^2);
f2 = @(x) (x./sin(x)); 
f3 = @(x) ((exp(x)-1)/(sin(x)));


f = f3;
a=0;
b=pi/2;

n = 1000;
dx = (b-a)/ n;

% Lower Sum
x = a + rand(n,1)*(b-a);
lowerSum = sum(f(x)) * dx;

disp(sum(lowerSum))