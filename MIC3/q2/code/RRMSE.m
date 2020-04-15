function[rrmse] = RRMSE(S,R)
S1 = mat2gray(S);
R1 = mat2gray(R);
rrmse = sqrt(sum((S1-R1).^2,'all') / sum(S1.^2,'all'));
end
