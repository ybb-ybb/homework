function B = NewOneDHaarCompress(B, error)

A = sort(B);
l = length(B);

counter = 0;
sum = 0;
for i = 1:l
    
    if sum <= error
        sum = sum + (A(i)^2);
        counter = counter + 1;
    else
        break;
    end
    
end

for i = 1:counter-1
    K = find(ismember(B, A(i)));
    B(K(1)) = 0;
end



end

% function C = OneDHaarCompress(B,e)
% 
% A = sort(B);
% l=length(B);
% j=0;
% sum=0;
% for k=1:l
%     if sum<=e
%         sum = sum + (A(k)^2);
%         j=j+1;
%     else
%         break;
%     end
%         
% end
% for i=1:j-1
%     B=B(B~=A(i));
%     C=B;
% end
% end