%% using discontinuity adaptive function as given in statement 
function [val] = fn3(x,y,a,var,gamma)
    
    val = (1-a)*sum((y-x).^2 / var,'all');
    for i = 1:2
        for j = -1:2:1
            temp = sqrt(sum((x - circshift(x,j,i)).^2,3));
        
            val = val + a*gamma*sum(temp - gamma*log(1+temp/gamma) ,'all')/2;
        end
    end    
end

