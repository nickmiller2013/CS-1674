function [reducedColorImage, reducedEnergyImage] = reduceWidth(im, energyImage)

%Nick Miller
%CS 1656
%Programming 2

%Resize, using linear algebra. Remove the entries that are to be removed
%and the resize again.

M = cumulative_minimum_energy_map(energyImage, 'VERTICAL');

verticalSeam = find_optimal_vertical_seam(M);
verticalSeam2 = verticalSeam.';

%displaySeam(im, verticalSeam, 'VERTICAL');
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

[m,n] = size(R);


R = R';
G = G';
B = B';

R1 = reshape(R,1,[]);
G1 = reshape(G,1,[]);
B1 = reshape(B,1,[]);
%Linear Algebra
remove = [1:1:m];
j = 0;
for(i=0: m-1)
    j = j+1;
    remove(j) = verticalSeam2(j) + i*n;
end


R1(remove) = [];
G1(remove) = [];
B1(remove) = [];


R1 = reshape(R1,[n-1, m]);
G1 = reshape(G1,[n-1, m]);
B1 = reshape(B1,[n-1, m]);

R1 = R1.';
G1 = G1.';
B1 = B1.';


reducedColorImage(:,:,1) = R1;
reducedColorImage(:,:,2) = G1;
reducedColorImage(:,:,3) = B1;

% figure
% imshow(reducedColorImage);

energyImage = energyImage';

reducedEnergyImage1 = reshape(energyImage,1,[]);
reducedEnergyImage1(remove) = [];
reducedEnergyImage1 = reshape(reducedEnergyImage1,[n-1, m]);
reducedEnergyImage = reducedEnergyImage1.';
% figure
% imshow(reducedEnergyImage);

