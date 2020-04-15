function [itr,itrs,denoised] = gradient_descent(y,a,var,gamma,step,thr,max_itr,option)
%% initialization
y = double(y);
x = y;
itr = 1;
itrs = zeros(1,max_itr);
%% chosing functions
if option == 1
    fn = @fn1;
    diff_fn = @diff_fn1;
elseif option == 2
    fn = @fn2;
    diff_fn = @diff_fn2;    
elseif option == 3
    fn = @fn3;
    diff_fn = @diff_fn3;
end
%% gradient descent
Ni_x = Nb(x);
fn_x = fn(x,y,a,var,gamma,Ni_x);
itrs(itr) = fn_x;

while step > thr %&& itr < 100 %terminate when step size falls below a threshold 
    
    itr = itr + 1;
    n = x - step*diff_fn(x,y,a,var,gamma,Ni_x);
    fn_n = fn(n,y,a,var,gamma,Ni_x);
    
    if fn_n < fn_x
        x = n; %updating solution
        fn_x = fn_n; %updating function value
        step = 11*step/10; %incresing step size by 10% for successful iteration
        Ni_x = Nb(n); %updating neighbouring values
    else
        step = step/2; %decreasing step size by 50% for unsuccessful operation
    end
    itrs(itr) = fn_x;
end
denoised = uint8(x);

end