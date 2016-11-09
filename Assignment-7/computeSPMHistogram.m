function [pyramid] = computeSPMHistogram(im, codebookmeans)
    
    [height, width] = size(im);

    means = codebookmeans';
    
    if size(im, 3) == 3
        im = rgb2gray(im);
    end
    
    [frames, descriptors] = vl_sift(single(im));
        
    level_0 = getHistogram(descriptors, means);
    
    q1_descriptors = [];
    q2_descriptors = [];
    q3_descriptors = [];
    q4_descriptors = [];
    
    for i = (1 : length(frames))
        x = (frames(1, i)/width) * 100.00;
        y = (frames(2, i)/height) * 100.00;
        
        if x <= 50 && y <= 50
            q1_descriptors = [q1_descriptors descriptors(:, i)];
        elseif x > 50 && y <= 50
            q2_descriptors = [q2_descriptors descriptors(:, i)];
        elseif x <= 50 && y > 50
            q3_descriptors = [q3_descriptors descriptors(:, i)];
        elseif x > 50 && y > 50
            q4_descriptors = [q4_descriptors descriptors(:, i)];
        end
    end
        
    level_1 = [getHistogram(q1_descriptors, means) getHistogram(q2_descriptors, means) getHistogram(q3_descriptors, means) getHistogram(q4_descriptors, means)];
    
    q1_descriptors =  [];
    q2_descriptors =  [];
    q3_descriptors =  [];
    q4_descriptors =  [];
    q5_descriptors =  [];
    q6_descriptors =  [];
    q7_descriptors =  [];
    q8_descriptors =  [];
    q9_descriptors =  [];
    q10_descriptors = [];
    q11_descriptors = [];
    q12_descriptors = [];
    q13_descriptors = [];
    q14_descriptors = [];
    q15_descriptors = [];
    q16_descriptors = [];
    
    for i = (1 : length(frames))
        x = (frames(1, i)/width) * 100.00;
        y = (frames(2, i)/height) * 100.00;
        
        if     x <= 25  && y <= 25
            q1_descriptors = [q1_descriptors descriptors(:, i)];
        elseif x <= 50  && y <= 25
            q2_descriptors = [q2_descriptors descriptors(:, i)];
        elseif x <= 75  && y <= 25
            q3_descriptors = [q3_descriptors descriptors(:, i)];
        elseif x <= 100 && y <= 25
            q4_descriptors = [q4_descriptors descriptors(:, i)];
        elseif x <= 25  && y <= 50
            q5_descriptors = [q5_descriptors descriptors(:, i)];
        elseif x <= 50  && y <= 50
            q6_descriptors = [q6_descriptors descriptors(:, i)];
        elseif x <= 75  && y <= 50
            q7_descriptors = [q7_descriptors descriptors(:, i)];
        elseif x <= 100 && y <= 50
            q8_descriptors = [q8_descriptors descriptors(:, i)];
        elseif x <= 25  && y <= 75
            q9_descriptors = [q9_descriptors descriptors(:, i)];
        elseif x <= 50  && y <= 75
            q10_descriptors = [q10_descriptors descriptors(:, i)];
        elseif x <= 75  && y <= 75
            q11_descriptors = [q11_descriptors descriptors(:, i)];
        elseif x <= 100 && y <= 75
            q12_descriptors = [q12_descriptors descriptors(:, i)];
        elseif x <= 25  && y <= 100
            q13_descriptors = [q13_descriptors descriptors(:, i)];
        elseif x <= 50  && y <= 100
            q14_descriptors = [q14_descriptors descriptors(:, i)];    
        elseif x <= 75  && y <= 100
            q15_descriptors = [q15_descriptors descriptors(:, i)];        
        elseif x <= 100 && y <= 100
            q16_descriptors = [q16_descriptors descriptors(:, i)];
        end
        
    end
    
    level_2 = [getHistogram(q1_descriptors, means) getHistogram(q2_descriptors, means) getHistogram(q3_descriptors, means) getHistogram(q4_descriptors, means) getHistogram(q5_descriptors, means) getHistogram(q6_descriptors, means) getHistogram(q7_descriptors, means) getHistogram(q8_descriptors, means) getHistogram(q9_descriptors, means) getHistogram(q10_descriptors, means) getHistogram(q11_descriptors, means) getHistogram(q12_descriptors, means) getHistogram(q13_descriptors, means) getHistogram(q14_descriptors, means) getHistogram(q15_descriptors, means) getHistogram(q16_descriptors, means)];
    pyramid = [level_0 level_1 level_2];
    
end