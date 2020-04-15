%% uses square poetntial function
function [val] = fn1(x,y,a,var,gamma,Ni)
    % Adding the  -log of likelihood to the value 
    val=(1-a)*sum((y-x).^2 / var,'all');
    
    %Adding the -log of prior to the value
    for i = 1:4
        val = val +  a*sum((x -Ni(:,:,i)).^2,'all')/2;
    end
    
end