function dis= getalldist( Z )
n=size(Z,1);
dis=zeros(n,n);
for i1=1:n
    for j1=1:n
        dis(i1,j1)=   (sum(((Z(i1,:)-Z(j1,:)).^2)))^(0.5);
    end
end







