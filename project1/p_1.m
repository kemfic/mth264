clear
clc
format long

% Assigned Functions
f1 = @(x) (4/(x.^2 + 1));
f2 = @(x) (sin(x.^2)); 
f3 = @(x) (2 * exp(-1 * (x.^2)));


f = f3;
a=0;
b=1;

numBoxes = [2; 10; 100; 1000; 10000; ];

upperSum = [];
lowerSum = [];
midSum = [];
trapezoidSum = [];
simpsonSum = [] ;


for n = numBoxes;
    dx = (b-a)/ n;

	% Lower Sum
    x = a:dx:b-dx;
    lowerSum = [lowerSum; sum(f(x)) * dx];

    % Upper Sum
    x = a+dx:dx:b;
    upperSum = [upperSum; sum(f(x)) * dx];

    % Sum using MidPoint Rule
    x = a:dx:b-dx;
    midSum = [midSum; sum(f(x + (dx/2))) * dx];
        
    % Sum using Trapezoid Rule
    x = a+dx:dx:b-dx;
    trapezoidSum = [trapezoidSum; (f(a) + 2*sum(f(x)) + f(b) ) * dx / 2];

    % Sum Using Simpsons Rule
    x = a+dx :dx: b-dx;
    x1 = x(1:2:end); %Every even Interval
    x2 = x(2:2:end); %Every odd Interval
    simpsonSum = [simpsonSum; (((4*sum(f(x1))) + (2*sum(f(x2))) + f(a) + f(b))* (dx / 3))];
end

% Display Outputs
disp(' ')
disp('Number of Partitions')
disp(numBoxes)
disp('Lower Sum')
disp(lowerSum)
disp('Upper Sum')
disp(upperSum)
disp('MidPoint Sum')
disp(midSum)
disp('Trapezoid Sum')
disp(trapezoidSum)
disp('Simpson Sum')
disp(simpsonSum)
