function [ normalized ] = getHandCenterCoor( dataset, thresholdImage, xy, width, height, boxAreaSelectedObject, imgIndex)
    close all;

    cc = bwconncomp(thresholdImage);
    L = labelmatrix(cc);
    s = regionprops(cc, 'centroid');

    % [1 2] = [height width]
    selectedObject = L(xy(1,2), xy(1,1));

    if selectedObject == 0
        for i=0:boxAreaSelectedObject
            for j =0:boxAreaSelectedObject
                if j == xy(1,1) continue;
                end
                
                selectedObject = L(xy(1,2)-i, xy(1,1)-j);
                if selectedObject > 0 break;
                end
            end
            if selectedObject > 0 break;
            end
        end
    end

    if selectedObject == 0
        for i=0:boxAreaSelectedObject
            for j =0:boxAreaSelectedObject
                if j >= xy(1,1) continue;
                end
                
                selectedObject = L(xy(1,2)+i, xy(1,1)+j);
                if selectedObject > 0 break;
                end
            end
            if selectedObject > 0 break;
            end
        end
    end
    
    centroids = cat(1, s.Centroid);
%     imshow(thresholdImage)
%     hold on
%     plot(centroids(selectedObject,1), centroids(selectedObject,2), 'r.', 'MarkerSize', 15)
%     hold off

    normalized = checkHandBoundary(dataset, selectedObject, centroids, height, width, imgIndex);
%     figure; imshow(normalized);
    
end