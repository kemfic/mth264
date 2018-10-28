% 2018 Kemal Ficici
% MIT License
%
% Part 1 of project 2
% Find the minimum N required to yield 5 digits correctly. 


clear
clc
format long

addpath('../project2/util/') % import functions from util folder
source('util/simpson.m');

global f;
global x;
global a;
global b;
global dx;
global ddf;

% Assigned Functions
f1 = @(x) (x / sin(x));
f2 = @(x) ((exp(x)-1)/sin(x)); 
f3 = @(x) (asin(x)/x);


ddf1 = @(x) (csc(x)*((0-2)*cot(x) + x*cot(x)^2 + x*csc(x)^2));
ddf2 = @(x) (csc(x)*(exp(x) - 2*exp(x)*cot(x) + ((exp(x) - 1)*(cot(x)^2 + csc(x)^2))));
ddf3 = @(x) ((2*asin(x))/x^3 - 2/(x^2 * sqrt(1-x^2)) + 1/sqrt(( 1-x^2)^3));

f = f1;
ddf = ddf1;
a = 0.0001;
b = pi/2;
n = 6;
dx=(a-b)/n;


simpson = @(x, dx) (((4*sum(f(x(1:2:end)))) + (2*sum(f(x(2:2:end)))) + f(a) + f(b))* (dx / 3));
method = simpson;

%method = simpson; % simpson, exSimp, compositeMid



error = 100;

hCur = 0;
hPrev = -50;

while abs(error) > 0.000001
    dx = (b-a) / n;
    x = a+dx:dx:b-dx;
    
    hCur = method(x, dx);
    
    error = hCur - hPrev;
    hPrev = hCur;
    n = n+2;
end

disp(n);
disp(hCur);
