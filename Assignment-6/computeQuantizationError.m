function [error] = computeQuantizationError(origImg, quantizedImg)
    error = sum(sum(abs((origImg - quantizedImg).^2)));