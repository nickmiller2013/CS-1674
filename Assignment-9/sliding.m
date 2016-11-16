function sliding(imt, model, subx, suby);
run('vlfeat-0.9.20/toolbox/vl_setup')

outDir = 'sliding/';
[row, ~] = size(imt);
z = 0;
t = 1;
for i = 1: row
    if strcmp(imt{i,2},'pos')
        z = z+1;
        if z < 6
            redir = [outDir num2str(i)];
            mkdir(redir); 

            im = imt{i, 3};
            [x, y] = size(im);
            for k = 1:10:y-suby
                for j = 1:10:x-subx
                    rect = [k j suby-1 subx-1];
                    resizeImage = imcrop(im, rect);
                    [a, b, ~] = size(resizeImage);
                    if (a == subx) && ( b == suby)
                        imhog = vl_hog(single(resizeImage), 8);
                        size(imhog(:)');
                        check = predict(model, imhog(:)');
                        if(strcmp(check,'pos'))
                            if z == 1
                                figure
                                imshow(resizeImage);
                            end
                            imwrite(resizeImage,[redir '/posImg' num2str(t) '.png'])

                            posImg{t} = resizeImage;
                            t = t + 1;
                        end
                    end
                    
                end
            end
        end
    end

    
end