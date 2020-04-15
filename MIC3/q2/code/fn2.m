%% using the huber function for Prior
function [val] = fn2(x,b,A,a,gamma)
    
    val = sum((A*x-b).^2);
    for i = 1:2
        for j = -1:1:2
            temp = abs(x - circshift(x,j,i));
            
            cd = temp <= gamma;
            val = val +  a*sum(0.5*(temp(cd).^2),'all')/2;
            cd = temp > gamma;
            val = val + a*gamma*sum( temp(cd) - 0.5*gamma ,'all')/2;
        end
    end    
end