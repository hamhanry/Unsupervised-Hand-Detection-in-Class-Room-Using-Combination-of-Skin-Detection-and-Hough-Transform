function [ result ] = adaptiveThreshold( I )

% I = imread('/assets/lab5.jpg');
% tmp = rgb2gray(I);

gray = double(I);


% INIT
w = 600;
h = 600;
s = floor(h/20);
t = 15;

% CALCULATE INTEGRAL IMAGE
for i=1:w
    sum=0;
    for j=1:h
        sum = sum+ gray(i,j);
        if (i==1)
            intImg(i,j) = sum;
        else
            intImg(i,j) = intImg(i-1,j) + sum;
        end 
    end
end


for i=1:w
    for j=1:h
        
        x1 = i - s;
        x2 = i + s;
        y1 = j - s;
        y2 = j + s;
        
%         CHECKING ARRAY BOUNDARY
       
        if (x1 < 1)
            x1 = 1;
        end

        if(x2 > w)
            x2 = w;
        end
     
        
        if(y1 < 1)
            y1 = 1;
        end
        
        if(y2 > h)
            y2 = h;
            
        end
        
%         DIFFERENCE
        count = (x2-x1) * (y2-y1);
                
%         COUNT PIXEL AREA WITH BOUNDARY CHECKING
        if( x1==1 & y1==1)
            sum = intImg(x2,y2) - intImg(x2, y1) - intImg(x1, y2) + intImg(x1,y1);
        
        else if( x1==1 & y1~=1)
            sum = intImg(x2,y2) - intImg(x2, y1-1) - intImg(x1, y2) + intImg(x1,y1-1);  
        
        else if ( x1~=1 & y1==1)
            sum = intImg(x2,y2) - intImg(x2, y1) - intImg(x1-1, y2) + intImg(x1-1,y1); 
               
        else if(x1~=1 & y1~=1 )
            sum = intImg(x2,y2) - intImg(x2, y1-1) - intImg(x1-1, y2) + intImg(x1-1,y1-1);    
            end
            end
            end
        end
            
        
        %         THRESHOLDING VALUE SET WITH TOLERANCE t% FROM PIXEL AREA
        if( (gray(i,j) * count) <= (sum * (100-t)/100) )
            out(i,j) = 0;
        else
            out(i,j) = 255;
        end
        
    end
        
result = uint8(out);
imshow(result);

end

