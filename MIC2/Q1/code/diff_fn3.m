%% differentiation function
function [val] = diff_fn3(x,y,a,var,gamma,Ni)   
    val = (1-a)*2*(x-y)/var;
    for i = 1:4
        temp = (x - Ni(:,:,i));
        val = val + a*gamma*temp.*((gamma+abs(temp)).^(-1));
    end
end