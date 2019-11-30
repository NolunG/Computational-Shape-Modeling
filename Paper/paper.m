close all;
clear all;
load('centaur0.mat')
x = surface.X;
y = surface.Y;
z = surface.Z;
tri = surface.TRIV;
V = [x y z];
edges = findedges(surface);

[A,B] = computeAB(V,tri);
[alb,ac,LB] = computeLaplaceBeltrami(V,tri);
LB = full(LB);
LB2 = full(inv(A)*B);

gradient(1,2,3,surface)

