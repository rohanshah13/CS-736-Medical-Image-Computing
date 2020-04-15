function[x] = tikhonov(A,b,lambda)
    %gradient descent much faster than equation solving
    %optimum value is 12 
    %adding ticknonv prior = lambda*L2(x)
    k = 0;
    phantom = mat2gray(imread('../data/ChestPhantom.png'));
    phantom = reshape(phantom,[],1);
    if k == 1
        lambda = repmat(lambda,[1 length(x)]);
        x = ((A')*A + lambda' * lambda) \ (A')*b;
    else
        step = 1;
        stpcnt = 0;
        thr = 1e-8;
        x = ones(128*128,1);
        lambda = lambda^2;
        err = sum((A*x - b).^2,'all') + lambda*sum(x.^2,'all');
        while step > thr && stpcnt < 500
        %err
        %step
        
        x_new = x - 2*step*(A.'*(A*x - b) + lambda*x); 
        err_new = sum((A*x_new - b).^2,'all') + lambda*sum(x_new.^2,'all');
        if err_new < err
            step = 11*step/10;
            x = x_new;
            err = err_new;
            RRMSE(phantom,mat2gray(uint8(255*x)))
        else
            step = step/2;
        end
        stpcnt = stpcnt + 1;
        end
    end
    x = 255*x;
    x = uint8(x);
    x = mat2gray(x);
end