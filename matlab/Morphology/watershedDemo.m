function watershedDemo
clc; clear all; close all;

mWatershed = uimenu(gcf,'Label', 'Watershed');
sWatershed = {'Split into 3 circles', 'Split figures', 'Count number of blobs'};
for i=1:size(sWatershed,2)
    uimenu(mWatershed,'Label',sWatershed{i},'Callback',{@fWatershed,i});
end

set(gcf,'Position',get(0,'Screensize'));
end 