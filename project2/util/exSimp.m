% 2018 Kemal Ficici
% MIT License

function out = exSimpson(a, b, dx):    
    out = 17*f(x[1]) + 59*f(x[2]) + 43*f(x[3]) + 49*f(x[4]);
    out = out + 48 * sum(f(x[5: end-4]));
    out = out + 49*f(x[end-3]) + 43*f(x[end-2]) + 59*f(x[end-1]) + 17*f(x[end]);            
    out = (dx/48) * out;
