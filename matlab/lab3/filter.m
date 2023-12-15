function filter
clc; clear all; close all;
global origin image filters; 
origin = imread('actress.jpg'); 
origin = imresize(origin,0.25);
origin = rgb2gray(origin); 
subplot(1,2,1),imshow(origin); 

button=uicontrol('Parent',gcf,'Style','Pushbutton','String','Original',...
    'Units','Normalized', 'Position',[0.2 0.1 0.1 0.05], 'Visible','on', 'Callback', @fOriginal);
mNoise = uimenu(gcf,'Label', 'Noise');
mFilter = uimenu(gcf,'Label', 'Filter');
mGaussian = uimenu(mNoise,'Label','Gaussian','Callback',@fGaussian);
mPoisson = uimenu(mNoise,'Label','Poisson','Callback',@fPoisson);
mSalt = uimenu(mNoise,'Label','Salt','Callback',@fSalt);
mSpeckle = uimenu(mNoise,'Label','Speckle','Callback',@fSpeckle);
filters={'Average','Gaussian', 'Disk','Laplacian','Log','Motion','Prewitt','Sobel','Median'};
for i=1:size(filters,2)
    m = uimenu(mFilter, 'Label',filters{i},'Callback', {@fFilter,i});
end

set(gcf,'Position',get(0,'Screensize')); 
end


function fGaussian(i,e) 
global origin image;
image = imnoise(origin,'gaussian',0.1,0.01);
subplot(1,2,1), imshow(origin);
subplot(1,2,2), imshow(image); 
end

function fPoisson(i,e) 
global origin image;
image = imnoise(origin, 'Poisson');
subplot(1,2,1), imshow(origin);
subplot(1,2,2), imshow(image); 
end 

function fSalt(i,e) 
global origin image;
image = imnoise(origin, 'salt & pepper',0.05);
subplot(1,2,1), imshow(origin);
subplot(1,2,2), imshow(image); 
end 

function fSpeckle(i,e) 
global origin image;
image = imnoise(origin,'speckle',0.1)
subplot(1,2,1), imshow(origin);
subplot(1,2,2), imshow(image); 
end 
function fFilter(b,e,i) 
global origin image filters;
switch filters{i}
    case'Average'
        filter = fspecial('average',10); 
 
    case'Gaussian'
       filter = fspecial('Gaussian',5,2); 
    case  'Disk'
      filter = fspecial('Disk',5); 
    case  'Laplacian'
        filter = fspecial('Laplacian',1); 
    case  'Log'
        filter = fspecial('Log',5,0.5); 
    case   'Motion'
         filter = fspecial('Motion',20,45); 
    case  'Prewitt'
        filter = fspecial('Prewitt'); 
    case  'Sobel'
        filter = fspecial('Sobel'); 
    case  'Median'
        filter = fspecial('Median'); 
end
image2= imfilter(image,filter);
subplot(1,2,1), imshow(image);
subplot(1,2,2), imshow(image2); 
end 
