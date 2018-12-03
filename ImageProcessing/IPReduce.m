function reducedImage = IPReduce(imname,numLevels)
    clc;                                  % clear the command window
    close all;                            % close open figure windows      
    if (~ismember(numLevels,[256 128 64 32 16 8 4 2]))
        reducedImage = 0;
    else
        inputfile = [imname,'.tif'];
        figure;
        f = imread(inputfile);
        imshow(f);
        newLevels = (1:round(256/numLevels):256) - 1;
        newLevels(end) = 255;
        %Agafar figura i separar els valors entre 2^numLevels
        %agafar els valors de la imatge i enviar-los a el mes proper
        for row = 1:length(f)
            for i = 1:length(f(row,:))
                [value,index] = min(abs(newLevels-double(f(row,i))));
                f(row,i) = newLevels(index);
            end
        end
        figure;
        imshow(f);
        reducedImage = f;
    end
end