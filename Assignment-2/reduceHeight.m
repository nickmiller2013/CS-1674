function [reducedColorImage, reducedEnergyImage] = reduceHeight(im, energyImage)
%Nick Miller
%CS 1656
%Programming 2

%Resize, using linear algebra. Remove the entries that are to be removed
%and the resize again.

M = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');

horizontalSeam = find_optimal_horizontal_seam(M);
horizontalSeam2 = horizontalSeam.';

%displaySeam(im, horizontalSeam, 'HORIZONTAL');
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);


[m,n] = size(R);
R1 = reshape(R,[],1);
G1 = reshape(G,[],1);
B1 = reshape(B,[],1);
remove = [1:1:n];
%Linear Algebra
j = 0;
for(i=0: n-1)
    j = j+1;
    remove(j) = horizontalSeam2(j) + i*m;
end



R1(remove) = [];
G1(remove) = [];
B1(remove) = [];



R1 = reshape(R1,[m-1, n]);
G1 = reshape(G1,[m-1, n]);
B1 = reshape(B1,[m-1, n]);

reducedColorImage(:,:,1) = R1;
reducedColorImage(:,:,2) = G1;
reducedColorImage(:,:,3) = B1;

% figure
% imshow(reducedColorImage);

reducedEnergyImage1 = reshape(energyImage,[],1);
reducedEnergyImage1(remove) = [];
reducedEnergyImage = reshape(reducedEnergyImage1,[m-1, n]);
% figure
% imshow(reducedEnergyImage);


