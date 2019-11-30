function ret = myproj(p , localCordinate)
% please provide here, p of 1*3 and localCordinate of 1*3 - row vectors both

close all;
if size(p,1) > size(p,2)
    p = p';
end;
if size(localCordinate,1) > size(localCordinate,2)
    localCordinate = loacalCordinate';
end;
close all;

p1 = p(1);
p2 = p(2);
p3 = p(3);

u0 = localCordinate(1);
v0 = localCordinate(2);
u0
v0
if v0>2*pi
    disp('v0 greater than 2*pi, not possible');
    return;
end;

if v0<0
    disp('v0 less than 0, not possible');
    return;
end;

%function ftelda is square of function ftelda in question 1, which takes a
%point (u0,v0) return square of norm with p(p1,p2,p3).
u = u0;
v = v0;
alpha = 0.01;

%gradient descent starts here.
iters = 200;
trajectory = zeros(iters/20,3);
c = 1;
for i = 1:iters
    u = u - alpha*dfdu(u0,v0,p1,p2,p3);
    v = v - alpha*dfdv(u0,v0,p1,p2,p3);
    u0 = u; 
    v0 = v;
    if(mod(i,20)==0)
        trajectory(c,1) = u*cos(v);
        trajectory(c,2) = u*sin(v);
        trajectory(c,3) = u;
        c = c+1;
        
    end;
    % if difference is less than some threshold, then stop gradient descent
    %if((ftelda(u0,v0,p1,p2,p3)-ftelda(u,v,p1,p2,p3))<0.1)
    %    i
        
     %   break;
   % end;
end;
u
v

f1 = @(x,y) x*cos(y);
f2 = @(x,y) x*sin(y);
f3 = @(x,y) x;
fsurf(f1,f2,f3,[0 10 -3.14 3.14])
hold on;
colorbar
for i = 1:c-1
    plot3(trajectory(i,1),trajectory(i,2),trajectory(i,3),'o');
    hold on;
    
end;
hold on;
plot3(p1,p2,p3,'s');
hold on;