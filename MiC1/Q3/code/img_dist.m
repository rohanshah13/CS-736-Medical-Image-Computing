function [proc_distance] = img_dist(Z1,Z2)
   % Z1 = Z1 / sqrt(sum(Z1.^2,'all'));
   %Z2 = img_align(Z1,Z2);
   proc_distance = sqrt(sum((Z1 - Z2).^2,'all'));
end