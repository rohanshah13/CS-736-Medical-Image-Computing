function [A] = system_mat(sz, theta)
    
    option = 0;
    basis = zeros(sz);
    sk = size(radon(basis,theta));
    if option == 1
    A = zeros(length(1:2:sk(1))*length(theta), sz*sz);
    else
    A = zeros(sk(1)*length(theta), sz*sz);
    end
    
    for i = 1:sz
        for j = 1:sz
            basis(i,j) = 1;
            [R] = radon(basis,theta);
            if option == 1
            R = R(1:2:185, :);
            end
            R = reshape(R, [], 1);
            A(:,128*(j-1)+i) = R; 
            basis(i,j) = 0;
        end
    end
   
end