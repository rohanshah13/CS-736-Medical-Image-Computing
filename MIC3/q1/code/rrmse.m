function[rrmse] = rrmse(S,R)
S1 = double(S);
S1 = mat2gray(S1);
R1 =double(R);
R1 = mat2gray(R1);
rrmse = sqrt(sum((S1-R1).^2,'all') / sum(S1.^2,'all'));
end
