clc; clear all; close all;

%Draw a sloping line on a color image
a=uint8(zeros(100,100,3));

red = a(:,:,1); 
green = a(:,:,2);
blue = a(:,:,3);
[x,y] = bresenhamLine(10,10,80,90); 
idx = sub2ind(size(red),x,y);  red(idx)=255;
%red(sub2ind(size(red),x,y))=255;

[x,y] = bresenhamCircle(50,50,30);
idx = sub2ind(size(red),x,y);
clc; clear all; close all;

%Draw a sloping line on a color image
a=uint8(zeros(100,100,3));

red = a(:,:,1); 
green = a(:,:,2);
blue = a(:,:,3);
[x,y] = bresenhamLine(10,10,80,90); 
idx = sub2ind(size(red),x,y);  
red(idx)=255;

[x,y] = bresenhamCircle(50,50,30);
idx = sub2ind(size(red),x,y);
red(idx)=255;
green(idx)=255;

a(:,:,1) = red;
a(:,:,2) = green;
a(:,:,3) = blue;
subplot(2,2,1), imshow(a); 
green(idx)=255;

a(:,:,1) = red;
a(:,:,2) = green;
a(:,:,3) = blue;
subplot(2,2,1), imshow(a); 

subplot 221, 
image = imread('images2/flower.jpg'); 
subplot(2,2,2), imshow(image); 
[height,width,colors] = size(image);
mask = createCirclesMask([height,width],[144,84],50); 
subplot(2,2,3), imshow(mask); 

red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3); 

red(~mask) = 0;
green(~mask) = 0;
blue(~mask) = 0;

image(:,:,1) = red;
image(:,:,2) = green;
image(:,:,3) = blue; 
subplot(2,2,4), imshow(image); 
