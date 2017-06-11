function [ normalized ] = checkHandBoundary( dataset, selectedObject, centroids, width, height, imgIndex)
    
    tempUp = height;
    tempBottom = height;
    tempLeft = width;
    tempRight = width;
    
    
    if centroids(selectedObject,1)-tempUp < 0  % CHECK UP
        tempUp = floor(centroids(selectedObject,1))-height-1;
        tempBottom = tempBottom - (height-tempUp);
        if tempBottom > size(dataset.cropImage,2)
            tempBottom = size(dataset.cropImage,2);
        end
    end
    
    if centroids(selectedObject,1) + tempBottom > size(dataset.cropImage,2) % CHECK BOTTOM
        tempBottom = size(dataset.cropImage,2) - (floor(centroids(selectedObject,1)) + height-1);
        tempUp = tempUp + (height-tempBottom);
    end
    
    if centroids(selectedObject,2) - tempLeft < 0 % CHECK LEFT
        tempLeft = floor(centroids(selectedObject,2))-width-1;
        tempRight = tempRight - (width-tempLeft);
        if tempRight > size(dataset.cropImage,1)
            tempRight = size(dataset.cropImage,1);
        end
    end
    
    if centroids(selectedObject,2) + tempRight > size(dataset.cropImage,1) % CHECK RIGHT
        tempRight = size(dataset.cropImage,1) - (floor(centroids(selectedObject,2)) + width-1);
        tempLeft = tempLeft + (width-tempRight);
    end

    widthRange = floor(centroids(selectedObject,2)-tempLeft-1):floor(centroids(selectedObject,2)+tempRight-1);
    heightRange = floor(centroids(selectedObject,1)-tempUp-1):floor(centroids(selectedObject,1)+tempBottom-1);
    
%     dataset.image
%     [1 2] = [width height]
    normalized(1:2) = dataset.cropImage(widthRange-1, heightRange-1, imgIndex);
    
end

