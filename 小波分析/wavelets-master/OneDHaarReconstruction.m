% Returns the original pixel values of any one - dimensional wavelet transformation.

function A = OneDHaarReconstruction(C)

[m, l] = size(C);

if m ~= 1 
    disp('The input wavelet transformation is not one-dimensional');
    return;
end

% l = length(C);

if m == 1 && l == 1
    A = C;
    return; 
end

if floor(log2(l)) ~= log2(l)
    disp('The length of the input wavelet transformation is not power of 2');
    return;
end

A = zeros(1, l);

for i = 1:log2(l)
    
    z = 1;
    for j = 1:2^(i-1)
       A(z) =  C(j) + C(2^(i-1) + j);
       A(z + 1) = C(j) - C(2^(i-1) + j);
       z = z + 2;
    end
    A (2^(i) + 1: l) = C (2^(i) + 1:l);
    C = A;
end


end


