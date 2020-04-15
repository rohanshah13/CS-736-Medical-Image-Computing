%% using the huber function for Prior
function [val] = fn2(x,y,a,var,gamma,Ni)
    
    val = (1-a)*sum((y-x).^2 / var,'all');
    for i = 1:4
        temp = abs(x - Ni(:,:,i));
        
        cd = temp <= gamma;
        val = val +  a*sum(0.5*(temp(cd).^2),'all')/2;
        cd = temp > gamma;
        val = val + a*gamma*sum( temp(cd) - 0.5*gamma ,'all')/2;
    end    
end