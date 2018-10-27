% 2018 Kemal Ficici
% MIT License

function out = compositeMid():    
    g = cat(2, [0;], x);
    g1  =cat(2, x, [0;]);
    
    g = (g+g1) / 2;
    g = g[2:end-1];
    
    out = ((b - a)* h.**2 / 24);
    out = out + ddf( (a+b)/2 );
    out = dx * sum( f(g) );
