%% Returns the one - dimensional wavelet transformation of any 1D array of
%% the length of the power of 2.

function C = OneDHaarTransform(B)

[m, l] = size(B);

if m ~= 1 
    disp('The input Matrix is not one-dimensional');
    return;
end

% l = length(B);

if m == 1 && l == 1
    C = B;
    return; 
end

if floor(log2(l)) ~= log2(l)
    disp('The length of the input Matrix is not power of 2');
    return;
end

C = zeros(1, l);
% z = l;
z = 1;
a = l;

for i = 1:log2(l)
    for j = 1:2:a
        k = (B(j) + B(j + 1))/2;
%         C(z) = B(j) - k;
        C(z) = k;
        C(a/2 + z) = B(j) - k;
        z = z+1;    
    end
    
    a = a/2;
    B = C;
    z = 1;
end


end