function C = OneDHaarCompress(B,e)

A = sort(B);
l=length(B);
j=0;
sum=0;
p  = 0;
for k=1:l
    if sum<=e
        sum = sum + (A(k)^2);
        
        if k >1
            if A(k) == A(k-1)
                p = 1;
                temp = A(k);
            end
        end
            
        j=j+1;
        
    else
        break;
    end
        
end
for i=1:j-1
    B=B(B~=A(i));
    if p == 1
        B(end + 1) = temp;
    end
    C=B;
end
end