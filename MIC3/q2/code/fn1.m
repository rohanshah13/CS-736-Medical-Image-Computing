%% uses square poetntial function
function [val] = fn1(x,b,A,a,gamma)
    % Adding the  -log of likelihood to the value 
    
    val = sum((A*x-b).^2);
    
    x = reshape(x,128,128);
    %Adding the -log of prior to the value
    
    val = val + a/2*sum((x-circshift(x,[1 0])).^2,'all');
    val = val + a/2*sum((x-circshift(x,[-1 0])).^2,'all');
    val = val + a/2*sum((x-circshift(x,[0 1])).^2,'all');
    val = val + a/2*sum((x-circshift(x,[0 -1])).^2,'all');
    %size(val)
    
end