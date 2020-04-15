%% uses square poetntial function
function [val] = fn1(x,y,a,var,gamma)
    % Adding the  -log of likelihood to the value 
    val=(1-a)*sum((y-x).^2 / var,'all');
    
    %Adding the -log of prior to the value
    val = val +  a*sum((x - circshift(x,1,1)).^2,'all')/2;
    val = val +  a*sum((x - circshift(x,-1,1)).^2,'all')/2;
    val = val +  a*sum((x - circshift(x,1,2)).^2,'all')/2;
    val = val +  a*sum((x - circshift(x,-1,2)).^2,'all')/2;
    
    
end