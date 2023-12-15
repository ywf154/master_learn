clc; clear all; close all;

height = 300; width = 300;
bw = boolean(zeros(height,width)); 
%-
[x,y] = bresenhamLine(10,10,10,200);
index = sub2ind([height,width],y,x);
bw(index) = 1; 
%|
[x,y] = bresenhamLine(10,10,200,10);
index = sub2ind([height,width],y,x);
bw(index) = 1; 



subplot 221,imshow(bw);

[H,T,R] = hough(bw);

subplot 222, imshow(H,[],'XData',T,'YData',R,...
      'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot); 