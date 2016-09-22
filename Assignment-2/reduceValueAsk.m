function [reducedHeight, reducedWidth, reducedBoth] = reduceValue(reducedColorImage, reducedEnergyImage)

t=1;
while(t == 1)
    prompt = 'Do you want to reduce both(2), width(1), or height(0)? ';
    x = input(prompt);
    reducedBoth = 0;
    reducedHeight = 0;
    reducedWidth = 0;
    
    if(x == 2)
        
        prompt = 'What do you want to reduce height by? ';
        x = input(prompt);
        
        for(i = 1: x)
            [reducedColorImage, reducedEnergyImage] = reduceHeight(reducedColorImage, reducedEnergyImage);
            i
        end
        
        prompt = 'What do you want to reduce width by? ';
        x = input(prompt);
        
        for(i = 1: x)
            [reducedColorImage, reducedEnergyImage] = reduceWidth(reducedColorImage, reducedEnergyImage);
            i
        end
        reducedBoth = reducedColorImage;
        
        figure
        imshow(reducedBoth);
        
    end
    
    if(x == 1)
        
        prompt = 'What do you want to reduce by? ';
        x = input(prompt);
        
        for(i = 1: x)
            [reducedColorImage, reducedEnergyImage] = reduceWidth(reducedColorImage, reducedEnergyImage);
            i
        end
        reducedWidth = reducedColorImage;
        figure
        imshow(reducedWidth);
    end
    
    if(x == 0)
        
        prompt = 'What do you want to reduce by? ';
        x = input(prompt);
        
        for(i = 1: x)
            [reducedColorImage, reducedEnergyImage] = reduceHeight(reducedColorImage, reducedEnergyImage);
            i
        end
        reducedHeight = reducedColorImage;
        
        figure
        imshow(reducedHeight);
    end
    prompt = 'Do you want to reduce again? 1 for yes, 0 for no. ';
    t = input(prompt);
end