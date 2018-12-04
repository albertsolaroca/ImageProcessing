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
        newLevels = (0:numLevels-1)*(255/(numLevels-1)); %new space of values
        %project each original value to the closest of the new space
        for row = 1:length(f) 
            for i = 1:length(f(row,:))
                [value,index] = min(abs(newLevels-double(f(row,i))));
                f(row,i) = round(newLevels(index));
            end
        end
        figure;
        imshow(f);
        reducedImage = f; %return transformed image
    end
end