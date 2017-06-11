function [ normalized ] = checkHandBoundary( dataset, selectedObject, centroids, width, height, imgIndex)
    
    tempUp = height;
    tempBottom = height;
    tempLeft = width;
    tempRight = width;
    
    temp = floor(centroids(selectedObject,1)-height);
    tempUp = temp;
    if temp < 0  % CHECK UP
        disp 'checkUp'
        tempUp = floor(centroids(selectedObject,1)) - abs(temp);
        tempBottom = tempBottom + tempUp;
        
        if (tempBottom-tempUp) ~= 2*height
            disp 'checkUp2'
            temp = (2*height) - (tempBottom-tempUp)
            tempBottom = tempBottom + temp;
        end
    end
    
    temp = floor(centroids(selectedObject,1) + height);
    if temp > size(dataset.cropImage,2) % CHECK BOTTOM
        disp 'checkBottom'
        tempBottom = size(dataset.cropImage,2);
        tempUp = tempUp + (size(dataset.cropImage,2) - temp);
        
        if (tempBottom-tempUp) ~= 2*height
            temp = (2*height) - (tempBottom-tempUp)
            tempUp = tempUp - temp;
        end
    elseif tempBottom == height
        tempBottom = temp;
    end
    
    temp = floor(centroids(selectedObject,2) - tempLeft);
    if temp < 0 % CHECK LEFT
        disp 'checkLeft'
        tempLeft = floor(centroids(selectedObject,2)) - abs(temp);
        tempRight = tempRight + tempLeft;
        
        if (tempRight-tempLeft) ~= 2*width
            temp = (2*width) - (tempRight-tempLeft)
            tempRight = tempRight + temp;
        end
    elseif tempLeft==width
        tempLeft = temp;
    end
    
    temp = floor(centroids(selectedObject,2) + tempRight);
    if  temp > size(dataset.cropImage,1) % CHECK RIGHT
        disp 'checkRight'
        tempRight = size(dataset.cropImage,1);
        tempLeft = tempLeft + (size(dataset.cropImage,1) - temp);
        
         if (tempRight-tempLeft) ~= 2*width
            temp = (2*width) - (tempRight-tempLeft)
            tempLeft = tempLeft - temp;
         end
    elseif tempRight==width
        tempRight = temp;
    end

    widthRange = tempLeft+1:tempRight-1;
    heightRange = tempUp+1:tempBottom-1;
    
%     dataset.image
%     [1 2] = [width height]
    normalized = dataset.cropImage(widthRange, heightRange, imgIndex);
    
end

