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
        features{1,count} = net.blobs('fc6').get_data();
        features{2,count} = net.blobs('fc7').get_data();
        features{3,count} = net.blobs('fc8').get_data();
        count = count + 1;
    end
end
