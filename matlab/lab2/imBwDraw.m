clc; clear all; close all;
a=boolean(zeros(100,100));

[x,y] = bresenhamLine(10,10,80,90); 
idx = sub2ind(size(a),x,y);
a(idx)=1; 

[x,y] = bresenhamCircle(50,50,30); 
idx = sub2ind(size(a),x,y);%   biao  liu
a(idx)=1; %   biao  liu

subplot 221, imshow(a); 

b=a;
b = createCirclesMask([100,100],[50,50],20); 
b = createCirclesMask([100,100],[50,50; 30,30],[20,10]); 
subplot 222, imshow(b); 

c=a+b;
subplot 223, imshow(c); 
d=c-a; 
subplot 224, imshow(d); 

