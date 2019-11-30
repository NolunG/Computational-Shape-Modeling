function ret = ftelda(u , v , p1, p2 ,p3)
% returns square of ftelda function in question 
ret = (u*cos(v) - p1)^2 + (u*sin(v)-p2)^2 + (u-p3)^2 ; 