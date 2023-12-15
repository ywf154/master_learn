function plaza
clc; clear all; close all;
global image;

bGray=uicontrol('Parent', gcf, 'Style', 'pushbutton', 'String', 'Gray',...
    'Units', 'normalized', 'Position', [0.2 0.1 0.1 0.05], 'Callback', @fGray);
bColor=uicontrol('Parent', gcf, 'Style', 'pushbutton', 'String', 'Color',...
    'Units', 'normalized', 'Position', [0.3 0.1 0.1 0.05], 'Callback', @fColor);
bInsert=uicontrol('Parent', gcf, 'Style', 'pushbutton', 'String', 'Insert',...
    'Units', 'normalized', 'Position', [0.4 0.1 0.1 0.05], 'Callback', @fInsert);
bBw=uicontrol('Parent', gcf, 'Style', 'pushbutton', 'String', 'BW',...
    'Units', 'normalized', 'Position', [0.5 0.1 0.1 0.05], 'Callback', @fBw); 


image=imread('images/plaza.jpg');subplot(1,2,1), imshow(image); 
set(gcf,'Position', get(0,'Screensize')); 

end
function fGray(button, eventData)
global image;
gray=rgb2gray(image);
subplot(1,2,2), imshow(gray);
end
function fBw(button, eventData)
global image;
gray=rgb2gray(image);
%bw=im2bw(gray, graythresh(gray)); 
bw=im2bw(gray, 0.5); 
%0   zui bai   ,1  zui   hei
subplot(1,2,2), imshow(bw);
end

function fColor(button, eventData)
global image;
blue = image(:,:,3);
blue=255-blue; 
image2 = image;
image2(:,:,3) = blue; 
subplot(1,2,2), imshow(image2);
end

function fInsert(button, eventData)
global image;
image2=image;
imFlower = imread('images2/flower.jpg'); 
[height, width, colors] = size(imFlower); 
%1:height -> 1+99:height+99
image2(45:height+44,100:width+99,:)= imFlower;
subplot(1,2,2), imshow(image2);
end