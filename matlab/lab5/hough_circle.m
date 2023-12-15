clc; clear all; close all;
[x,y]=bresenhamCircle(150,150,70);
index = sub2ind([height,width],y,x);
bw(index) = 1; 
subplot 221,imshow(bw);