function all
clc;clear all;close all;
f = uimenu('Label','images');
 uimenu(f,'Label','bw','Callback',@fbw);
uimenu(f,'Label','Gray2','Callback',@fgray2); 
uimenu(f,'Label','Colors','Callback',@fColors); 
end

function fbw(o,e)
bw;
end
function fgray2(o,e)
gray2;
end

function fColors(o,e)
Colors;%zhe   shi   wen jian   de ming   zi
end