%Nick Miller
%CS 1656
%Programming 2

%Read in the images
%Get the energy image
%Then get the cumulative minimum energy map

im = imread('prague.jpg');

figure
imshow(im);

energyImage = energy_image(im);

figure
imshow(energyImage)
saveas(gcf, 'energyPrague.jpg');

M = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');
figure
imagesc(M)

saveas(gcf, 'horizontalPragueM.jpg');

M = cumulative_minimum_energy_map(energyImage, 'VERTICAL');
figure
imagesc(M)

saveas(gcf, 'verticalPragueM.jpg');


im = imread('mall.jpg');

figure;
imshow(im);


energyImage = energy_image(im);

figure
imshow(energyImage)
saveas(gcf, 'energyMall.jpg');

M = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');
figure
imagesc(M)

saveas(gcf, 'horizontalMallM.jpg');

M = cumulative_minimum_energy_map(energyImage, 'VERTICAL');
figure
imagesc(M)

saveas(gcf, 'verticalMallM.jpg');
