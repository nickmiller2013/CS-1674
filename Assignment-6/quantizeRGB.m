function [outputImg, meanColors, clusterIds] = quantizeRGB(origImg, k)

[x,y,d] = size(origImg);
numpixels = x*y;
X = reshape(origImg, numpixels, 3);

X = double(X);

[membership,meanColors,rms] = kmeansML(k,X');

meanColors = round(meanColors)';

membership = uint8(membership)';

outputImg = zeros(x,y,d);

%membership = reshape(membership,x,y);
x2 = 1;
z = 1;
for i = 1:1:y
    for j = 1:1:x;
        %     z
        %     means(membership(1,z),1)
        red = membership(1,z) * 20;
        green = membership(1,z) * 30;
        blue = membership(1,z) *40;
        outputImg(j,i,1) = red;%means(membership(1,z),1);
        outputImg(j,i,2) = green;%means(membership(1,z),2);
        outputImg(j,i,3) = blue;%means(membership(1,z),3);
        z = z+1;
        
    end
end
clusterIds = membership;
%meanColors = mean;

outputImg = uint8(outputImg);

%imshow(outputImg);




% RGBAvg = mean(X.');
% RGBAvg = round(RGBAvg);
% inds = kmeansML(k,RGBAvg);
%clusterIds should be 163000x1
