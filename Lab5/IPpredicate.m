function ans = IPpredicate(subf) %The input of this function is a 
                                 %smaller part of the image
    if(mean(subf(:))>100 && std2(subf)<6)
       ans = true;
    else
       ans= false;
    end

end