clc;
clear all;

load('zero_shot_setup.mat');


X_train = set_A_samples;
Y_train = set_A_animals;
X_test = set_B_samples;

model = fitcecoc(X_train, Y_train);

labels = predict(model, X_test);

[lower,~] = size(labels);

upper = (set_B_animals(:) == labels(:));
upper = sum(upper);

svmAccuracy = upper/lower;