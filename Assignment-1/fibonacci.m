% Nick Miller
% HW1P
% CS 1674


function y = fibonacci(x)

if x == 1 || x == 2 || x == 0
    y = 1;
    
end
a = 1; %-1
b = 1; %-2

k = 3;
while k<=x
    y = a + b;
    b = a;
    a = y;
    k = k+1;
end
    