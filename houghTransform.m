function [ normalized ] = houghTransform( dataset )
    
    boundaryLimit = 10;
    
    %CALCAULATE HOUGH TRANSFORM
    for i=1:size(dataset.cropImage,3)
        rotI = dataset.cropImage(:,:,i);
        BW = edge(rotI,'canny');
        [H,theta,rho] = hough(BW);

        %GET THE PEAKS
        P = houghpeaks(H,1,'threshold',ceil(0.3*max(max(H(:)))));
    
        %GET THE LINES
        lines = houghlines(BW,theta,rho,P,'FillGap',1,'MinLength',7);
        
        %DEPICT PEAKS IN REAL IMAGE
%         figure, imshow(dataset.cropImage(:,:,1)), hold on
%         max_len = 0;
        for k = 1:length(lines)
           xy = [lines(k).point1; lines(k).point2];
% %            plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%            % Plot beginnings and ends of lines
% %            plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
% %            plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
%            % Determine the endpoints of the longest line segment
%            len = norm(lines(k).point1 - lines(k).point2);
%            if ( len > max_len)
%               max_len = len;
%               xy_long = xy;
%            end
        end
        
        % highlight the longest line segment
%         plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
        
        normalized = zeros(size(dataset.cropImage,1), size(dataset.cropImage,2), 'double');
        normalized(xy(1,2)-boundaryLimit:xy(1,2)+boundaryLimit,xy(1,1)-boundaryLimit:xy(1,1)+boundaryLimit,1) = ...
            dataset.cropImage(xy(1,2)-boundaryLimit:xy(1,2)+boundaryLimit,xy(1,1)-boundaryLimit:xy(1,1)+boundaryLimit,1);
        
    end

    

    

    


end

