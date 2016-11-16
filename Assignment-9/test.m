model = setup_and_train();

run('vlfeat-0.9.20/toolbox/vl_setup')

posImagesDir = 'person_detection_training_data/pos/';
posImagesFolder = dir('person_detection_training_data/pos/*png');
fname = posImagesFolder(654).name;
curImage = imread(strcat(posImagesDir,fname));

[row col t] = size(curImage);

dirRead = 'person_detection_test_data/';
im = imread([dirRead 'person_088.png']);
figure;imshow(im);
imt{1,3} = im;
imt{1,1} = imresize(im, [row col]);
imt{1,2} = 'pos';



imhog = vl_hog(single(imt{1,1}), 8);
labeled{1,1} = predict(model, imhog(:)');
labeled{1,2} = 'pos';

im = imread([dirRead 'person_and_bike_006.png']);
imt{2,3} = im;
imt{2,1} = imresize(im, [row col]);
imt{2,2} = 'pos';

figure;imshow(im);
imhog = vl_hog(single(imt{2,1}), 8);
labeled{2,1} = predict(model, imhog(:)');
labeled{2,2} = 'pos';

im = imread([dirRead 'person_058.png']);
imt{3,3} = im;
imt{3,1} = imresize(im, [row col]);
imt{3,2} = 'pos';

figure;imshow(im);
imhog = vl_hog(single(imt{3,1}), 8);
labeled{3,1} = predict(model, imhog(:)');
labeled{3,2} = 'pos';

im = imread([dirRead 'person_and_bike_160.png']);
imt{4,3} = im;
imt{4,1} = imresize(im, [row col]);
imt{4,2} = 'pos';

figure;imshow(im);
imhog = vl_hog(single(imt{4,1}), 8);
labeled{4,1} = predict(model, imhog(:)');
labeled{4,2} = 'pos';

im = imread([dirRead 'crop001514.png']);
imt{5,3} = im;
imt{5,1} = imresize(im, [row col]);
imt{5,2} = 'pos';

figure;imshow(im);
imhog = vl_hog(single(imt{5,1}), 8);
labeled{5,1} = predict(model, imhog(:)');
labeled{5,2} = 'pos';

im = imread([dirRead '00001153.png']);
imt{6,3} = im;
imt{6,1} = imresize(im, [row col]);
imt{6,2} = 'neg';


imhog = vl_hog(single(imt{6,1}), 8);
labeled{6,1} = predict(model, imhog(:)');
labeled{6,2} = 'neg';

im = imread([dirRead 'crop001545.png']);
imt{7,3} = im;
imt{7,1} = imresize(im, [row col]);
imt{7,2} = 'pos';


imhog = vl_hog(single(imt{7,1}), 8);
labeled{7,1} = predict(model, imhog(:)');
labeled{7,2} = 'pos';

im = imread([dirRead '00001160.png']);
imt{8,3} = im;
imt{8,1} = imresize(im, [row col]);
imt{8,2} = 'neg';


imhog = vl_hog(single(imt{8,1}), 8);
labeled{8,1} = predict(model, imhog(:)');
labeled{8,2} = 'neg';

im = imread([dirRead 'no_person__no_bike_018.png']);
imt{9,3} = im;
imt{9,1} = imresize(im, [row col]);
imt{9,2} = 'neg';


imhog = vl_hog(single(imt{9,1}), 8);
labeled{9,1} = predict(model, imhog(:)');
labeled{9,2} = 'neg';

im = imread([dirRead 'crop001531.png']);
imt{10,3} = im;
imt{10,1} = imresize(im, [row col]);
imt{10,2} = 'pos';

imhog = vl_hog(single(imt{10,1}), 8);
labeled{10,1} = predict(model, imhog(:)');
labeled{10,2} = 'pos';

pause;

sliding(imt, model, row, col);