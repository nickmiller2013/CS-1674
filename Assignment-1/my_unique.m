% Nick Miller
% HW1P
% CS 1674


function result = my_unique(x)

[rows, cols] = size(x);
p = 0;
result = [];
for(j = 1: rows)
    for(i=1:rows)
        if(i ~= j)
            if(x(j,:) == x(i,:))
                p = 1;
            end
            
        end
    end
    [g,h] = size(result);
    for(i=1:g)
        if(~(isempty(result)))
            
            if(x(j,:) == result(i,:))
                p = 1;
            end
        end
        
    end
    if(p == 0)
        x(j,:)
        result = [result;x(j,:)];
        
    end
    p = 0;
end
    uniquerowsis = length(result)


