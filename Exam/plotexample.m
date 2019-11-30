clear all;
close all;
f1 = @(x,y) x*cos(y);
f2 = @(x,y) x*sin(y);
f3 = @(x,y) x;
fsurf(f1,f2,f3,[-10 10 -3.14 3.14])
colorbar
hold on;
plot3(0,0,0,'o');
