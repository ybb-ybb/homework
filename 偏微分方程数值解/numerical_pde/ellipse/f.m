function z = f( X, Y, n )
%F the function on the right hand side of (1.1) 
    z = 4 * n*n*pi*pi*(sin(2*n*pi.*X)+sin(2*n*pi.*Y) )  - 2  ;
end

