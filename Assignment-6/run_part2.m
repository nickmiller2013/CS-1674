im = imread('jupiter.jpg');
[edges] = detectEdges(im);
radius = 110;
top_k = 2;

[centers] = detectCircles(im, edges, radius, top_k);

im = imread('jupiter.jpg');
[edges] = detectEdges(im);
radius = 50;
top_k = 2;

[centers] = detectCircles(im, edges, radius, top_k);

im = imread('jupiter.jpg');
[edges] = detectEdges(im);
radius = 30;
top_k = 2;

[centers] = detectCircles(im, edges, radius, top_k);

im = imread('egg.jpg');
[edges] = detectEdges(im);
radius = 5;
top_k = 2;

[centers] = detectCircles(im, edges, radius, top_k);


im = imread('egg.jpg');
[edges] = detectEdges(im);
radius = 10;
top_k = 2;

[centers] = detectCircles(im, edges, radius, top_k);

im = imread('egg.jpg');
[edges] = detectEdges(im);
radius = 13;
top_k = 2;

[centers] = detectCircles(im, edges, radius, top_k);
