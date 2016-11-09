clc
clear all;
close all;
im = imread('pittsburgh.png');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointPittsburgh.png');

pause
clc
clear all;
close all;

im = imread('build.jpg');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointbuild.jpg');

pause
clc
clear all;
close all;



im = imread('mall.jpg');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointmall.jpg');

pause
clc
clear all;
close all;


im = imread('prague.jpg');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointprague.jpg');

pause
clc
clear all;
close all;


im = imread('street.jpg');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointstreet.jpg');

pause
clc
clear all;
close all;



im = imread('two.jpg');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointtwo.jpg');

pause
clc
clear all;
close all;


im = imread('needle.jpg');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointneedle.jpg');

pause
clc
clear all;
close all;


im = imread('panda1.jpg');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointpanda1.jpg');

pause
clc
clear all;
close all;


im = imread('woman_happy.png');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointhappywoman.png');

pause
clc
clear all;
close all;

im = imread('leopard1.jpg');

[x, y, scores, Ix, Iy] = extract_keypoints(im);

im = imresize(im, [375 750]);

figure
imshow(im);
for i = 1: length(scores)
    hold on
    plot(x(i),y(i),'ro','MarkerSize',scores(i)*3);
end

saveas(gcf, 'keypointleopard1.jpg');

pause
clc
clear all;
close all;


