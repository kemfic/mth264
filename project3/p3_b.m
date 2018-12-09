clear
clc
format long

% Assigned Functions
f1 = @(x) sin(x.^2);
f2 = @(x) (x./sin(x)); 
f3 = @(x) (exp(x)-1)/sin(x);


f = f1;
a=0;
b=pi/2;

n = 1000;
dx = (b-a)/n;

X = a:dx:b;
fx = f(X);
M = max((fx))+dx;

intervals = transpose((1:n)) *(pi/n);
I = sin(intervals);
rando = rand(n,1);

x = a + I*(b-a);

y = rando * M;
mask = y < f(x);

mean(mask)*(M*(b-a))