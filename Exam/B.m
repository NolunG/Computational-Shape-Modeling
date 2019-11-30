function B= getB (Dx,DZ,epsilon,n)
B=zeros(n,n);
for i=1:n
    for j=1:n
        if(DZ(i,j)-epsilon >=0 )
            B(i,j)=-Dx(i,j)/DZ(i,j);
        end
        if(DZ(i,j)-epsilon <0 )
            B(i,j)=0;
        end
        if(i==j )
            B(i,j)=0;
        end        
    end
end
for i=1:n
    B(i,i)=-sum(B(i,:));
end


