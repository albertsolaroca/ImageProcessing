function reducedImage = IPReduce(imname,numLevels)
    clc;                                  % clear the command window
    close all;                            % close open figure windows      
    if (~ismember(numLevels,[256 128 64 32 16 8 4 2]))
        reducedImage = 0; %not a correct level, exit with error
    else
        inputfile = [imname,'.tif'];
        figure;
        f = imread(inputfile);
        imshow(f);
        newLevels = (1:round(256/(numLevels-1)):257) - 1 %new space of values
        newLevels(end) = 255; %adjust black
        for row = 1:length(f) %project each value to the closest of the new space
            for i = 1:length(f(row,:))
                [value,index] = min(abs(newLevels-double(f(row,i))));
                f(row,i) = newLevels(index);
            end
        end
        figure;
        imshow(f);
        reducedImage = f; %return transformed image
    end
end