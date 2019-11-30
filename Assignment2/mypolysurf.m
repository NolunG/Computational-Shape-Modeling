function ret = mypolysurf(a,inp)



if size(a,1) < size(a,2)
    a = a';
end;
close all;
inp = [0,0];  %input vector of u,v
c = 5;
%a = [0,0,1,1,1,1,0,0,0,0,0,0,0,0,0]';  % coefficient vector a
m = max(size(a));

u0 = inp(1);
v0 = inp(2);
n = (-3 + sqrt(9 + 8*(m-1)))/2;  %calculated n from m given in the vector a


x = u0-5:0.05:u0+5;
y = v0-5:0.05:v0+5;
[X,Y] = meshgrid(x,y);    %creating mesh for ploting.
Z = zeros(length(x),length(y));

for i = 1:length(X)
    for j = 1:length(Y)
        Z(i,j) = sum( func(m,n,x(i),y(j)).*a );     %func returns given polynomial functions value at x(i),y(j)
    end;
end;
figure;



%sigmau = [1, 0 , differ(m,n,1,1,1)];
Z = Z + 0.5;
sigmau = [1,0,differ(m,n,u0,v0,1)]
sigmav = [0,1,differ(m,n,u0,v0,2)]
normal = cross(sigmau,sigmav)
n0 = norm(normal);
differ(m,n,u0,v0,1);
%to plot sigmau and sigmav - bases of tangent space
U = zeros(size(Z));
V = zeros(size(Z));
W = zeros(size(Z));
U((length(x)+1)/2,(length(y)+1)/2) = sigmau(1);
V((length(x)+1)/2,(length(y)+1)/2) = sigmau(2);
W((length(x)+1)/2,(length(y)+1)/2) = sigmau(3);
 %hold on;
quiver3(X,Y,Z,U,V,W,c)
hold on;

U((length(x)+1)/2,(length(y)+1)/2) = sigmav(1);
V((length(x)+1)/2,(length(y)+1)/2) = sigmav(2);
W((length(x)+1)/2,(length(y)+1)/2) = sigmav(3);
 
 
quiver3(X,Y,Z,U,V,W,c)
hold on;

U((length(x)+1)/2,(length(y)+1)/2) = normal(1);
V((length(x)+1)/2,(length(y)+1)/2) = normal(2);
W((length(x)+1)/2,(length(y)+1)/2) = normal(3);
quiver3(X,Y,Z,U,V,W,c,'yellow')
hold on;
Z = Z - 0.5;
legend('SigmaU','SigmaV','Normal')
% %lines to plot tangent bases completed
mesh(X,Y,Z)
title('Surface given by (u,v,f(u,v)), Tangent Bases and Normal(K1>0 & K2>0)')

F1 = zeros(2,2);  %first fundamental form
disp('First Fundamental Form')
F1(1,1) = sum(sigmau.*sigmau);
F1(2,2) = sum(sigmav.*sigmav);
F1(1,2) = sum(sigmau.*sigmav);
F1(2,1) = sum(sigmav.*sigmau);
F1

dbyuu = (differ(m,n,u0+0.0001,v0,1) - differ(m,n,u0,v0,1))/0.0001  ; %second partial derivative of f w.r.t u
dbyuv = (differ(m,n,u0,v0+0.0001,1) - differ(m,n,u0,v0,1))/0.0001 ;   %delf by delu delv
dbyvv = (differ(m,n,u0,v0+0.0001,2) - differ(m,n,u0,v0,2))/0.0001;  %second partial derivative of f w.r.t f   
differ(m,n,u0,v0,1);

F2 = zeros(2,2); %second fundamental form

F2(1,1) = dbyuu/n0; %n is norm of normal
F2(2,2) = dbyvv/n0; 
F2(1,2) = dbyuv/n0;
F2(2,1) = dbyuv/n0;
disp('Second Fundamental Form')
F2

S = inv(F1)*F2;
[K,D] = eig(S);  %columns of V are eigenvectors , Diagonals of D are eigenvalues
disp('Principal Curvatures')
k1 = D(1,1)  
k2 = D(2,2)
disp('Principal Directions')
t1 = K(1,1)*sigmau + K(2,1)*sigmav
t2 = K(1,2)*sigmau + K(2,2)*sigmav
U((length(x)+1)/2,(length(y)+1)/2) = t1(1);
V((length(x)+1)/2,(length(y)+1)/2) = t1(2);
W((length(x)+1)/2,(length(y)+1)/2) = t1(3);
figure;
mesh(X,Y,Z)
title('Surface given by (u,v,f(u,v)) and Principal Directions(K1 > 0 & K2 > 0)')
hold on;
Z = Z + 4;
quiver3(X,Y,Z,U,V,W,c,'red')
hold on;


U((length(x)+1)/2,(length(y)+1)/2) = t2(1);
V((length(x)+1)/2,(length(y)+1)/2) = t2(2);
W((length(x)+1)/2,(length(y)+1)/2) = t2(3);
quiver3(X,Y,Z,U,V,W,c,'red')
hold on;

disp('Mean Curvature')
(k1+k2)/2
disp('Gaussian Curvature')
k1*k2



