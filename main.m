clc;
clear all;

dataset = generateDataset();
dataset.binaryImage = skinDetection(dataset);
[dataset.cropImage, dataset.x, dataset.y] = clearBorder(dataset);
% dataset.normalizedImage = houghTransform(dataset);

% disp('HSV');
% for i=1:size(dataset.images,4)
%     dataset.hsvImg(:,:,:,i) = rgb2hsv(dataset.images(:,:,:,i));
% end
% 
% disp('Gray');
% for i=1:size(dataset.images,4)
%     dataset.grayImg(:,:,i) = rgb2gray(dataset.images(:,:,:,i));
% end
% 
% disp('Histeq');
% for i=1:size(dataset.grayImg,3)
%     dataset.histogramEqImg(:,:,i) = histeq(dataset.grayImg(:,:,i));
% end

% clear i;
% writeImage(dataset);

