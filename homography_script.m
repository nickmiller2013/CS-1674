%Nick Miller
%Part 2

clear all

im1 = imread('keble1.png');
im2 = imread('keble2.png');

% figure
% imshow(im1)
% impixelinfo;
% 
% 
% figure
% imshow(im2)
% impixelinfo;

%pixel -> (keble2.png, keble1.png)
%pixel1 ->((183,140),(280,128))
%pixel2 ->((217,29),(314,11))
%pixel3 ->((129,237),(230,222))
%pixel4 ->((66,87),(163,76))

B = [183 140; 217 29; 129 237; 66 87];
A = [280 128; 314 11; 230 222; 163 76];

H = compute_homography(A,B);

%(209, 155)

testPoint = [209 155];
p2 = apply_homography(testPoint, H);

figure;
imshow(im1)
hold on
plot(209,155,'y*')

figure;
imshow(im2)
hold on
plot(p2(1), p2(2),'r*') 




