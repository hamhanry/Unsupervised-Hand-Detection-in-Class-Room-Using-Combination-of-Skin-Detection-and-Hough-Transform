function [ normalized ] = checkHandBoundary( dataset, selectedObject, centroids, width, height, imgIndex)
    
    tempUp = height;
    tempBottom = height;
    tempLeft = width;
    tempRight = width;

    if centroids(selectedObject,1)-tempUp < 0  % CHECK UP
        tempUp = abs(floor(centroids(selectedObject,1))-height-1);
    end
    
    if centroids(selectedObject,1) + tempBottom > size(dataset.cropImage,2) % CHECK BOTTOM
        tempBottom = size(dataset.cropImage,2) - abs(floor(centroids(selectedObject,1)) - height-1);
    end
    
    if centroids(selectedObject,2) - tempLeft < 0 % CHECK LEFT
        tempLeft = abs(floor(centroids(selectedObject,2))-width-1);
    end
    
    if centroids(selectedObject,2) + tempRight > size(dataset.cropImage,1) % CHECK RIGHT
        tempRight = size(dataset.cropImage,1) - abs(floor(centroids(selectedObject,2)) - width-1);
    end
    
    normalized = zeros(150,150);
    
    widthRange = floor(centroids(selectedObject,2)-tempLeft-1):floor(centroids(selectedObject,2)+tempRight-1);
    heightRange = floor(centroids(selectedObject,1)-tempUp-1):floor(centroids(selectedObject,1)+tempBottom-1);
    
%     dataset.image
%     [1 2] = [width height]
    normWidthRange = (size(normalized,2)/2-width):(size(normalized,2)/2+width-1);
    normHeightRange = (size(normalized,1)/2-height):(size(normalized,1)/2+height-1);
    normalized = ...
        dataset.cropImage(widthRange, heightRange, imgIndex);
    
end

