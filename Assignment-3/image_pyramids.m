im = imread('reef.jpg');
im = rgb2gray(im);

fil = fspecial('gaussian',7,1);

[G, L] = pyramids(im, fil, 5);


figure 
imshow(G{1});
title('G 1/2')

figure 
imshow(G{2});
title('G 1/4')

figure 
imshow(G{3});
title('G 1/8')

figure 
imshow(G{4});
title('G 1/16')

figure 
imshow(G{5});
title('G 1/32')


figure 
imshow(L{1});
title('L 1/2')
figure 
imshow(L{2});
title('L 1/4')

figure 
imshow(L{3});
title('L 1/8')

figure 
imshow(L{4});
title('L 1/16')

figure 
imshow(L{5});
title('L 1/32')




