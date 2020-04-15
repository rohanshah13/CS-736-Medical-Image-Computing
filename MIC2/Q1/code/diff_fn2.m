%% differentating for huber function
function [val] = diff_fn2(x,y,a,var,gamma,Ni)   
    val = (1-a)*2*(x-y)/var;
    for i = 1:4
        temp = (x - Ni(:,:,i));
        cd = abs(temp) <= gamma;
        val(cd) = val(cd) + a*temp(cd);
        cd = abs(temp) > gamma;
        val(cd) = val(cd) + a*gamma*sign(temp(cd)); 
    end
end