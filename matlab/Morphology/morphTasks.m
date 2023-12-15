function morphTasks
clc; clear all; close all;

mErosion = uimenu(gcf,'Label', 'Erosion');
mDilation = uimenu(gcf,'Label', 'Dilation');
mOtherTasks = uimenu(gcf,'Label', 'Other tasks');

sErosion = {'Split two circles', 'Split four circles', 'Delete thinner line', 'Delete rays', 'Leave two biggest',...
    'Leave circles', 'Leave a slope line'};
for i=1: size(sErosion,2)
    uimenu(mErosion,'Label',sErosion{i},'Callback',{@fErosion,i});
end

sDilation = {'Connect parts of a circle', 'Delete holes in a circle', 'Connect scattered points','Leave a cloud edge',...
    'Fill the top part', 'Fill the right part','Fill the top and right parts','Fill the middle part'};
for i=1: size(sDilation,2)
    uimenu(mDilation,'Label',sDilation{i},'Callback',{@fDilation,i});
end

sOtherTasks = {'Make dilatation only for the second letter', 'Show an edge only for the third letter','Colorize each letter','Watershed'};
for i=1: size(sOtherTasks,2)
    uimenu(mOtherTasks,'Label',sOtherTasks{i},'Callback',{@fOtherTasks,i});
end

set(gcf,'Position',get(0,'Screensize'));
end 

function fErosion(b,e,i)
    switch i
        case 1
            origin=imread('images/erode1.bmp')
            %se=[1,1,1]
            %se=strel()
            se = strel('line',3,0)
            image=imerode(origin,se)
        case 2
            origin=imread('images/erode2.bmp')
            se = strel('line',8,0)
            image=imerode(origin,se)
            se = strel('line',8,90)
            image=imerode(image,se)
        case 3
            origin=imread('images/erode3.bmp')
            se = strel('line',7,90)
            image=imerode(origin,se)
        case 4
            origin=imread('images/erode4.bmp')
            se = strel('disk',2)
            image=imerode(origin,se)
        case 5
            origin=imread('images/erode5.bmp')
            se = strel('disk',4)
            image=imerode(origin,se)
        case 6
            origin=imread('images/erode6.bmp')
            se = strel('disk',3)
            image=imerode(origin,se)
        case 7
            origin=imread('images/erode7.bmp')
            se = strel('line',7,47)
            image=imerode(origin,se)
    end
   subplot 121,imshow(origin);
   subplot 122,imshow(image);

end

function fDilation(b,e,i)
   switch i
       case 1
           origin=imread('images/dilate1.bmp')
           se = strel('disk',3)
           image=imdilate(origin,se)
       case 2
           origin=imread('images/dilate2.bmp')
           se = strel('disk',5)
           image=imdilate(origin,se)
       case 3
           origin=imread('images/dilate3.bmp')
           se = strel('disk',2)
           image=imdilate(origin,se)
       case 4
           origin=imread('images/dilate4.bmp')
           se = strel('disk',1)
           image=imdilate(origin,se)
           image=boolean(image-origin)
       case 5
           origin=imread('images/dilate5.bmp')
           imageTop = padarray(origin,[1,0],1,'pre'); 
           image = imfill(imageTop,'holes'); 
           %se = strel('disk',2)
           %image=imdilate(origin,se)
            %image = imfill(origin,'holes');
            %figure, imshow(image); return;
            imageTop(1:50, : )= imfill(imageTop(1:50, : ),'holes');
            imageTop = imageTop(2:end, : );
            %image = imageTop-image; 
            image=imageTop; 

       case 6
            origin=imread('images/dilate5.bmp')
            imageRight = padarray(origin,[0,1],1,'post');
            imageRight(:,50:end) = imfill(imageRight(:,50:end),'holes');
            imageRight = imageRight(:, 1:end-1);
            image = imageRight; 
           
           
       case 7
            origin=imread('images/dilate5.bmp')
            imageTop = padarray(origin,[1,0],1,'pre'); 
            imageTop(1:50, : )= imfill(imageTop(1:50, : ),'holes');
            imageTop = imageTop(2:end, : );
            
            imageRight = padarray(origin,[0,1],1,'post');
            imageRight(:,50:end) = imfill(imageRight(:,50:end),'holes');
            imageRight = imageRight(:, 1:end-1);
            image=imageTop | imageRight;
            
            
       case 8
           origin=imread('images/dilate5.bmp')
           image = imfill(origin,'holes');          
            
   end
   subplot 121,imshow(origin);
   subplot 122,imshow(image);

end


function fOtherTasks(b,e,i)

    origin = imread('images/mechatronics.bmp'); 
    bw = bwlabel(origin);
    switch i
       case 1
           bw2 = logical(bw==2);
           se = strel('disk',1)
           bw2 = imdilate(bw2,se)
           bw3 = bw | bw2;
            subplot 222,imshow(bw2);
             subplot 223,imshow(bw3);
       case 2
           
           bw_3 = logical(bw==3);
           se = strel('disk',1)
           bw3 = imdilate(bw_3,se)
           bw2 = bw3 - bw_3;
           bw_exc3 = logical(bw~=3 & bw~=0);
           subplot 222,imshow(bw2);
           subplot 224,imshow(bw_exc3 | bw2);
       case 3
            
            
            rgb = label2rgb(bw,'jet',[0 0 0], 'shuffle');
            subplot 222,imshow(rgb);  
             
           rgb = label2rgb(bw,'jet',[0 0 0]);
            subplot 223,imshow(rgb);  
            
           rgb = label2rgb(bw, 'spring',[0 0 0], 'shuffle');
            subplot 224,imshow(rgb); 
           
    end

	subplot 221,imshow(bw);
   
    
end
