function B = TwoDHaarCompress(A, error)

[m, n]=size(A);
A=A(:);
B = NewOneDHaarCompress(A,error);
B = reshape(B, m, n);
end