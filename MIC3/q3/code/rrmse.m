function[rrmse] = rrmse(S1,R1)
   rrmse = sqrt(sum((S1-R1).^2,'all') / sum(S1.^2,'all'));
end
