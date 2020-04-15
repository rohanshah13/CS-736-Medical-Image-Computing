%% differentiation function
function [val] = diff_fn3(x,y,a,var,gamma)   
    val = (1-a)*2*(x - y)/var;
    for i = 1:2 
        for j = -1:2:1
            temp = sqrt(sum((x - circshift(x,j,i)).^2,3));
            diff = (x - circshift(x,j,i));
            for k = 1:3
                val(:,:,k) = val(:,:,k) + gamma*diff(:,:,k).*((gamma+temp).^(-1));
            end
        end
    end   
end