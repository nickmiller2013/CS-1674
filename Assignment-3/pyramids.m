function [G,L] = pyramids(im, fil, N);

%1
im2 = im;

im_blur = im;

for i = 1: N
    im_blur = imfilter(im_blur, fil);
    im_L = im2 - im_blur;
    im_small = im_blur(1:2*i:end, 1:2*i:end);
    im_L = im_L(1:2*i:end, 1:2*i:end);
    G{i} = im_small;
    L{i} = im_L;
    im2 = im_blur;
end
L{end} = G{end};

