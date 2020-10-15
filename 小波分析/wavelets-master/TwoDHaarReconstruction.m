function C = TwoDHaarReconstruction(B)

[m, n]=size(B);

for i=1:n
% i = 1:n;
column=B(:,i);
column=column';
row=OneDHaarReconstruction(column);
B(:,i)=row';
end

for j=1:m
% j = 1:m;
Row=OneDHaarReconstruction(B(j,:));
B(j,:)=Row;
end



C=B;

end