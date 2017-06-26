function [dataset] = defectGenerateDataSet()

tmpPositive = dir('dataset/322/*.bmp');
% tmpNegative = dir('dataset\case2\noDefect\*.png');

setPositive = {tmpPositive.name}';
% setNegative = {tmpNegative.name}';

tmpPathPositive = 'dataset/322/';
% tmpPathNegative = 'dataset\case2\noDefect\';


counter = 0;
for i=1:size(setPositive,1)
    counter = counter + 1;
    dataset.paths{counter} = [tmpPathPositive, setPositive{i}];
    dataset.images(:,:,:,counter) = imread(dataset.paths{counter});   
    dataset.labels{counter} = 'Positive';
end

% for i=1:size(setNegative,1)
%     counter = counter + 1;
%     dataset.paths{counter} = [tmpPathNegative, setNegative{i}];
%     dataset.images(:,:,:,counter) = imread(dataset.paths{counter});   
%     dataset.labels{counter} = 'No defect';
% end
