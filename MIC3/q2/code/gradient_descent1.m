function [x,itr,itrs] = gradient_descent1(A,b,a,gamma,step,thr,max_itr,option,init)
%% initialization
%y = double(y);
x = init;

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
%Ni_x = Nb(x);
fn_x = fn(x,b,A,a,gamma);
%itrs(itr) = fn_x;

while step > thr && itr < max_itr %terminate when step size falls below a threshold 
    
    itr = itr + 1;
    n = x - step*diff_fn(x,b,A,a,gamma);
    fn_n = fn(n,b,A,a,gamma);
    %fn_n
    %fn_n
    %itr
    %step
    if fn_n < fn_x
        x = n; %updating solution
   
        fn_x = fn_n; %updating function value
        step = 11*step/10; %incresing step size by 10% for successful iteration
    else
        step = step/3; %decreasing step size by 50% for unsuccessful operation
    end
    %itrs(itr) = fn_x;
end
%denoised = uint8(x);
x = 255*x;
x = uint8(x);
x = mat2gray(x);
end