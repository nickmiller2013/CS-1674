function [x, y, scores, Ix, Iy] = extract_keypoints(image)

x = [];
y = [];

k = .04;



im = rgb2gray(image);

I = im2double(im);

im = imresize(im, [375 750]);
[rows,columns]=size(im);


Ix = imfilter(im, [-1 0 1]);   % Image derivatives
Ix = im2double(Ix);
Iy = imfilter(im, [-1 0 1]'); 
Iy = im2double(Iy);

Ix2 = Ix.* Ix; % get Ix to the power of two
Iy2 = Iy.* Iy; % get Iy to the power of two
Ixy = Ix .* Iy; %get the Ixy by multiply Ix and Iy


loop = 1;
for y=1:rows
    for x=1:columns

        if y == 1 || y == 2 || y == rows || y+1 == rows || x == 1 || x == 2 || x + 1 == columns || x == columns
            R(y,x) = 0;
        else

            Matrix = [sum(sum(Ix2(y-2:y+2,x-2:x+2))), sum(sum(Ixy(y-2:y+2,x-2:x+2))); sum(sum(Ixy(y-2:y+2,x-2:x+2))),sum(sum(Iy2(y-2:y+2,x-2:x+2)))];
        
            R(y, x) = det(Matrix) - k * trace(Matrix)^2;
            score(loop,1) = det(Matrix) - k * trace(Matrix)^2;
            score(loop,2) = x;
            score(loop,3) = y;
            loop = loop + 1;
        end
    end
end

disp('Here')

thres=.05 * max(R(:));

[vals, inds] = sort(score(:,1), 'descend');

inds = inds(1:300); 
x = [];
y = [];


for i = 1: size(inds)
    x(1,i) = score(inds(i),2);
    y(1,i) = score(inds(i), 3);
    scores(1,i) = score(inds(i),1);
end
