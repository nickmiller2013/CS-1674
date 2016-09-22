% Nick Miller
% HW1P
% CS 1674


% 
% % % 
% % % %Part 1
disp('Part 1');


p1a = 5;
p1b = 0;
result1=p1a.*randn(1000000,1) + p1b;
p1stats = [mean(result1) std(result1)];
disp('Created the vector')
pause
% %Part 2
disp('Part 2');

[p2m,p2n] = size(result1);

tic
for(p2i = 1:p2m)
    p2cur=result1(p2i,1);
    p2cur = p2cur + 1;
    result2(p2i,1) = p2cur;
    
end
disp(toc);
disp(' is the displaced time')
pause
% % % %Part 3
disp('Part 3');
tic
result3= result1+1;

toc
pause


% % %Part 4 
disp('Part 4')
A = rand(5,3)
%Scales by dividing 1 by the amount of columns. Then checks that scale
%against each element in the matrix. If the multiplication of each column is
%equal to 1 then the row has to be less than or equal to 1.
disp('If any row is 1 then it is less than or equal to 1')
s = prod((A <= repmat((1/size(A,2)), size(A))), 2)

pause
%%% Part 5
disp('Part 5')
A = rand(5,3)
disp('If any column is 1 then it is less than or equal to 1')

s = prod((A <= repmat((1/length(A)), size(A))))


pause
% % % % %Part 6
disp('Part 6');

p6D= 1: 2: 100;
p6C =2: 2:100; 
result6 =[p6D; p6C]

disp('Created 1-100 matrix')

pause

% % % %Part 7
disp('Part 7');


p7x = 0: 2: 100;
p7y = 2.^p7x;
figure;
plot(p7x, p7y);
axis([0 8 0 256]);
disp('plotted')
pause

% % %Part 8
disp('Part 8');

p8N=input('Pick a number\n');
result8 = fibonacci(p8N);
disp(result8);


disp('Calculated fibonacci')
pause

% % %Part 9
disp('Part 9');
I = imread('pittsburgh.png');
figure
imshow(I);
disp('Showed image')
pause

% % %Part 10
% 
disp('Part 10');
I2 = rgb2gray(I);
imshow(I2);
disp('Showed grayscale image')
pause;

% %Part 11
disp('Part 11');
I2(:);
[M,N] = min(I2(:));
[row, col] = ind2sub(size(I2),N);

% %Gives row, column, then min
row
col
I2(row,col)
disp('ans is the darkest pixel')
pause;
% % %Part 12
disp('Part 12');

c = (I2 == 6);
result12 = sum(c(:))

disp('result12 is how many pixels equal 6')
pause;
% % %Part 13 
disp('Part 13');

for(i=0:30)
    row = row+1;
    
    for(j=0:30)
        y = col+j;
        I2(row,y) = 255;
    end
    I2(row, col) = 255;
end
imshow(I2);
disp('Replaced with white pixels')
pause
% % %Part 14
% 
disp('Part 14');

[x,y] = find(I2 == 6);
x1 = [];
y1 = [];
for(i = 1:length(x))
    if(x(i) > 15 && x(i) < 736)
        if(y(i) > 15 && y(i) < 1486)
            x1(end+1) = x(i);
            y1(end+1) = y(i);
        end
    end
end
disp('These are the x coordinates then y coordinates');

% %x1 and y1 are the resulting coordinate arrays 
x1
y1

disp('Found 15 away 6 valued indexs')

pause
% % %Part 15
disp('Part 15');

%randomly choosing

randNum = randi(length(x1));
disp('randomly chose');
randomx = x1(randNum)
randomy = y1(randNum)
I2(x1(randNum),y1(randNum))
disp('The random x coordinate is randomx, random y is randomy, and with the min of ans')
pause
% % %Part 16
disp('Part 16');
[row, col] = ind2sub(size(I2),N);



I2(row:row+31, col:col+31) = 150;

I2(x1(randNum),y1(randNum)) = 150;
disp('Changed to gray')
pause

% %Part 17
disp('Part 17');

figure

imshow(I2)
saveas(gcf, 'new_image.png')
disp('Saved the image')
pause


% %Part 18 
disp('Part 18');

%Randomly displaying 1 - 100
disp('Randomly displaying 1 through 100 with 1 second interval')
result18 = [];
line = 1:1:100;
for(x=0:99)
    randNum = randi(100-x);
    line(randNum)
    result18(end+1) = line(randNum);
    line(randNum) = [];
    pause(1);
end
disp('Displayed 1 through 100 randomly')
% %Part 19
disp('Part 19');

%Create the random matrixs

len = randi(100);
A = randi(9, randi(100),len); 
B = randi(9, len,randi(100));

%Get the outer result seperate to create our resulting vector
[rA, cA] = size(A);
[rB, cB] = size(B);

%Make our resulting vector with proper dimensions
result = zeros(rA, cB);

%Loops to add the multiplied parameters 
for row = 1 : rA
	for col = 1 : cB
		total = 0;
		for i = 1 : cA
            %Gets total
			total = total + A(row, i) * B(i, col);
        end
        %Put the correct number in each specific row and col
		result19(row, col) = total;
	end
end

%Just to triple check answer
%tend = A*B
disp('Multiplie the parameters')
pause
% % %Part 20
disp('Part 20');

x = [1 2 3; 2 3 4; 3 4 5; 4 5 6; 5 6 7; 6 7 8; 1 2 3; 3 4 5];
result20 = my_unique(x);

disp('Returned the unique rows')
pause
% %Part 21
disp('Part 21');

I = imread('pittsburgh.png');
red = I(:,:,1);
redm = mean(mean(red));
red = red - redm;

green = I(:,:,2);
greenm = mean(mean(green));
green = green - greenm;

blue = I(:,:,3);
bluem = mean(mean(blue));
blue = blue - bluem;
I(:,:,1) = red;
I(:,:,2) = green;
I(:,:,3) = blue;
figure
imshow(I);
saveas(gcf, 'mean_sub.png')
disp('Saved as mean_sub.png')