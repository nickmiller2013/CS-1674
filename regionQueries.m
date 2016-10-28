clear all;
close all;

%Nick Miller
%CS 1674
%There is a pause after each set. 
currentFolder = pwd;



framesdir = strcat(currentFolder,'/frames_subset/frames_subset/');
siftdir = strcat(currentFolder,'/sift_subset/sift_subset/');
fnames = dir([siftdir '*.mat']);
assert(size(fnames, 1) > 0);
fnames2 = dir([framesdir '*.jpeg']);
assert(size(fnames2, 1) > 0);

load('centers.mat','membership','means');

frameCount = length(fnames);

%Need to store the names or else lose them towards end. 
imagestore = {};

%Need to compute bow for each frame, which should be 301.
%Going to store each bow in matrix named frameBow
for(i=1:frameCount)
    
    loopname = [siftdir fnames(i).name];
    
    load(loopname, 'descriptors', 'imname', 'numfeats', 'orients', 'positions', 'scales');
    
    
    
    bow = computeBOWRepr(descriptors, means);
    
    %Should end up being 301x100 for
    frameBow(i,:) = bow;
    imagestore{i}=imname;
    
end

%Need to randomize the frames so don't just select frames 1 2 3 4 and 5. 
randFrame = randperm(frameCount);

for j = 1:5
    %This will help us randomly select image
    randSelect = [siftdir fnames(randFrame(j)).name]
    randFrame(j)
    %Load the image in
    load(randSelect, 'descriptors', 'imname', 'numfeats', 'orients', 'positions', 'scales');
    
    %Get the actual frame loaded in. 
    randImage = imread([framesdir imname]);
    
    figure
    a = num2str(j);
    %Select a region
    [oninds] = selectRegion(randImage, positions);
    
    %Get the descriptors from the polygon
    subset_descript = descriptors(oninds, :);
    %saveas(gcf, ['img' a '.png']);

    %This is the polygonal image BOW
    imageBow = computeBOWRepr(subset_descript, means);
    
    %Now need to find similar images
    
    %Used to store the unsorted matches
    unsorted = [];
    roted = [];
    
    %Loop through the frames bow
    for k = 1:frameCount
        if k ~= randFrame(j)
            k
            %print k
            %Get the bow associated with the index
            bows = frameBow(k,:);
            
            %CompareSimilary of the 2 bows
            position = compareSimilarity(imageBow, bows);
            %if position < 1
            if(~(isnan(position)))
                unsorted = [unsorted; k, position];
            end
        end
    end
    %Sort the rows out has to be negative so closest to 1 is at top
    sorted = sortrows(unsorted, -2);
    
    
    for l = 1:3
        check = sorted(l,1);
        checkImg = imread([framesdir imagestore{check}]);
        figure
        imshow(checkImg);
        a = num2str(j);
        b = num2str(l);
        %saveas(gcf, ['img' a '-' b '.png']);
        
    end
    
    pause
    close all
    
end