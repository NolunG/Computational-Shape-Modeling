function ret = getCone(uv)
% returns co-ordinates of cone from parameters u,v.....also called sigma(u,v)
u = uv(1);
v = uv(2);

x = u*cos(v);
y = u*sin(v);
z = u;
ret = [x y z];