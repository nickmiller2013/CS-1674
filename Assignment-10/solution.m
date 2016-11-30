addpath('/tmp/caffe/matlab/');

net = caffe.Net('/tmp/caffe/models/deploy.prototxt', '/tmp/caffe/models/alexnet.caffemodel', 'test');

image_mean = caffe.io.read_mean('/tmp/caffe/models/imagenet_mean.binaryproto');

imgSetVector = imageSet('/tmp/data/','recursive');

count = 1;
for i = 1:20
    for j = 1:imgSetVector(i).Count
        imgSetVector(i).ImageLocation{j};
        im = caffe.io.load_image(imgSetVector(i).ImageLocation{j});
        im = imresize(im, [227, 227]);
        im = im - image_mean;
        net.forward({im});
        features{1,count} = net.blobs('fc8').get_data();
        features{2,count} = net.blobs('fc7').get_data();
        features{3,count} = net.blobs('fc6').get_data();
        features{4,count} = imgSetVector(i).Description;
        features{5,count} = im;
        count = count + 1;
    end
end

[~,len] = size(features);

p = randperm(len + 1);
test_percentage = .2*len;
test = p(1:test_percentage)-1;
k = [1:1:len];


Acommon = intersect(test,k);
train = setxor(k,Acommon);

train_set = {};

for i = 1:length(train)
    train_set{1,i} = features{1,train(i)};
    train_set{2,i} = features{2,train(i)};
    train_set{3,i} = features{3,train(i)};
    train_set{4,i} = features{4,train(i)};
end
templateSVM('Standardize',1,'KernelFunction','linear');

fc8_feature = cell2mat(train_set(1,:));
fc7_feature = cell2mat(train_set(2,:));
fc6_feature = cell2mat(train_set(3,:));

fc8_svm = fitcecoc(fc8_feature',train_set(4,:)');
fc7_svm = fitcecoc(fc7_feature',train_set(4,:)');
fc6_svm = fitcecoc(fc6_feature',train_set(4,:)');
