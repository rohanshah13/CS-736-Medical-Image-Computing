%% differentating for huber function
function [val] = diff_fn2(x,b,A,a,gamma)   
    val = 2*A.'*(A*x-b);
    
    val = reshape(val,128,128);
    x = reshape(x,128,128);
    
    for i = 1:2
        for j = -1:1:2
            temp = (x - circshift(x,j,i));
            cd = abs(temp) <= gamma;
            val(cd) = val(cd) + a*temp(cd);
            cd = abs(temp) > gamma;
            val(cd) = val(cd) + a*gamma*sign(temp(cd)); 
        end
    end
    
    val = reshape(val,128*128,1);
end