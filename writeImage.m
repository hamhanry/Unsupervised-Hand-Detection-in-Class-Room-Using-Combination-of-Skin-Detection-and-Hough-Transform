function [] = writeImage(dataset)

% disp('write original');
% folderPath = 'result/original/';
% mkdir(folderPath);
% for i=1:size(dataset.images,4)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.images(:,:,:,i), path);
% end

% disp('write hsv');
% folderPath = 'result/hsv2/';
% mkdir(folderPath);
% for i=1:size(dataset.hsvImg,4)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.hsvImg(:,:,i), path);
% end

% disp('write skinDetection');
% folderPath = 'result/skinDetection301/';
% mkdir(folderPath);
% for i=1:size(dataset.binaryImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.binaryImage(:,:,i), path);
% end
% 
% disp('write croppedImage');
% folderPath = 'result/cropImg301/';
% mkdir(folderPath);
% for i=1:size(dataset.cropImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.cropImage(:,:,i), path);
% end

% disp('write skinDetection');
% folderPath = 'result/skinDetection322/';
% mkdir(folderPath);
% for i=1:size(dataset.binaryImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.binaryImage(:,:,i), path);
% end

% disp('write croppedImage');
% folderPath = 'result/cropImg322/';
% mkdir(folderPath);
% for i=1:size(dataset.cropImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.cropImage(:,:,i), path);
% end

% disp('write centerHand');
% folderPath = 'result/handDetection322/';
% mkdir(folderPath);
% for i=1:size(dataset.normalizedImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.normalizedImage(:,:,i), path);
% end

% disp('write croppedImage');
% folderPath = 'result/cropImg608/';
% mkdir(folderPath);
% for i=1:size(dataset.cropImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.cropImage(:,:,i), path);
% end

% disp('write croppedImage');
% folderPath = 'result/cropImg625/';
% mkdir(folderPath);
% for i=1:size(dataset.cropImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.cropImage(:,:,i), path);
% end

% disp('write croppedImage');
% folderPath = 'result/cropImg710/';
% mkdir(folderPath);
% for i=1:size(dataset.cropImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.cropImage(:,:,i), path);
% end

% disp('write centerHand');
% folderPath = 'result/handDetection322/';
% mkdir(folderPath);
% for i=1:size(dataset.normalizedImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.normalizedImage(:,:,i), path);
% end

% disp('write centerHand');
% folderPath = 'result/handDetection322/';
% mkdir(folderPath);
% for i=1:size(dataset.normalizedImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.normalizedImage(:,:,i), path);
% end


% disp('write gray');
% folderPath = 'result/gray/';
% mkdir(folderPath);
% for i=1:size(dataset.grayImg,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.grayImg(:,:,i), path);
% end
% 
% disp('write histeq');
% folderPath = 'result/histeq/';
% mkdir(folderPath);
% for i=1:size(dataset.histogramEqImg,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.histogramEqImg(:,:,i), path);
% end

% disp('write handDetection');
% folderPath = 'result/handDetection301/';
% mkdir(folderPath);
% for i=1:size(dataset.normalizedImage,3)
%     [~,fileName,ext] = fileparts(dataset.paths{i});
%     path = [folderPath, fileName, ext];
%     imwrite(dataset.normalizedImage(:,:,i), path);
% end

disp('write handDetection');
folderPath = 'result/handDetection322/';
mkdir(folderPath);
for i=1:size(dataset.normalizedImage,3)
    [~,fileName,ext] = fileparts(dataset.paths{i});
    path = [folderPath, fileName, ext];
    imwrite(dataset.normalizedImage(:,:,i), path);
end

