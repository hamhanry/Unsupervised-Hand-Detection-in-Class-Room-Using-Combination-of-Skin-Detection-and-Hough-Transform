function [ normalized ] = houghTransform( dataset )
    
%     boundaryLimit = 10;
    width=25;
    height = 50;
    %CALCAULATE HOUGH TRANSFORM
    for i=1:size(dataset.cropImage,3)
        disp (i)
        rotI = dataset.cropImage(:,:,i);
        BW = edge(rotI,'canny');
        [H,theta,rho] = hough(BW);

        %GET THE PEAKS
        P = houghpeaks(H,1,'threshold',ceil(0.3*max(max(H(:)))));
    
        %GET THE LINES
        lines = houghlines(BW,theta,rho,P,'FillGap',1,'MinLength',7);
        
        %DEPICT PEAKS IN REAL IMAGE
        for k = 1:length(lines)
           xy = [lines(k).point1; lines(k).point2];
        end
        
         s  = regionprops(rotI,'centroid');
         normalized(:,:,i) = ...
             dataset.cropImage(s.Centroid(1,2)-height:s.Centroid(1,2)+height, ...
                                s.Centroid(1,1)-width:s.Centroid(1,1)+width,1);
         
    end

    

    

    


end

