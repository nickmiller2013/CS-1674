clc;
clear all;

load('zero_shot_setup.mat');

%set_B_animals

%set_B_attributes

[rows, cols] = size(set_B_attributes);

[rows2, cols2] = size(M);

for i = (1:1:rows)
    %class = attr_probs{i,1};
    for j = (1:1:rows2)
        
        scale{i,j} = (M(j,:) == set_B_attributes(i,:))';
    end
end

[x, y] = size(scale);

for i = (1:1:x)
    for j = (1:1:y)
        compared = scale{i,j};
        [s,t] = size(compared);
        scoreOut = 1;

        for(k = (1:1:s))
            scoreOut = scoreOut * attr_probs{k,1}(i,compared(k)+1);
        end
        
        score(i,j) = scoreOut;
        
    end
end

[~, ind] = max(score, [], 2); 

[x,y] = size(ind);

upper = (set_B_animals(:) == ind(:));
%upper = sum(upper)



