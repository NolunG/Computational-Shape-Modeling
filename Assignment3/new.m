figure
subplot(2,2,1)
trisurf(tri,x,y,z,u(:,10));
title('Subplot 1: sin(x)')

subplot(2,2,2)
trisurf(tri,x,y,z,u(:,11));
title('Subplot 2: sin(2x)')

subplot(2,2,3)
trisurf(tri,x,y,z,u(:,12));
title('Subplot 3: sin(4x)')

subplot(2,2,4)
trisurf(tri,x,y,z,u(:,20));
title('Subplot 4: sin(8x)')