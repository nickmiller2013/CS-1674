function [features, x, y, scores] = compute_features(x,y,scores,Ix,Iy)

bin1 = 0;
bin2 = 0;
bin3 = 0;
bin4 = 0;
bin5 = 0;
bin6 = 0;
bin7 = 0;
bin8 = 0;

[rows, cols] = size(Ix);

[c d] = size(scores)


edges = [1:1:8];
h = histogram(x,edges);
count = 1;

for k = 1: d
    
    if x(k)-5 <= 0 || x(k)-4 <= 0 || x(k)-3 <= 0 || x(k)-2 <= 0 || x(k)-1 <= 0 || x(k) <= 0 || x(k)+5 >= cols || x(k)+4 >= cols || x(k)+3 >= cols || x(k)+2 >= cols || x(k)+1 >= cols || x(k) == cols
        disp('To close')
    elseif y(k)-5 <= 0 || y(k)-4 <= 0 || y(k)-3 <= 0 || y(k)-2 <= 0 || y(k)-1 <= 0 || y(k) <= 0 || y(k)+5 >= rows || y(k)+4 >= rows || y(k)+3 >= rows || y(k)+2 >= rows || y(k)+1 >= rows || y(k) == rows
        disp('To close')
    else
        j = x(k)
        i = y(k)
        for s = 0: 5
            for t = 0: 5
                grad_mag(i-t, j+s) = sqrt(Ix(i-t, j+s)^2 + Iy(i-t, j+s)^2);
                orient_raw = atand(Iy(i-t, j+s) / Ix(i-t, j+s))
                if(isnan(orient_raw))
                    assert(grad_mag(i-t, j+s) == 0);
                    orient_raw = 0; % if no change, we won't count a gradient magnitude
                end
                
                assert(orient_raw >= -90);
                if(orient_raw <= -67.5)
                    grad_orient(i-t, j+s) = 1;
                    barcount(count) = 1;
                elseif(orient_raw <= -45)
                    grad_orient(i-t, j+s) = 2;
                    barcount(count) = 2;
                elseif(orient_raw <= -22.5)
                    grad_orient(i-t, j+s) = 3;
                    barcount(count) = 3;
                elseif(orient_raw <= 0)
                    grad_orient(i-t, j+s) = 4;
                    barcount(count) = 4;
                elseif(orient_raw <= 22.5)
                    grad_orient(i-t, j+s) = 5;
                    barcount(count) = 5;
                elseif(orient_raw <= 45)
                    grad_orient(i-t, j+s) = 6;
                    barcount(count) = 6;
                elseif(orient_raw <= 67.5)
                    grad_orient(i-t, j+s) = 7;
                    barcount(count) = 7;
                else
                    grad_orient(i-t, j+s) = 8;
                    barcount(count) = 8;
                    
                    % FILL IN!
                end
                grad_mag(i+t, j-s) = sqrt(Ix(i+t, j-s)^2 + Iy(i+t, j-s)^2);
                orient_raw = atand(Iy(i+t, j-s) / Ix(i+t, j-s));
                if(isnan(orient_raw))
                    assert(grad_mag(i+t, j-s) == 0);
                    orient_raw = 0; % if no change, we won't count a gradient magnitude
                end
                
                assert(orient_raw >= -90);
                if(orient_raw <= -67.5)
                    grad_orient(i+t, j-s) = 1;
                    barcount(count) = 1;
                elseif(orient_raw <= -45)
                    grad_orient(i+t, j-s) = 2;
                    barcount(count) = 2;
                elseif(orient_raw <= -22.5)
                    grad_orient(i+t, j-s) = 3;
                    barcount(count) = 3;
                elseif(orient_raw <= 0)
                    grad_orient(i+t, j-s) = 4;
                    barcount(count) = 4;
                elseif(orient_raw <= 22.5)
                    grad_orient(i+t, j-s) = 5;
                    barcount(count) = 5;
                elseif(orient_raw <= 45)
                    grad_orient(i+t, j-s) = 6;
                    barcount(count) = 6;
                elseif(orient_raw <= 67.5)
                    grad_orient(i+t, j-s) = 7;
                    barcount(count) = 7;
                else
                    grad_orient(i+t, j-s) = 8;
                    barcount(count) = 7;
                    
                    % FILL IN!
                end
                grad_mag(i+t, j+s) = sqrt(Ix(i+t, j+s)^2 + Iy(i+t, j+s)^2);
                orient_raw = atand(Iy(i+t, j+s) / Ix(i+t, j+s))
                if(isnan(orient_raw))
                    assert(grad_mag(i+t, j+s) == 0);
                    orient_raw = 0; % if no change, we won't count a gradient magnitude
                end
                
                assert(orient_raw >= -90);
                if(orient_raw <= -67.5)
                    grad_orient(i+t, j+s) = 1;
                    barcount(count) = 1;
                elseif(orient_raw <= -45)
                    grad_orient(i+t, j+s) = 2;
                    barcount(count) = 2;
                elseif(orient_raw <= -22.5)
                    grad_orient(i+t, j+s) = 3;
                    barcount(count) = 3;
                elseif(orient_raw <= 0)
                    grad_orient(i+t, j+s) = 4;
                    barcount(count) = 4;
                elseif(orient_raw <= 22.5)
                    grad_orient(i+t, j+s) = 5;
                    barcount(count) = 5;
                elseif(orient_raw <= 45)
                    grad_orient(i+t, j+s) = 6;
                    barcount(count) = 6;
                elseif(orient_raw <= 67.5)
                    grad_orient(i+t, j+s) = 7;
                    barcount(count) = 7;
                else
                    grad_orient(i+t, j+s) = 8;
                    barcount(count) = 8;
                    
                    % FILL IN!
                end
                grad_mag(i-t, j-s) = sqrt(Ix(i-t, j-s)^2 + Iy(i-t, j-s)^2);
                orient_raw = atand(Iy(i-t, j-s) / Ix(i-t, j-s));
                if(isnan(orient_raw))
                    assert(grad_mag(i-t, j-s) == 0);
                    orient_raw = 0; % if no change, we won't count a gradient magnitude
                end
                
                assert(orient_raw >= -90);
                if(orient_raw <= -67.5)
                    grad_orient(i-t, j-s) = 1;
                    barcount(count) = 1;
                elseif(orient_raw <= -45)
                    grad_orient(i-t, j-s) = 2;
                    barcount(count) = 2;
                elseif(orient_raw <= -22.5)
                    grad_orient(i-t, j-s) = 3;
                    barcount(count) = 3;
                elseif(orient_raw <= 0)
                    grad_orient(i-t, j-s) = 4;
                    barcount(count) = 4;
                elseif(orient_raw <= 22.5)
                    grad_orient(i-t, j-s) = 5;
                    barcount(count) = 5;
                elseif(orient_raw <= 45)
                    grad_orient(i-t, j-s) = 6;
                    barcount(count) = 6;
                elseif(orient_raw <= 67.5)
                    grad_orient(i-t, j-s) = 7;
                    barcount(count) = 7;
                else
                    grad_orient(i-t, j-s) = 8;
                    barcount(count) = 8;
                    
                    % FILL IN!
                end
                
                count = count + 1;

            end
        end
    end
