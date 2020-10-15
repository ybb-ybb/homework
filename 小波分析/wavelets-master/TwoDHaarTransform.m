function C = TwoDHaarTransform(B)

[m, n]=size(B);

for j=1:m
% j = 1:m;
Row=OneDHaarTransform(B(j,:));
B(j,:)=Row;
end

for i=1:n
% i = 1:n;
column=B(:,i);
column=column';
row=OneDHaarTransform(column);
B(:,i)=row';
end

C=B;

end