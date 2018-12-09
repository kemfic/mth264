clear
clc
format long

% Assigned Functions
f1 = @(x) sin(x.^2);
f2 = @(x) (sin(x.^2)); 
f3 = @(x) (2 * exp(-1 * (x.^2)));


f = f1;
a=0;
b=pi/2;

numBoxes = [2; 10; 100; 1000; 10000; ];

upperSum = [];
lowerSum = [];
midSum = [];
trapezoidSum = [];
simpsonSum = [] ;

n = 1000;
dx = (b-a)/ n;

% Lower Sum
x = a + rand(n,1)*(b-a);
lowerSum = sum(f(x)) * dx;

% Display Outputs
disp(' ')
disp('Lower Sum')
disp(lowerSum)