end

for k = 1: d
    
    if x(k)-5 <= 0 || x(k)-4 <= 0 || x(k)-3 <= 0 || x(k)-2 <= 0 || x(k)-1 <= 0 || x(k) <= 0 || x(k)+5 >= cols || x(k)+4 >= cols || x(k)+3 >= cols || x(k)+2 >= cols || x(k)+1 >= cols || x(k) == cols
        disp('To close')
    elseif y(k)-5 <= 0 || y(k)-4 <= 0 || y(k)-3 <= 0 || y(k)-2 <= 0 || y(k)-1 <= 0 || y(k) <= 0 || y(k)+5 >= rows || y(k)+4 >= rows || y(k)+3 >= rows || y(k)+2 >= rows || y(k)+1 >= rows || y(k) == rows
        disp('To close')
    else
        j = x(k)
        i = y(k)
        for s = 0: 5
            for t = 0: 5
                if grad_orient(i-t, j+s) == 1
                    bin1 = bin1 + grad_mag(i-t, j+s);
                elseif grad_orient(i-t, j+s) == 2
                    bin2 = bin2 + grad_mag(i-t, j+s);
                elseif grad_orient(i-t, j+s) == 3
                    bin3 = bin3 + grad_mag(i-t, j+s);
                elseif grad_orient(i-t, j+s) == 4
                    bin4 = bin4 + grad_mag(i-t, j+s);
                elseif grad_orient(i-t, j+s) == 5
                    bin5 = bin5 + grad_mag(i-t, j+s);
                elseif grad_orient(i-t, j+s) == 6
                    bin6 = bin6 + grad_mag(i-t, j+s);
                elseif grad_orient(i-t, j+s) == 7
                    bin7 = bin7 + grad_mag(i-t, j+s);
                elseif grad_orient(i-t, j+s) == 8
                    bin8 = bin8 + grad_mag(i-t, j+s);
                end
                
                if grad_orient(i+t, j+s) == 1
                    bin1 = bin1 + grad_mag(i+t, j+s);
                elseif grad_orient(i+t, j+s) == 2
                    bin2 = bin2 + grad_mag(i+t, j+s);
                elseif grad_orient(i+t, j+s) == 3
                    bin3 = bin3 + grad_mag(i+t, j+s);
                elseif grad_orient(i+t, j+s) == 4
                    bin4 = bin4 + grad_mag(i+t, j+s);
                elseif grad_orient(i-t, j+s) == 5
                    bin5 = bin5 + grad_mag(i+t, j+s);
                elseif grad_orient(i+t, j+s) == 6
                    bin6 = bin6 + grad_mag(i+t, j+s);
                elseif grad_orient(i+t, j+s) == 7
                    bin7 = bin7 + grad_mag(i+t, j+s);
                elseif grad_orient(i+t, j+s) == 8
                    bin8 = bin8 + grad_mag(i+t, j+s);
                end
                
                if grad_orient(i+t, j-s) == 1
                    bin1 = bin1 + grad_mag(i+t, j-s);
                elseif grad_orient(i+t, j-s) == 2
                    bin2 = bin2 + grad_mag(i+t, j-s);
                elseif grad_orient(i+t, j-s) == 3
                    bin3 = bin3 + grad_mag(i+t, j-s);
                elseif grad_orient(i+t, j-s) == 4
                    bin4 = bin4 + grad_mag(i+t, j-s);
                elseif grad_orient(i+t, j-s) == 5
                    bin5 = bin5 + grad_mag(i+t, j-s);
                elseif grad_orient(i+t, j-s) == 6
                    bin6 = bin6 + grad_mag(i+t, j-s);
                elseif grad_orient(i+t, j-s) == 7
                    bin7 = bin7 + grad_mag(i+t, j-s);
                elseif grad_orient(i+t, j-s) == 8
                    bin8 = bin8 + grad_mag(i+t, j-s);
                end
                

                if grad_orient(i-t, j-s) == 1
                    bin1 = bin1 + grad_mag(i-t, j-s);
                elseif grad_orient(i-t, j-s) == 2
                    bin2 = bin2 + grad_mag(i-t, j-s);
                elseif grad_orient(i+t, j-s) == 3
                    bin3 = bin3 + grad_mag(i+t, j-s);
                elseif grad_orient(i-t, j-s) == 4
                    bin4 = bin4 + grad_mag(i-t, j-s);
                elseif grad_orient(i-t, j-s) == 5
                    bin5 = bin5 + grad_mag(i-t, j-s);
                elseif grad_orient(i-t, j-s) == 6
                    bin6 = bin6 + grad_mag(i-t, j-s);
                elseif grad_orient(i-t, j-s) == 7
                    bin7 = bin7 + grad_mag(i-t, j-s);
                elseif grad_orient(i-t, j-s) == 8
                    bin8 = bin8 + grad_mag(i-t, j-s);
                end
                

            end
        end
    end
end

bins = [bin1 bin2 bin3 bin4 bin5 bin6 bin7 bin8];
sumbin = sum(bins);
nbin=bins/sumbin;

for i = 1: 8
    if nbin(i) >= .2
        nbin(i) = .2;
    end
end

sumbin = sum(nbin);
nbin=nbin/sumbin;


binranges = 1:8;
[bincounts] = histc(barcount,binranges);

sumbin = sum(bincounts);
nbinc=bincounts/sumbin;

for i = 1: 8
    if nbinc(i) >= .2
        nbinc(i) = .2;
    end
end

sumbin = sum(nbinc);
nbinc=nbinc/sumbin;

figure
bar(binranges,nbinc,'histc')
title('Orientation')

figure
bar(binranges,nbin,'histc')
title('Magnitude')

features = nbin;
