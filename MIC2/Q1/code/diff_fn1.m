%% For gradient for fn1
function [val] = diff_fn1(x,y,a,var,gamma,Ni)
    val = (1-a)*2*(x - y)/var;
    
    for i = 1:4
        val = val + a*2*(x-Ni(:,:,i));
    end
end

