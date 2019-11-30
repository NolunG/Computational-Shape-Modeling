function edges = findedges(surface)

x = surface.X;
y = surface.Y;
z = surface.Z;
tri = surface.TRIV;
edges = [];  % can be slow, try to optimize
done1 = zeros(size(x));
done2 = zeros(size(x));

for i=1:length(tri)
    
    if(~(done1(tri(i,1)) && done2(tri(i,2))))
        edges = [edges; tri(i,1) tri(i,2)];
        done1(tri(i,1))=1;
        done2(tri(i,2))=1;
    end;
    
    if(~(done1(tri(i,2)) && done2(tri(i,3))))
        edges = [edges; tri(i,2) tri(i,3)];
        done1(tri(i,2))=1;
        done2(tri(i,3))=1;
    end;
    
    if(~(done1(tri(i,1)) && done2(tri(i,3))))
        edges = [edges; tri(i,1) tri(i,3)];
        done1(tri(i,1))=1;
        done2(tri(i,3))=1;
    end;
end;

