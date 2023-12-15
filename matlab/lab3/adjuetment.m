function adjuetment
clc; clear all; close all;
global origin;
origin = imread('images/plaza.jpg');
%origin = rgb2gray(origin);
figure, imshow(origin);
mActions = uimenu(gcf,'Label', 'Actions');
set(gcf,'Position',get(0,'Screensize'));

mNormal = uimenu(mActions,'Label','Normal distribution','Callback',@fNormal); 
end 

function fNormal(i,e)

image = uint8(zeros(100,100))+122;
image = imnoise(image,'gaussian',0,0.05);
subplot(1,2,1), imshow(image);
subplot(1,2,2), imhist(image);

end