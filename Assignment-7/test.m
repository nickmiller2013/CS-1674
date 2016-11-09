clear all
clc

%run('vlfeat-0.9.20\toolbox\mex\mexw64\vl_version.mexw64')

%run('C:\Users\nickm\Downloads\vlfeat-0.9.20\toolbox\vl_setup')

%vl_setup demo

[training, testing] = get_data('./scene_categories', .5);

descriptors = [];

for k = 1 : (length(training))
    im = imread(training(k).path);
    
    if size(im,3)==3
        im = rgb2gray(im);
    end
    
    im = single(im);
    
    
    %size(im)
    [~, imd] = vl_sift(im);
    
    descriptors = [descriptors imd];
    
end

[~, means, ~] = kmeansML(100, double(descriptors));

training_pyramids = {}; 
training_labels = {}; 
testing_pyramids = {}; 
test_labels = {}; 

for i = 1:length(testing)
    testing(i);
    
    if strcmp(testing(i).category,'bedroom')
        test_labels{i} = 1;
    elseif strcmp(testing(i).category,'CALsuburb')
        test_labels{i} = 2;
    elseif strcmp(testing(i).category,'industrial')
        test_labels{i} = 3;
    elseif strcmp(testing(i).category,'kitchen')
        test_labels{i} = 4;
    elseif strcmp(testing(i).category,'livingroom')
        test_labels{i} = 5;
    elseif strcmp(testing(i).category,'MITcoast')
        test_labels{i} = 6;
    elseif strcmp(testing(i).category,'MITforest')
        test_labels{i} = 7;
    elseif strcmp(testing(i).category,'MIThighway')
        test_labels{i} = 8;
    elseif strcmp(testing(i).category,'MITinsidecity')
        test_labels{i} = 9;
    elseif strcmp(testing(i).category,'MITmountain')
        test_labels{i} = 10;
    elseif strcmp(testing(i).category,'MITopencountry')
        test_labels{i} = 11;
    elseif strcmp(testing(i).category,'MITstreet')
        test_labels{i} = 12;
    elseif strcmp(testing(i).category,'MITtallbuilding')
        test_labels{i} = 13;
    elseif strcmp(testing(i).category,'PARoffice')
        test_labels{i} = 14;
    elseif strcmp(testing(i).category,'store')
        test_labels{i} = 15;
    end
    
    test_labels{i};
    
    im = imread(testing(i).path);
    pyramid = computeSPMHistogram(im, means);
    
    testing_pyramids{i} = pyramid;
    
end
    'Next'

for i = 1:length(training)
    if strcmp(training(i).category,'bedroom')
        training_labels{i} = 1;
    elseif strcmp(training(i).category,'CALsuburb')
        training_labels{i} = 2;
    elseif strcmp(training(i).category,'industrial')
        training_labels{i} = 3;
    elseif strcmp(training(i).category,'kitchen')
        training_labels{i} = 4;
    elseif strcmp(training(i).category,'livingroom')
        training_labels{i} = 5;
    elseif strcmp(training(i).category,'MITcoast')
        training_labels{i} = 6;
    elseif strcmp(training(i).category,'MITforest')
        training_labels{i} = 7;
    elseif strcmp(training(i).category,'MIThighway')
        training_labels{i} = 8;
    elseif strcmp(training(i).category,'MITinsidecity')
        training_labels{i} = 9;
    elseif strcmp(training(i).category,'MITmountain')
        training_labels{i} = 10;
    elseif strcmp(training(i).category,'MITopencountry')
        training_labels{i} = 11;
    elseif strcmp(training(i).category,'MITstreet')
        training_labels{i} = 12;
    elseif strcmp(training(i).category,'MITtallbuilding')
        training_labels{i} = 13;
    elseif strcmp(training(i).category,'PARoffice')
        training_labels{i} = 14;
    elseif strcmp(training(i).category,'store')
        training_labels{i} = 15;
    end
    
    training_labels{i};
    
    im = imread(training(i).path);
    pyramid = computeSPMHistogram(im, means);
    
    training_pyramids{i} = pyramid;
    
end

predicted_labels = findLabelsKNN(training_pyramids, testing_pyramids, training_labels, 1) ;
fprintf('%s: %f\n', 'KNN 1',    100.00 * computeAccuracy(test_labels, predicted_labels)); 

predicted_labels = findLabelsKNN(training_pyramids, testing_pyramids, training_labels, 5) ;
fprintf('%s: %f\n', 'KNN 5',    100.00 * computeAccuracy(test_labels, predicted_labels)); 

predicted_labels = findLabelsKNN(training_pyramids, testing_pyramids, training_labels, 25) ;
fprintf('%s: %f\n', 'KNN 25',    100.00 * computeAccuracy(test_labels, predicted_labels)); 

predicted_labels = findLabelsKNN(training_pyramids, testing_pyramids, training_labels, 125); 
fprintf('%s: %f\n', 'KNN 125',    100.00 * computeAccuracy(test_labels, predicted_labels)); 

;