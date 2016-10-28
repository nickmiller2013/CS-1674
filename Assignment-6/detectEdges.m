function [edges] = detectEdges(im, threshold)
%im = imread('fish.jpg');

im = rgb2gray(im);
im = im2double(im);
h = fspecial('gaussian');
im = imfilter(im,h);
edges = [];
meanMag = 0;
[row, col] = size(im);

magnitudeCol = zeros(row,col);
orientationCol = zeros(row,col);

if( nargin == 1)
    for r = (2:row - 1)
        for c = (2:col - 1)
            magnitude = sqrt((im(r, c + 1) - im(r, c - 1))^2 + (im(r + 1, c) - im(r - 1, c))^2); 
            magnitudeCol(r,c) = magnitude;
            orientationCol(r,c) = atand((im(r + 1, c) - im(r - 1, c))/(im(r, c + 1) - im(r, c - 1)));

            meanMag = meanMag + magnitude;
            
        end
    end
    meanMag = meanMag/(row*col);
    threshold = 2 * meanMag;
end


n = 1;
edgeim = zeros(row,col);
for r = (2:row - 1)
    for c = (2:col - 1)
        mag = magnitudeCol(r,c);
        ort = orientationCol(r,c);
        if mag >= threshold
            edges(n,1) = r;
            edges(n,2) = c;
            edges(n,3) = mag;
            edges(n,4) = ort;
            n = n+1;
            edgeim(r,c) = 1;
        end
            
    end
end
figure
imshow(edgeim);


