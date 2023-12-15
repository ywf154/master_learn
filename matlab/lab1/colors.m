%clc; close all;
a = zeros(100,100,3);

a=uint8(a);
subplot(2,2,1),imshow(a);
a(10:12,:,1)=255;
subplot(2,2,2),imshow(a);
a(20:22,:,3)=255;
subplot(2,2,3),imshow(a);
a(30:32,:,2)=255;
subplot(2,2,4),imshow(a);
a(30:32,:,1:2)=255;
subplot(2,2,4),imshow(a);
a(30:32,:,1)=128;
subplot(2,2,4),imshow(a);
a(30:32,:,1:3)=255;
subplot(2,2,4),imshow(a);