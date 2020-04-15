%% using discontinuity adaptive function as given in statement 
function [val] = fn3(x,y,a,var,gamma,Ni)
    
    val = (1-a)*sum((y-x).^2 / var,'all');
    for i = 1:4
        temp = abs(x - Ni(:,:,i));
        val = val + a*gamma*sum(temp - gamma*log(1+temp/gamma) ,'all')/2;
    end    
end

