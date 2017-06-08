function [ cropImg, x, y ] = clearBorder( dataset )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    midHeight = floor(size(dataset.binaryImage,1)/2);
    midWidth = floor(size(dataset.binaryImage,2)/2);
    xStart = 100;
    xEnd = 150;
    yStart= 200;
    yEnd = 200;
    
    x = [midWidth-xStart, midWidth+xEnd];
    y = [midHeight-yStart, midHeight+yEnd];
    
    for i=1:size(dataset.binaryImage,3)
        cropImg(:,:,i) = dataset.binaryImage(x(1):x(2), y(1):y(2), i);
    end

end

