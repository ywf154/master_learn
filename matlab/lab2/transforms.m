function transforms
clc;close all; clear all;
global origin image;
origin = imread('images/plaza.jpg');
subplot(1,2,1), imshow(origin); 

r = uicontrol('style', 'slider', 'Position', [20 70 300 20],'value',0.5,'Callback',{@fr,1});
g = uicontrol('style', 'slider', 'Position', [20 40 300 20],'value',0.5,'Callback',{@fr,2});
b = uicontrol('style', 'slider', 'Position', [20 10 300 20],'value',0.5,'Callback',{@fr,3});

image=origin;
end

function fr(b,e,i)
global origin image;
value = get(b,'value' );
disp({value, i}); 
image( :,:,i) = origin( :,:,i)+(value-0.5)*255*2;
subplot(1,2,2), imshow(image); 
end 

