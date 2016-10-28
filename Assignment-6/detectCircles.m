function [centers] = detectCircles(im, edges, radius, top_k)

[edgeSize, ~] = size(edges);
quantization_value = 2;
[row, col] = size(im);
row = ceil(row/quantization_value);
col = ceil(col/quantization_value);

centers = [];
h = zeros(row, col);
if(nargin == 3)
     top_k = 1;
end

for i = 1:edgeSize
    r = edges(i,1);
    c = edges(i,2);
    ort = edges(i,4);
    
    a = abs(ceil(c- radius * cosd(ort))) + 1;
    b = abs(ceil(r- radius*sind(ort))) + 1;
    a = ceil(a/quantization_value);
    b = ceil(b/quantization_value);

    h(a,b) = h(a,b) + 1;
    
    
end

h = imgaussfilt(h);

%Sort h, to show which value is highest in the 2nd col. 
[~, sorted] = sort(h(:), 'descend');

%Get the top, top_k, values
top = sorted(1:top_k);

[x,y] = ind2sub(size(h), top);


    
for i = (1:top_k)
    centers(i,1) = x(i) * quantization_value;
    centers(i,2) = y(i) * quantization_value;
end



figure; imshow(im); viscircles(centers, radius * ones(size(centers, 1), 1));
title(['Radius: ',int2str(radius)]);
%filename = strcat('radius',int2str(radius),'.png');
%saveas(gcf, filename);