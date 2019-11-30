clear;
close all;
load('dMDS.mat');
%Z & B are as described in algortihm in class Dx is from dMDS

dim=size(Dx,1);

Z=rand(dim,2);  %asked to plot on 2d, that's why dim*2

iter=100;
eps = 0.01;

Dist=getdistall(Z);
B=getB(Dx,Dist,eps,dim);

for i=2:iter
    Znew=(1.0/dim)*B*Z;
    Z=Znew;    
    Dist=getdistall(Znew);
    B=getB(Dx,Dist,eps,dim);
end
x = Z(:,1);
y = Z(:,2);
plot(x,y,'*r')
title('Last Configuration')

