function energyImage = energy_image(im)
%Nick Miller
%CS 1656
%Programming 2


%Go through and use different filters and use the equation to get
%energyImage

im_gray = rgb2gray(im);
%figure
%imshow(im_gray);

x = [1 -1];

im_gray_x = imfilter(im_gray, x);
%figure
%imshow(im_gray_x);
im_gray_x = im2double(im_gray_x);

y = [1;-1];
im_gray_y = imfilter(im_gray, y);
%figure
%imshow(im_gray_y);
im_gray_y = im2double(im_gray_y);


energyImage = sqrt((im_gray_x.^2)+(im_gray_y.^2));
%figure
%imshow(energyImage);

