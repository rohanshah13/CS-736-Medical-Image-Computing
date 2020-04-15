%% For dradient for fn1
function [val] = diff_fn1(x,y,a,var,gamma)
    val = (1-a)*2*(x - y)/var;
    
    val = val +  2*a*(x - circshift(x,1,1));
    val = val +  2*a*(x - circshift(x,-1,1));
    val = val +  2*a*(x - circshift(x,1,2));
    val = val +  2*a*(x - circshift(x,-1,2));
end

