%% differentiation function
function [val] = diff_fn3(x,b,A,a,gamma)   
    val = 2*A.'*(A*x-b);
    
    val = reshape(val,128,128);
    x = reshape(x,128,128);
    for i = 1:2
        for j = -1:1:2
            temp = (x - circshift(x,j,i));
            val = val + a*gamma*temp.*((gamma+abs(temp)).^(-1));
        end
    end
    
    val = reshape(val,128*128,1);
end