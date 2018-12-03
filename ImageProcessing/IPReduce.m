function reducedImage = IPReduce(imname,numLevels)
    clc;                                  % clear the command window
    close all;                            % close open figure windows      
    if (numLevels > 8 || numLevels < 0)
    else
        inputfile = [imname,'.tif'];
        figure;
        f = imread(inputfile);
        imshow(f);
        newLevels = 0:2^numLevels:255
        length(newLevels)
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
    end
end