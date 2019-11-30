function grad = gradient(i,j,k,surface)

x = surface.X;
y = surface.Y;
z = surface.Z;
tri = surface.TRIV;

coordinates = [x'; y'; z'];
size(coordinates);

normal = -cross(coordinates(:,k)-coordinates(:,i), coordinates(:,j)-coordinates(:,i) );   %which direction should be taken
p = [1 0 -1; 0 1 -1 ;0 0 0];
size(normal) ;

grad = inv([(coordinates(:,i)-coordinates(:,k))' ; (coordinates(:,j)-coordinates(:,k))'; normal' ])*p;