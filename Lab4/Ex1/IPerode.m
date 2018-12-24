function eroded_image = IPerode(image,element)

reflected_element = rot90(element,2); %Reflect the element around its origin
A = image;                   %Convert to double

A_expanded = zeros(size(A,1)+2,size(A,2)+2); %Expand image
A_expanded(2:end-1,2:end-1) = A;            %Add image to center
A_expanded(2:end-1,1)=0;               %Copy edges to sides
A_expanded(2:end-1,end) = 0;
A_expanded(1,2:end-1) = 0;
A_expanded(end,2:end-1) = 0;

%We now create 9 copies of the original image so that we will later apply
%the reflected_element, cycling through the sides
A_expanded_up = [A_expanded(2:end,:); A_expanded(1,:)]; 
A_expanded_down = [A_expanded(end,:); A_expanded(1:end-1,:)];  
A_expanded_left = [A_expanded(:,2:end) A_expanded(:,1)]; 
A_expanded_right = [A_expanded(:,end) A_expanded(:,1:end-1)];

A_expanded_up_left = [A_expanded_up(:,2:end) A_expanded_up(:,1)];
A_expanded_down_left = [A_expanded_down(:,2:end) A_expanded_down(:,1)];
A_expanded_up_right = [A_expanded_up(:,end) A_expanded_up(:,1:end-1)];
A_expanded_down_right = [A_expanded_down(:,end) A_expanded_down(:,1:end-1)];

%Apply reflected_element
A_expanded_result = reflected_element(1,1)*A_expanded_up_left + reflected_element(1,2)*A_expanded_up + reflected_element(1,3)*A_expanded_up_right + reflected_element(2,1)*A_expanded_left + reflected_element(2,2)*A_expanded + reflected_element(2,3)*A_expanded_right + reflected_element(3,1)*A_expanded_down_left + reflected_element(3,2)*A_expanded_down + reflected_element(3,3)*A_expanded_down_right;
%Use only center of the image
A_result = A_expanded_result(2:end-2,2:end-1);
eroded_image = (A_result == sum(reflected_element(:)));
end