function [ normalized ] = checkHandBoundary( dataset, selectedObject, centroids, width, height, imgIndex)
    
    tempUp = height;
    tempBottom = height;
    tempLeft = width;
    tempRight = width;

    if centroids(selectedObject,1)-tempUp < 0  % CHECK UP
        tempUp = floor(centroids(selectedObject,1) + (centroids(selectedObject,1)-height));
    end
    
    if centroids(selectedObject,1) + tempBottom > size(dataset.cropImage,1) % CHECK BOTTOM
        tempBottom = floor(size(dataset.cropImage,1) - (centroids(selectedObject,1) - height));
    end
    
    if centroids(selectedObject,2) - tempLeft < 0 % CHECK LEFT
        tempLeft = floor(centroids(selectedObject,2) + (centroids(selectedObject,2)-width));
    end
    
    if centroids(selectedObject,2) + tempRight > size(dataset.cropImage,2) % CHECK RIGHT
        tempRight = floor(size(dataset.cropImage,2) - (centroids(selectedObject,2) - width));
    end
    
    normalized(:, :, 1) = zeros(2*height+1, 2*width+1);
    
    widthRange = floor(centroids(selectedObject,2)-tempLeft):floor(centroids(selectedObject,2)+tempRight);
    heightRange = floor(centroids(selectedObject,1)-tempUp):floor(centroids(selectedObject,1)+tempBottom);
    normalized(heightRange, widthRange, 1) = dataset.cropImage(heightRange, widthRange, imgIndex);

end

