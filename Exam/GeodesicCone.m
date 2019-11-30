function ret = GeodesicCone(p1,p2)

% please provide here, p1 & p2 of 1*3 - row vectors both
% Note that both p1 and p2 are planer points , so please keep z co-ordinate
% of both zero, it will be ignored by the way.
if size(p1,1) > size(p1,2)
    p1 = p1';
end;

if size(p1,1) > size(p1,2)
    p1 = p1';
end;

close all;
% Let say x1,y1 & x2,y2 are points on plane 

x1 = p1(1);
x2 = p2(1);
y1 = p1(2);
y2 = p2(2);

dt = 0.02;  % dt will determine how many points we will take on line.
t = 0:dt:1;  
totalpoints = 1/dt + 1;
cord = zeros(totalpoints,3);

f1 = @(x,y) x*cos(y);
f2 = @(x,y) x*sin(y);
f3 = @(x,y) x;
fsurf(f1,f2,f3,[-10 10 -3.14 3.14])
hold on;

for i=1:totalpoints
    x = t(i)*x1 + (1-t(i))*x2;
    y = t(i)*y1 + (1-t(i))*y2;
    cord(i,:) = getCone(getuv(x,y));
    plot3(cord(i,1),cord(i,2),cord(i,3),'o');
    hold on;
end;


figure;
for i=1:totalpoints
    x = t(i)*x1 + (1-t(i))*x2;
    y = t(i)*y1 + (1-t(i))*y2;
    plot(x,y,'o');
    hold on;
end;

