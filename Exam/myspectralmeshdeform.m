function ret = myspectralmeshdeform(V, tri , handles , handledeforms)

% Here handles are the indices of fixed and moving vertices(vh*1)  and
% handledeforms are corresponding deformation vectors(vh*3)
% V is co-ordinates list of mesh , V = [x y z] 
% tri is triangles of the mesh, which have indices of co-ordinates
% participating in triangle
close all;

x = V(:,1);
y = V(:,2);
z = V(:,3);
trisurf(tri,x,y,z);
%constants for streching and bending
ks = 10; 
kb = 10;  
[Alb,Lc,Lb] = computeLaplaceBeltrami(V,tri);

[S ,V, D] = svd(Lb);

figure;



LHS = ks*Lb + kb*Lb*Lb; 
RHS = zeros(size(Lb,1),3);

d = hardConstrainSolve(LHS, RHS, handles, handledeforms);
%d2 = hardConstrainSolve(LHS, RHS, handles, handledeforms(:,2));
%d3 = hardConstrainSolve(LHS, RHS, handles, handledeforms(:,3));

%d = [d1 d2 d3];
d
%d2
%d3
V = V+d;

trisurf(tri,V(:,1),V(:,2),V(:,3));
