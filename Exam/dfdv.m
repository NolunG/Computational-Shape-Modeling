function ret = dfdv(u , v , p1, p2 ,p3)
% returns df/dv ...equation 2 un answer sheet

ret = 2*(u*cos(v) - p1)*(-u*sin(v)) + 2*(u*sin(v)-p2)*(u*cos(v));