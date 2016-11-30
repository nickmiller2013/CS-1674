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

'Created Features'

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

'Split the data'

fc8_feature = cell2mat(train_set(1,:));
fc7_feature = cell2mat(train_set(2,:));
fc6_feature = cell2mat(train_set(3,:));

fc8_svm = fitcecoc(fc8_feature',train_set(4,:)');
fc7_svm = fitcecoc(fc7_feature',train_set(4,:)');
fc6_svm = fitcecoc(fc6_feature',train_set(4,:)');

'Trained the data'

labels = {};
for i = 1:length(test)
    labels{1,i} = predict(fc8_svm,features{1,test(i)}');
    labels{2,i} = predict(fc7_svm,features{2,test(i)}');
    labels{3,i} = predict(fc6_svm,features{3,test(i)}');
    labels{4,i} = features{4,test(i)};
end

fc8_count = 0;
fc7_count = 0;
fc6_count = 0;

for i = 1: length(labels)
    if strcmp(labels{1,i}(1,1),labels{4,i})
        fc8_count = fc8_count+1;
    end
    if strcmp(labels{2,i}(1,1),labels{4,i})
        fc7_count = fc7_count+1;
    end
    if strcmp(labels{3,i}(1,1),labels{4,i})
        fc6_count = fc6_count+1;
    end
    p8_comp(i) = labels{1,i}(1,1);
end
accuracy_fc8 = fc8_count/length(labels)
accuracy_fc7 = fc7_count/length(labels)
accuracy_fc6 = fc6_count/length(labels)
    
[C,order] = confusionmat(p8_comp,labels(4,:))