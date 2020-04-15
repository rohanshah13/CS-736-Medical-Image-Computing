%% differentating for huber function
function [val] = diff_fn2(x,y,a,var,gamma)   
    val = (1-a)*2*(y-x)/var;
    for i = 1:2
        for j = -1:2:1
            tp = sqrt(sum((x - circshift(x,j,i)).^2,3));
            temp = zeros(256,256,3);
            temp(:,:,1) = tp;
            temp(:,:,2) = tp;
            temp(:,:,3) = tp;
            diff = (x - circshift(x,j,i));
            cd = abs(temp) <= gamma;
                          
                
                val(cd) = val(cd) + a*(temp(cd).*diff(cd));
                cd = abs(temp) > gamma;
                val(cd) = val(cd) + a*gamma*(diff(cd)./temp(cd));
            
        end
    end
end