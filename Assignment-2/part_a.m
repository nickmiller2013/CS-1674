%Nick Miller
%CS 1656
%Programming 2


im = imread('prague.jpg');
energyImage = energy_image(im);
reducedColorImage = im;
reducedEnergyImage = energyImage;

figure
imshow(im);

%Reducing height

for(i = 1: 100)
    
    [reducedColorImage, reducedEnergyImage] = reduceHeight(reducedColorImage, reducedEnergyImage);
end
figure 
imshow(reducedColorImage);
saveas(gcf, 'myResizePrague.jpg');

b = imresize(im, [380 640]);
figure 
imshow(b);
saveas(gcf, 'matlabResizePrague.jpg');


im = imread('mall.jpg');
energyImage = energy_image(im);
reducedColorImage = im;
reducedEnergyImage = energyImage;

figure
imshow(im);

%Reducing Width

for(i = 1: 100)
    [reducedColorImage, reducedEnergyImage] = reduceWidth(reducedColorImage, reducedEnergyImage);
end
figure 
imshow(reducedColorImage);
saveas(gcf, 'myResizeMall.jpg');

b = imresize(im, [769 675]);
figure 
imshow(b);
saveas(gcf, 'matlabResizeMall.jpg');
