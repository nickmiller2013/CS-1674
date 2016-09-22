%Nick Miller
%CS 1656
%Programming 2

%Read in the images 
%Get the seams
%Save them out


im = imread('prague.jpg');

figure
imshow(im);

energyImage = energy_image(im);

M = cumulative_minimum_energy_map(energyImage, 'VERTICAL');

verticalSeam = find_optimal_vertical_seam(M);

displaySeam(im, verticalSeam, 'VERTICAL');

saveas(gcf, 'verticalPragueSeam.jpg');


M = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');

horizontalSeam = find_optimal_horizontal_seam(M);

displaySeam(im, horizontalSeam, 'HORIZONTAL');

saveas(gcf, 'horizontalPragueSeam.jpg');


im = imread('mall.jpg');

figure
imshow(im);

energyImage = energy_image(im);

M = cumulative_minimum_energy_map(energyImage, 'VERTICAL');

verticalSeam = find_optimal_vertical_seam(M);

displaySeam(im, verticalSeam, 'VERTICAL');

saveas(gcf, 'verticalMallSeam.jpg');


M = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');

horizontalSeam = find_optimal_horizontal_seam(M);

displaySeam(im, horizontalSeam, 'HORIZONTAL');

saveas(gcf, 'horizontalMallSeam.jpg');
