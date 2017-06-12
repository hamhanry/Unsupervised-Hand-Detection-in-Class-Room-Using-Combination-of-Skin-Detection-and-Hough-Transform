function [ normalized ] = houghTransform( dataset )
    
    boxAreaSelectedObject = 20;
    width=45;
    height = 45;
%     182, 321
    %CALCAULATE HOUGH TRANSFORM
    for i=1:size(dataset.cropImage,3)
        disp (i)
        edgeImage = edge(dataset.cropImage(:,:,i),'canny');
        [H,theta,rho] = hough(edgeImage);

        %GET THE PEAKS
        P = houghpeaks(H,1,'threshold',ceil(0.3*max(max(H(:)))));
    
        %GET THE LINES
        lines = houghlines(edgeImage,theta,rho,P,'FillGap',5,'MinLength',15);
        
        %DEPICT PEAKS IN REAL IMAGE
        for k = 1:length(lines)
           xy = [lines(k).point1; lines(k).point2];
        end
        
        normalized(:,:,i) = getHandCenterCoor(dataset, dataset.cropImage(:,:,i), xy, width, height, boxAreaSelectedObject,i);
         
    end
    
end

