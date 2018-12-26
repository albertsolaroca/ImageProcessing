function boundary = IPboundary(image,element)

eroded_image = IPerode(image,element);
boundary = image - eroded_image;

end