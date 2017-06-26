function [ cropImg, x, y ] = clearBorder( dataset )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    midWidth = floor(size(dataset.binaryImage,1)/2);
    midHeight = floor(size(dataset.binaryImage,2)/2);
    
% %     R.301
%     xStart = 175;
%     xEnd = 200;
%     yStart= 175;
%     yEnd = 200;
    
% %     R.322
    xStart = 175;
    xEnd = 200;
    yStart= 75;
    yEnd = 200;

% %     R.608
%     xStart = 175;
%     xEnd = 200;
%     yStart= 75;
%     yEnd = 150;

%  %     R.625
%     xStart = 200;
%     xEnd = 225;
%     yStart= 75;
%     yEnd = 150;

%  %     R.710
%     xStart = 175;
%     xEnd = 200;
%     yStart= 175;
%     yEnd = 200;
    
    y = [midWidth-xStart, midWidth+xEnd-1];
    x = [midHeight-yStart, midHeight+yEnd-1];
    
    
    for i=1:size(dataset.binaryImage,3)
        cropImg(:,:,i) = dataset.binaryImage(x(1):x(2), y(1):y(2), i);
    end

end

