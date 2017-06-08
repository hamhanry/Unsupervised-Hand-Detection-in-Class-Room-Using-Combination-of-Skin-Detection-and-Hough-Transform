function [binaryImage] = skinDetection( dataset )

    for i=1:size(dataset.images,4)
        redC = dataset.images(:,:,1,i);
        greenC = dataset.images(:,:,2,i);
        blueC = dataset.images(:,:,3,i);
        
        for height=1: size(redC,1)
            for width=1: size(redC,2)
                rgOp(height,width) = redC(height,width) - greenC(height,width);
                rbOp(height,width) = redC(height,width) - blueC(height,width);
                dr(height,width) = min (rgOp(height,width), rbOp(height,width));
                
                if dr(height,width)>20
                    binaryImage(height,width,i) = 1;
                else binaryImage(height,width,i) = 0;
                end
            end
        end
        
    end


end

