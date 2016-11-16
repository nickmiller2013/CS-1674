function model = setup_and_train();

run('vlfeat-0.9.20/toolbox/vl_setup')

posImagesDir = 'person_detection_training_data/pos/';
posImagesFolder = dir('person_detection_training_data/pos/*png');
nfiles = length(posImagesFolder);

for i =1:nfiles
    fname = posImagesFolder(i).name;
    curImage = imread(strcat(posImagesDir,fname));
    posImages{i,1} = single(curImage);
    posImages{i,2} = 'pos';
    %imshow(curImage);
end

%size of croppsed image
[crop_rows, crop_cols, t] = size(posImages{66});

outDir = 'person_detection_training_data/neg/cropped/';
mkdir(outDir);
negImagesDir = 'person_detection_training_data/neg/';
negImagesFolder = dir('person_detection_training_data/neg/*png');
posNFiles = length(negImagesFolder);


for i =1:nfiles
    random_index = randi([1 posNFiles]);
    fname = negImagesFolder(random_index).name;
    curImage = imread(strcat(negImagesDir,fname));
    [rows, cols, x] = size(curImage);
    resizeImage = zeros(crop_rows, crop_cols, 3);
    random_row = 1;
    random_col = 1;
    if rows ~= crop_rows & cols ~= crop_cols
        random_row = randi([1 rows-crop_rows]);
        random_col = randi([1 cols-crop_cols]);
    end
    rect = [random_col random_row crop_cols-1 crop_rows-1];
    resizeImage = imcrop(curImage, rect);
    
    %imshow(resizeImage);
    imwrite(resizeImage,[outDir 'cropNeg' num2str(i) '.png'])
    negImages{i,1} = single(resizeImage);
    negImages{i,2} = 'neg';
    %imshow(curImage);
end

cellSize = 8;
for(i = 1:length(posImages))
    imhog = vl_hog(posImages{i}, cellSize);
    features(i,:) = imhog(:)';
    labels{i} = posImages{i,2};
end
[x, y] = size(features);
for(i = 1:length(negImages))
    imhog = vl_hog(negImages{i}, cellSize);
    features(i+x,:) = imhog(:)';
    labels{i+x} = negImages{i,2};
end

model = fitcecoc(features, labels);
