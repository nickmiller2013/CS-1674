function [reducedEnergyImage, reducedFinal] = reduceValue(reducedColorImage, reducedEnergyImage,t, x)

reducedFinal = 0;
if(t == 2)
    
    
    for(i = 1: x)
        [reducedColorImage, reducedEnergyImage] = reduceHeight(reducedColorImage, reducedEnergyImage);
        
    end
    
    
    
    for(i = 1: x)
        [reducedColorImage, reducedEnergyImage] = reduceWidth(reducedColorImage, reducedEnergyImage);
    end
    reducedFinal = reducedColorImage;
    
%     figure
%     imshow(reducedBoth);
    
end

if(t == 1)
    
    
    for(i = 1: x)
        [reducedColorImage, reducedEnergyImage] = reduceWidth(reducedColorImage, reducedEnergyImage);
    end
    reducedFinal = reducedColorImage;
%     figure
%     imshow(reducedWidth);
end

if(t == 0)
    
    
    
    for(i = 1: x)
        [reducedColorImage, reducedEnergyImage] = reduceHeight(reducedColorImage, reducedEnergyImage);
    end
    reducedFinal = reducedColorImage;
    
%     figure
%     imshow(reducedHeight);
end

