function x = IPidwt(y,jScale)
% Given a scaled vector and the scale used, recover the original one
    %x is the otriginal vector
    %y is the scaled vector
    for i = jScale:-1:1
        comp_size = size(y,2)/(2^i);
        c_prev = zeros(1,comp_size*2);
        c_prev(1:2:end) = (y(1:comp_size)+y(comp_size+1:2*comp_size))/sqrt(2); %prev approx
        c_prev(2:2:end) =(y(1:comp_size)-y(comp_size+1:2*comp_size))/sqrt(2); %prev detail
        d_prev = y(2*comp_size+1:end); %carried previous details
        y = [c_prev d_prev];
    end
    x = y;
    
end

