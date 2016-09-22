function displaySeam(im, seam, seamDirection)
%Nick Miller
%CS 1656
%Programming 2


%Plot the line on the image

figure
if(strcmp(seamDirection,'HORIZONTAL') == 1)
    imshow(im);
    hold on;
    x = [1:1:length(seam)];
    plot(x,seam,'r');
    
end
if(strcmp(seamDirection,'VERTICAL') == 1)
    imshow(im);
    hold on;
    y = [1:1:length(seam)];
    plot(seam,y, 'y');
    
end