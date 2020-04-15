%% using discontinuity adaptive function as given in statement 
function [val] = fn3(x,b,A,a,gamma)
    val = sum((A*x-b).^2);
    for i = 1:2
        for j = -1:1:2
            temp = abs(x - circshift(x,j,i));
            val = val + a*gamma*sum(temp - gamma*log(1+temp/gamma) ,'all')/2;
        end
    end    
end

