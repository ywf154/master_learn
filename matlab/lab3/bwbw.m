clc;clear all;close all;
size = 200;
height = size; width = size; a = size/8;
image = boolean(zeros(size,size)); 
white = boolean(ones(a,a)); 
for i=1:2:8
    for j=1:1:8
        if mod(j,2)==1
            image((j-1)*a+1:j*a,(i-1 )*a+1:i*a)= white( :,: )
        else
            image((j-1)*a+1:j*a,i*a+1: (i+1)*a)= white( :,: )
        end
    end
end

figure,imshow(image)   


imwrite(image,'board.bmp');
imwrite(image,'board.jpg');