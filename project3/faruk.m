clc
clear
format long

f = @(x) sin(x.^2);

n = 1000;
a = 0;
b = pi/2;
dx = (b-a)/n;
H = 0;

for i = 1:1:n
    xL = a + rand(1,1)*(b-a);
    H = H+f(xL);
end

A= H*dx