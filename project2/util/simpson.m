% 2018 Kemal Ficici
% MIT License

function out = simpson():
    x1 = x(1:2:end); %Every even Interval
    x2 = x(2:2:end); %Every odd Interval
    out = (((4*sum(f(x1))) + (2*sum(f(x2))) + f(a) + f(b))* (dx / 3));
