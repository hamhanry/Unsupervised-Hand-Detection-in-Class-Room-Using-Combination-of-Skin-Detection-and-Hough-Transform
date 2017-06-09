function [ output_args ] = findMaxPeak( input_args )

% SECOND APPROACH
% tempR = R;
% for i=20
%     [maxValue, maxIndex] = max(max(tempR));
%     [row(i), col(i), value(i)] = find(tempR >= (maxValue-0.0001));
%     tempR(row(i),col(i))=0;
% end

% % FIRST APPROACH
tempR = R;
for i=1:20
    maxRow = max(tempR,[],1);
    maxCol = max(tempR,[],2)';
    maxMix(1 : size(maxRow,2)) = maxRow;
    maxMix(size(maxRow,2)+1 : size(maxRow,2)+size(maxCol,2)) = maxCol;
    [maxValue, maxIndex] = max(maxMix);

    [row(i), col(i), value(i)] = find(tempR >= (maxValue-0.001));
    tempR(row(i),col(i))=0;
    clear maxRow;
    clear maxCol;
    clear maxMix;
end

x = floor(size(dataset.cropImage,2)/2);
y = floor(size(dataset.cropImage,1)/2)-xp(row(i));

figure; imshow(dataset.cropImage(:,:,145)); 
for i=1:20
    hold on;
    plot(x, y,'-s', 'MarkerSize', 5, 'MarkerEdgeColor', 'red');
end


% for i=1:10
%     z(i) = xp(row(i));
% end

