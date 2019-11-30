function uv = getuv(p1,p2)

% return parameters u,v from co-ordinate on plane, kind of inverse of sigma(u,v)

u = sqrt((p1*p1 + p2*p2)/2);
v = sqrt(2)*acos(p1/(u*sqrt(2)));

uv = [u v];
