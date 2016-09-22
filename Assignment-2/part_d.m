%Nick Miller
%CS 1656
%Programming 2


clear all;

%Show original image
%Go through, and resize image appropriately
%Get the matlab resized image
%Show reduced image

im = imread('two.jpg');


energyImage = energy_image(im);
%%disp('Rows and cols of im1');
[rows1, cols1] = size(energyImage);

figure
imshow(im);
title('Original');
%t = 1 width, 1 = 0 height

[reducedEnergyImage, reducedFinal] = reduceValue(im, energyImage,1, 100);

[reducedEnergyImage, reducedFinal] = reduceValue(reducedFinal, reducedEnergyImage,0, 231);


[reducedEnergyImage, reducedFinal] = reduceValue(reducedFinal, reducedEnergyImage,1, 48);

%disp('Rows and cols of reduced im1');
[rows, cols] = size(reducedEnergyImage);


resizeIm = imresize(im, [rows cols]);
figure
imshow(resizeIm);
title('Matlab Resize');
%saveas(gcf, 'matlabTwo.jpg');


figure
imshow(reducedFinal);
title('Reduced');
%saveas(gcf, 'reducedTwo.jpg');





pause
close all;

clear all;

im = imread('needle.jpg');

energyImage = energy_image(im);

%disp('Rows and cols of im2');
[rows, cols] = size(energyImage);

figure
imshow(im);
title('Original');
%t = 1 width, 1 = 0 height
reducedFinal = 0;
[reducedEnergyImage, reducedFinal] = reduceValue(im, energyImage,1, 230);


[reducedEnergyImage, reducedFinal] = reduceValue(reducedFinal, reducedEnergyImage,0, 50);


[rows cols] = size(reducedEnergyImage);
 

resizeIm = imresize(im, [rows cols]);

figure
imshow(resizeIm);
title('Matlab Resize');
%saveas(gcf, 'matlabNeedle.jpg');


figure
imshow(reducedFinal);
title('Reduced');
%saveas(gcf, 'reducedNeedle.jpg');


%disp('Rows and cols of reduced im2');
[rows, cols] = size(reducedEnergyImage);

pause
close all;

clear all;


im = imread('street.jpg');

energyImage = energy_image(im);

%disp('Rows and cols of im3');
[rows, cols] = size(energyImage);

figure
imshow(im);
title('Original');
%t = 1 width, 1 = 0 height
reducedFinal = 0;
[reducedEnergyImage, reducedFinal] = reduceValue(im, energyImage,0, 30);

[reducedEnergyImage, reducedFinal] = reduceValue(reducedFinal, reducedEnergyImage,1, 120);
[reducedEnergyImage, reducedFinal] = reduceValue(reducedFinal, reducedEnergyImage,0, 50);
[reducedEnergyImage, reducedFinal] = reduceValue(reducedFinal, reducedEnergyImage,1, 280);

[rows cols] = size(reducedEnergyImage);

 
resizeIm = imresize(im, [rows cols]);

figure
imshow(resizeIm);
title('Matlab Resize');
%saveas(gcf, 'matlabStreets.jpg');

figure
imshow(reducedFinal);
title('Reduced');
%saveas(gcf, 'reducedStreets.jpg');


%disp('Rows and cols of reduced im3');
[rows, cols] = size(reducedEnergyImage);


