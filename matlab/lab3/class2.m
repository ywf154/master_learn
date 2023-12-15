clc;clear all;close all;

x=1;
a=uint8(zeros(100,100));
a(20:80,20:80)=128;
a(30:70,30:70)=255;
a(40,:)=200;
a(:,51:56)=100;
figure,imshow(a);
