function [mean_shape, aligned_shapes, itr] = mean_img(shapes)
% Gives the shapes aligned wrt the last mean and the mean shape

f = 1;

sz = size(shapes);
rng = 1:sz(3);

shapes = shapes - mean(shapes,2);
last_shape = mean(shapes,3);
last_shape = f*last_shape/sqrt(sum(last_shape.^2,'all'));

%for the iteration
for i = rng
shapes(:,:,i) = img_align(last_shape, shapes(:,:,i)); %aligning the shapes to mean 
% function img_align scales them to unit norm and beings centroid to origin
end

mean_shape = mean(shapes,3); % take empirical mean
mean_shape = f*mean_shape/sqrt(sum(mean_shape.^2,'all')); % scale the mean_shape
itr = 2;

while img_dist(mean_shape,last_shape) > 0.0000001

    itr = itr + 1;
    last_shape = mean_shape;

    %align images
    for i=rng
        shapes(:,:,i) = img_align(mean_shape, shapes(:,:,i));
    end
    
    %new mean
    mean_shape = mean(shapes,3); % take empirical mean
    mean_shape = f*mean_shape/sqrt(sum(mean_shape.^2,'all')); % scale the mean_shape
   
end
    
for i=rng
        shapes(:,:,i) = img_align(mean_shape, shapes(:,:,i));
end
    
aligned_shapes = shapes;

end
