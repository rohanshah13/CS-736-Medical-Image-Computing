function [y] = sinc(x)
    c = (x ~= 0);
    x(c) = sin(x(c))./x(c);
    x(~c) = 1;
    y = x;
end
    
    