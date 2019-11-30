clear all;
load('cylinderdata2017.mat');
myspectralmeshdeform(v,face,[indmove; indfix], def_handle);
%trisurf(face, v(:,1), v(:,2), v(:,3));