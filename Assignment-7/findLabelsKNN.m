function [labels] = findLabelsKNN(pyramids_train, pyramids_test, labels_train, k)
 %Nick Miller
 %CS 1674
 %Assignment 7
%  which predicts the labels of the test images using the KNN classifier. 
%  pyramids_train, pyramids_test should be an Mx1 cell array and an Nx1 
%  cell array, respectively, where M is the size of the training image set
%  and N is the size of your test image set, and each pyramids{i} is the 1xd 
%  Spatial Pyramid Match representation of the corresponding training or test 
%  image. labels_train should be an Mx1 vector of training labels, and labels 
%  should be a Nx1 vector of predicted labels for the test images. k is the k 
%  in K-Nearest Neighbors, and you select the value (you will try different values).
%  
    labels = {};
    
    distance = [];
    %Searching through pyramids_test then pyramids_train in order to
    %compare distances
    for a = 1: length(pyramids_test)
        %Get distances for each index of pyramids. 
        lookAround = zeros(length(pyramids_train), 2);
        for b = 1:length(pyramids_train)
            %gets the distance between the two by using dist2
            distance = dist2(pyramids_test{a}(:)', pyramids_train{b}(:)');
            
            %Stores the training labels with the distances associated
            lookAround(b,2) = labels_train{b};
            lookAround(b,1) = distance;
            
        end
        
        %Sorts the lookAround
        temp = sortrows(lookAround,1);
        
        %Stores in labels
        labels{a} = mode(temp(1:k,2));
    end

