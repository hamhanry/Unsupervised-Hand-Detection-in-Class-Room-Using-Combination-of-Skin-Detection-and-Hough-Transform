function [ output_args ] = findMaxPeak( input_args )

% SECOND APPROACH
tempR = R;
for i=1:250
    [maxValue, maxIndex] = max(max(tempR));
    [row(i), col(i), value(i)] = find(tempR >= (maxValue-0.001));
    tempR(row(i),col(i))=0;
    clear maxRow;
    clear maxCol;
    clear maxMix;
end
        
figure; imshow(dataset.binaryImage(:,:,1)); 
for i=1:200
    hold on;
    plot(300,floor(size(dataset.binaryImage,2)/2)-xp(row(i)),'-s', 'MarkerSize', 5, 'MarkerEdgeColor', 'red');
end

% FIRST APPROACH
%     tempR = R;
%     for i=1:350
%         maxRow = max(tempR,[],1);
%         maxCol = max(tempR,[],2)';
%         maxMix(1 : size(maxRow,2)) = maxRow;
%         maxMix(size(maxRow,2)+1 : size(maxRow,2)+size(maxCol,2)) = maxCol;
%         [maxValue, maxIndex] = max(maxMix);
% 
%         [row(i), col(i), value(i)] = find(tempR >= (maxValue-0.001));
%         tempR(row(i),col(i))=0;
%         clear maxRow;
%         clear maxCol;
%         clear maxMix;
%     end

% for i=1:10
%     z(i) = xp(row(i));
% end

