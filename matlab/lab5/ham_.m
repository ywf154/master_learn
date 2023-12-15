clc; clear all; close all;

height = 300; width = 300;
bw = boolean(zeros(height,width)); 
%-
[x,y] = bresenhamLine(10,10,10,200);
index = sub2ind([height,width],y,x);
bw(index) = 1; 
%|
[x,y] = bresenhamLine(10,10,200,200);
index = sub2ind([height,width],y,x);
bw(index) = 1; 



subplot 221,imshow(bw);

[H,T,R] = hough(bw);

subplot 222, imshow(H,[],'XData',T,'YData',R,...
      'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot); 

P = houghpeaks(H,2,'threshold',ceil(0.3*max(H(: ) ))); 

lines = houghlines(bw,T,R,P,'fillgap',5,'minlength',7);
subplot 223, imshow(bw), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
end
hold off 


[x,y]=bresenhamCircle(150,150,70);
index = sub2ind([height,width],y,x);
bw(index) = 1; 
subplot 221,imshow(bw);


