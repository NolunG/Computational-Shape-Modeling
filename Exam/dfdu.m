function ret = dfdu(u , v , p1, p2 ,p3)
% returns df/du ...equation 1 un answer sheet
ret = 2*(u*cos(v) - p1)*cos(v) + 2*(u*sin(v) - p2)*sin(v) + 2*(u*sin(v) - p2)*sin(v) + 2*(u - p3);