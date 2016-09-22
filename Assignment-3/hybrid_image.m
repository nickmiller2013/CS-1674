%2
im1 = imread('woman_happy.png');
im2 = imread('woman_neutral.png');

im1 = imresize(im1, [512 512]);
im2 = imresize(im2, [512 512]);

im1 = rgb2gray(im1);
im2 = rgb2gray(im2);

im2 = im2double(im2);
im1 = im2double(im1);

%3
gaussian = fspecial('gaussian', 30, 10);


%4
im1_blur = imfilter(im1,gaussian);
figure
imshow(im1_blur);
title('im1 blur');
saveas(gcf, 'im1_blur.png');


im2_blur = imfilter(im2,gaussian, 'same');
figure
imshow(im2_blur);
title('im2 blur');

saveas(gcf, 'im2_blur.png');

%5

im2_detail = im2 - im2_blur;
figure
imshow(im2_detail);
title('im2 detail');
saveas(gcf, 'im2_detail.png');


%6
im_final = (im1_blur+im2_detail);
figure
imshow(im_final);
title('im final');
saveas(gcf, 'im_final.png');