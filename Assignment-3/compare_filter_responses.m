clear all;

%1
disp('Starting at number 1')

C1 = imread('cardinal1.jpg');
C2 = imread('cardinal2.jpg');
L1 = imread('leopard1.jpg');
L2 = imread('leopard2.jpg');
P1 = imread('panda1.jpg');
P2 = imread('panda2.jpg');

C1 = imresize(C1, [512 512]);
C2 = imresize(C2, [512 512]);
L1 = imresize(L1, [512 512]);
L2 = imresize(L2, [512 512]);
P1 = imresize(P1, [512 512]);
P2 = imresize(P2, [512 512]);

storeIm = {C1; L1; P1; C2; L2; P2};



%2
disp('Moving on to number 2')

F = makeLMfilters;

%3
disp('Moving on to number 3')

%It says to display only 3 images so I have a terminating statement at 3.
%It shows cardinal1, leopard1, and panda1.
for j = 1:6
    I = (storeIm{j});
    I = imresize(I, .25);
    I = rgb2gray(I);
    figure
    imshow(I);

    for i = 1:48
        this_filter = (F(:,:,i));
        filt_im = (imfilter(I, F(:,:,i)));
        figure
        subplot(1, 2, 1); imagesc(this_filter);
        subplot(1, 2, 2); imagesc(filt_im);
    end
    disp('Paused, hit any key')
    pause
    close all
    if j == 3
        break
    end

end


%4
disp('Moving on to number 4')

binrange = 2.^(0:.5:7);
for j = 1:6
    bincounts = [];

    I = (storeIm{j});
    I = imresize(I, .25);
    I = rgb2gray(I);

    for i = 1:48
        this_filter = (F(:,:,i));
        filt_im = (imfilter(I, F(:,:,i)));
        filt_im = filt_im(:);
        bincounts = vertcat(bincounts,histc(filt_im,binrange));
        
        
    end
    
    descriptors{j} = bincounts;
    %bincounts = histc(filt_im,binrange);
end

%5
disp('Moving on to number 5')

%C1, L1, P1, C2, L2, P2

for i = 1: 3
    within_(i) = sqrt(sum((descriptors{i}-descriptors{i+3}).^2));    
end
count = 1;
for j = 1: 6
    for i = 1: 6
        
        
        if i ~= j && j ~= i + 3 && i ~= j + 3 && j ~= i - 3 && i ~= j - 3
            between_(count) = sqrt(sum((descriptors{j}-descriptors{i}).^2));
            count = count + 1;
        end
    end
end



%6
disp('Moving on to number 6')
disp('The mean of within_ and between_ from part 1 are')
within_Mean = mean(within_)
between_Mean = mean(between_)
disp('Paused, hit any key')

pause;

%7
disp('Moving on to number 7')
for j = 1:6
    bincounts = [];
    I = (storeIm{j});
    I = imresize(I, .25);
    I = rgb2gray(I);

    for i = 1:48
        this_filter = (F(:,:,i));
        filt_im = (imfilter(I, F(:,:,i)));
        bincounts = vertcat(bincounts,mean2(filt_im));
        
    end
    descriptors{j} = bincounts;
end

for i = 1: 3
    within2_(i) = sqrt(sum((descriptors{i}-descriptors{i+3}).^2));    
end
count = 1;
for j = 1: 6
    for i = 1: 6
        
        
        if i ~= j && j ~= i + 3 && i ~= j + 3 && j ~= i - 3 && i ~= j - 3
            between2_(count) = sqrt(sum((descriptors{j}-descriptors{i}).^2));
            count = count + 1;
        end
    end
end
disp('Paused, hit any key')

pause;



disp(' The mean of within2_ and between2_ for part 2 are');
within_Mean2 = mean(within2_)
between_Mean2 = mean(between2_)

%8
disp('Moving on to number 8')
binrange = 0:5:255;
for j = 1:6
    bincounts = [];

    I = (storeIm{j});
    I = imresize(I, .25);
    I = rgb2gray(I);

    for i = 1:48
        this_filter = (F(:,:,i));
        filt_im = (imfilter(I, F(:,:,i)));
        filt_im = filt_im(:);
        bincounts = vertcat(bincounts,histc(filt_im,binrange));
        
        
    end
    
    descriptors{j} = bincounts;
    %bincounts = histc(filt_im,binrange);
end

%5

%C1, L1, P1, C2, L2, P2

for i = 1: 3
    within3_(i) = sqrt(sum((descriptors{i}-descriptors{i+3}).^2));    
end
count = 1;
for j = 1: 6
    for i = 1: 6
        
        
        if i ~= j && j ~= i + 3 && i ~= j + 3 && j ~= i - 3 && i ~= j - 3
            between3_(count) = sqrt(sum((descriptors{j}-descriptors{i}).^2));
            count = count + 1;
        end
    end
end



%6
disp('The mean of within_ and between_ from part 1 are')
within3_Mean = mean(within3_)
between3_Mean = mean(between3_)
disp('The end')



