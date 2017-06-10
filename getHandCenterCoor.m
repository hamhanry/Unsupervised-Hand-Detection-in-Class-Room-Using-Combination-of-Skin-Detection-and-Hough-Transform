close all;

a=145;
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
centroids = cat(1, s.Centroid);
imshow(rotI)
hold on
plot(centroids(selectedObject,1), centroids(selectedObject,2), 'b*')
hold off

width = 25;
height = 50;
normalized = checkHandBoundary(dataset, selectedObject, centroids, width, height, a);