%% Gradient for fn1
function [val] = diff_fn1(x,b,A,a,gamma)

    val = 2*A.'*(A*x-b);
    
    val = reshape(val,128,128);
    x = reshape(x,128,128);
  
    val = val + 2*a*(x-circshift(x, [1 0]));
    val = val + 2*a*(x-circshift(x, [-1 0]));
    val = val + 2*a*(x-circshift(x, [0 1]));
    val = val + 2*a*(x-circshift(x, [0 -1]));
    
    val = reshape(val,[],1);
    
end