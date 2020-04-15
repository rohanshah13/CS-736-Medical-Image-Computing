function [x,y] = get_pointset(i) 
    path = "../data/brain/mri_image_";
    ext = ".png"; 
    k = imread(path+i+ext);
    k = flip(k);
%imshow(k);
k = im2bw(k, 0.4);
    [B] = bwboundaries(k);
    imshow(k);
    hold on;
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'Y', 'LineWidth', 2)
end

    [x , y] = getpts;