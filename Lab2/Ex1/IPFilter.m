function newImage = IPFilter(imname,filter)

clc;                                  % clear the command window
close all;                            % close open figure windows      
inputfile = [imname,'.tif'];
f = imread(inputfile);                        %Display original image

A = im2double(f);                   %Convert to double

A_expanded = zeros(size(A,1)+2,size(A,2)+2); %Expand image
A_expanded(2:end-1,2:end-1) = A;            %Add image to center
A_expanded(2:end-1,1)=A(:,1);               %Copy edges to sides
A_expanded(2:end-1,end) = A(:,end);
A_expanded(1,2:end-1) = A(1,:);
A_expanded(end,2:end-1) = A(end,:);

%We now create 9 copies of the original image so that we will later apply
%the filter, cycling through the sides
A_expanded_up = [A_expanded(2:end,:); A_expanded(1,:)]; 
A_expanded_down = [A_expanded(end,:); A_expanded(1:end-1,:)];  
A_expanded_left = [A_expanded(:,2:end) A_expanded(:,1)]; 
A_expanded_right = [A_expanded(:,end) A_expanded(:,1:end-1)];

A_expanded_up_left = [A_expanded_up(:,2:end) A_expanded_up(:,1)];
A_expanded_down_left = [A_expanded_down(:,2:end) A_expanded_down(:,1)];
A_expanded_up_right = [A_expanded_up(:,end) A_expanded_up(:,1:end-1)];
A_expanded_down_right = [A_expanded_down(:,end) A_expanded_down(:,1:end-1)];

%Apply filter
A_expanded_result = filter(1,1)*A_expanded_up_left + filter(1,2)*A_expanded_up + filter(1,3)*A_expanded_up_right + filter(2,1)*A_expanded_left + filter(2,2)*A_expanded + filter(2,3)*A_expanded_right + filter(3,1)*A_expanded_down_left + filter(3,2)*A_expanded_down + filter(3,3)*A_expanded_down_right;
%Use only center of the image
A_result = A_expanded_result(2:end-2,2:end-1);
%Return to uint8
newImage = im2uint8(A_result);


end