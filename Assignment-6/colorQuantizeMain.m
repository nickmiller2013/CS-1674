origImg = imread('fish.jpg');

k = 3;
[outputImg, meanColors, clusterIds] = quantizeRGB(origImg, k);

subplot(2,2,1)
imagesc(outputImg)
title('k = 3')
[error] = computeQuantizationError(origImg, outputImg);
xlabel(['QE: ',num2str(error)]);
k = 4;

[outputImg, meanColors, clusterIds] = quantizeRGB(origImg, k);
subplot(2,2,2)
imagesc(outputImg)
title('k = 4')
[error] = computeQuantizationError(origImg, outputImg);
xlabel(['QE: ',num2str(error)]);

k = 8;
[outputImg, meanColors, clusterIds] = quantizeRGB(origImg, k);
subplot(2,2,3)
imagesc(outputImg)
title('k = 8')
[error] = computeQuantizationError(origImg, outputImg);
xlabel(['QE: ',num2str(error)]);



k = 10;
[outputImg, meanColors, clusterIds] = quantizeRGB(origImg, k);
subplot(2,2,4)
imagesc(outputImg)
title('k = 10')
[error] = computeQuantizationError(origImg, outputImg);
xlabel(['QE: ',num2str(error)]);

