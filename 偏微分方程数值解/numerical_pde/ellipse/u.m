function z = u( X, Y, n )
% u(x,y), and n is a parameter to control the frequency
    z = sin(2*pi*n.*X)+ sin(2*pi*n.*Y) + X.*X  ;
end

