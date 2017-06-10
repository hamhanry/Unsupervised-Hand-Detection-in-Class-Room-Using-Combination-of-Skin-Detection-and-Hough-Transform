close all;

a=200;
% 25, 135, 145
rotI = dataset.cropImage(:,:,a);
edgeImage = edge(rotI,'canny');
[H,theta,rho] = hough(edgeImage);

%GET THE PEAKS
P = houghpeaks(H,1,'threshold',ceil(0.3*max(max(H(:)))));

%GET THE LINES
lines = houghlines(edgeImage,theta,rho,P,'FillGap',5,'MinLength',7);

%DEPICT PEAKS IN REAL IMAGE
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
end

cc = bwconncomp(rotI);
L = labelmatrix(cc);
s = regionprops(cc, 'centroid');

% [1 2] = [height width]
selectedObject = L(xy(1,2), xy(1,1));

if selectedObject == 0
    for i=0:20
        for j =0:20
            selectedObject = L(xy(1,2)-i, xy(1,1)-j);
            if selectedObject > 0 break;
            end
        end
        if selectedObject > 0 break;
        end
    end
end

if selectedObject == 0
    for i=0:20
        for j =0:20
            selectedObject = L(xy(1,2)+i, xy(1,1)+j);
            if selectedObject > 0 break;
            end
        end
        if selectedObject > 0 break;
        end
    end
end

centroids = cat(1, s.Centroid);
imshow(rotI)
hold on
plot(centroids(selectedObject,1), centroids(selectedObject,2), 'r.', 'MarkerSize', 15)
hold off

width = 50;
height = 50;
normalized = checkHandBoundary(dataset, selectedObject, centroids, height, width, a);
figure; imshow(normalized);