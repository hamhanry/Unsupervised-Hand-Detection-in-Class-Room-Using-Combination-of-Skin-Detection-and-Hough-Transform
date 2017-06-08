function [ result ] = adaptiveThresholdRGB( I )

% I = imread('/assets/lab1.jpg');
gray = double(I);


% INIT
% w = 480;
% h = 640;
w = 600;
h = 400;
s = floor(h/20);
t = 10;

% CALCULATE INTEGRAL IMAGE
for i=1:w
    sumR=0;
    sumG=0;
    sumB=0;
    for j=1:h
        sumR = sumR + gray(i,j,1);
        sumG = sumG + gray(i,j,2);
        sumB = sumB + gray(i,j,3);
        if (i==1)
            intImgR(i,j) = sumR;
            intImgG(i,j) = sumG;
            intImgB(i,j) = sumB;
        else
            intImgR(i,j) = intImgR(i-1,j) + sumR;
            intImgG(i,j) = intImgG(i-1,j) + sumG;
            intImgB(i,j) = intImgB(i-1,j) + sumB;
        end 
    end
end


for i=1:w
    for j=1:h
        
        x1R = i - s;
        x2R = i + s;
        y1R = j - s;
        y2R = j + s;
        
        x1G = i - s;
        x2G = i + s;
        y1G = j - s;
        y2G = j + s;
        
        x1B = i - s;
        x2B = i + s;
        y1B = j - s;
        y2B = j + s;
        
%         CHECKING ARRAY BOUNDARY
       
        if (x1R < 1)
            x1R = 1;
            x1G = 1;
            x1B = 1;
        end

        if(x2R > w)
            x2R = w;
            x2G = w;
            x2B = w;
        end
     
        
        if(y1R < 1)
            y1R = 1;
            y1G = 1;
            y1B = 1;
        end
        
        if(y2R > h)
            y2R = h;
            y2G = h;
            y2B = h;
        end
        
%         DIFFERENCE
        countR = (x2R-x1R) * (y2R-y1R);
        countG = (x2G-x1G) * (y2G-y1G);
        countB = (x2B-x1B) * (y2B-y1B);
                
%         COUNT PIXEL AREA WITH BOUNDARY CHECKING CASE1
        if( x1R==1 & y1R==1)
            sumR = intImgR(x2R,y2R) - intImgR(x2R, y1R) - intImgR(x1R, y2R) + intImgR(x1R,y1R);
        end
        
        if( x1G==1 & y1G==1)
            sumG = intImgG(x2G,y2G) - intImgG(x2G, y1G) - intImgG(x1G, y2G) + intImgG(x1G,y1G);
        end
        
        if( x1B==1 & y1B==1)
            sumB = intImgB(x2B,y2B) - intImgB(x2B, y1B) - intImgB(x1B, y2B) + intImgB(x1B,y1B);
        end
        
%         COUNT PIXEL AREA WITH BOUNDARY CHECKING CASE2
        if( x1R==1 & y1R~=1)
            sumR = intImgR(x2R,y2R) - intImgR(x2R, y1R-1) - intImgR(x1R, y2R) + intImgR(x1R,y1R-1); 
        end
        
        if( x1G==1 & y1G~=1)
            sumG = intImgG(x2G,y2G) - intImgG(x2G, y1G-1) - intImgG(x1G, y2G) + intImgR(x1G,y1G-1); 
        end
        
        if( x1B==1 & y1B~=1)
            sumB = intImgB(x2B,y2B) - intImgB(x2B, y1B-1) - intImgB(x1B, y2B) + intImgR(x1B,y1B-1); 
        end
        
%         COUNT PIXEL AREA WITH BOUNDARY CHECKING CASE3
        if ( x1R~=1 & y1R==1)
            sumR = intImgR(x2R,y2R) - intImgR(x2R, y1R) - intImgR(x1R-1, y2R) + intImgR(x1R-1,y1R); 
        end
        
        if ( x1G~=1 & y1G==1)
            sumG = intImgG(x2G,y2G) - intImgG(x2G, y1G) - intImgG(x1G-1, y2G) + intImgG(x1G-1,y1G); 
        end
        
        if ( x1B~=1 & y1B==1)
            sumB = intImgB(x2B,y2B) - intImgB(x2B, y1B) - intImgB(x1B-1, y2B) + intImgB(x1B-1,y1B);
        end

%         COUNT PIXEL AREA WITH BOUNDARY CHECKING CASE4
        if(x1R~=1 & y1R~=1 )
            sumR = intImgR(x2R,y2R) - intImgR(x2R, y1R-1) - intImgR(x1R-1, y2R) + intImgR(x1R-1,y1R-1);  
        end
        
        if(x1G~=1 & y1G~=1 )
            sumG = intImgG(x2G,y2G) - intImgG(x2G, y1G-1) - intImgG(x1G-1, y2G) + intImgR(x1G-1,y1G-1); 
        end
        
        if(x1B~=1 & y1B~=1 )
            sumB = intImgB(x2B,y2B) - intImgB(x2B, y1B-1) - intImgB(x1B-1, y2B) + intImgR(x1B-1,y1B-1); 
        end
    
            
        
%         THRESHOLDING VALUE SET WITH TOLERANCE t% FROM PIXEL AREA
        if( (gray(i,j,1) * countR) <= (sumR * (100-t)/100) )
            out(i,j,1) = 0;
        else
            out(i,j,1) = 255;
        end
        
        if( (gray(i,j,2) * countG) <= (sumG * (100-t)/100) )
            out(i,j,2) = 0;
        else
            out(i,j,2) = 255;
         end
        
        if( (gray(i,j,2) * countB) <= (sumB * (100-t)/100) )
            out(i,j,3) = 0;
        else
            out(i,j,3) = 255;
        end
        
    end
        
result = uint8(out);
% imshow(result);
    
end





end

