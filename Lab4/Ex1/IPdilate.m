function dilated_image = IPdilate(image,element)

reflected_element = rot90(element,2); %Reflect the element around its origin
%We now create 9 copies of the original image so that we will later apply
%the reflected_element, cycling through the sides
image_up = [image(2:end,:); image(1,:)]; 
image_down = [image(end,:); image(1:end-1,:)];  
image_left = [image(:,2:end) image(:,1)]; 
image_right = [image(:,end) image(:,1:end-1)];

image_up_left = [image_up(:,2:end) image_up(:,1)];
image_down_left = [image_down(:,2:end) image_down(:,1)];
image_up_right = [image_up(:,end) image_up(:,1:end-1)];
image_down_right = [image_down(:,end) image_down(:,1:end-1)];

image_result = reflected_element(1,1)*image_up_left + reflected_element(1,2)*image_up + reflected_element(1,3)*image_up_right + reflected_element(2,1)*image_left + reflected_element(2,2)*image + reflected_element(2,3)*image_right + reflected_element(3,1)*image_down_left + reflected_element(3,2)*image_down + reflected_element(3,3)*image_down_right;
dilated_image = (image_result > 0);
end