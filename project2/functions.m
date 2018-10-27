% 2018 Kemal Ficici
% MIT License

function out = simpson(a, b, dx):
    x = a+dx :dx: b-dx;
    x1 = x(1:2:end); %Every even Interval
    x2 = x(2:2:end); %Every odd Interval
    out = (((4*sum(f(x1))) + (2*sum(f(x2))) + f(a) + f(b))* (dx / 3));
    
end

function out = compositeMid(a, b, dx):
    x = a+dx :dx: b-dx;
    x1 = x(1:2:end); %Every even Interval
    x2 = x(2:2:end); %Every odd Interval
    out = (((4*sum(f(x1))) + (2*sum(f(x2))) + f(a) + f(b))* (dx / 3));
    
end

function out = exSimpson(a, b, dx):
    x = a+dx :dx: b-dx;
    x1 = x(1:2:end); %Every even Interval
    x2 = x(2:2:end); %Every odd Interval
    
    out = 17*f(x[1]) + 59*f(x[2]) + 43*f(x[3]) + 49*f(x[4]) 
    out = out + 48 * sum(f(x[5: end-4])) 
    out = out + 49*f(x[end-3]) + 43*f(x[end-2]) + 59*f(x[end-1]) + 17*f(x[end]);            
    out = (dx/48) * out;
end