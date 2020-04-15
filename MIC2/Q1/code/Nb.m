function [Ni] = Nb(img)
    r = length(img);
    c = length(img(1,:));
    Ni = zeros(1,4*r*c);
    Ni=reshape(Ni,[r,c,4]);
    for i = 1:r
        for j= 1:c
           Ni(i,j,:) = [img(i , mod(j,c) + 1), img(i , mod(j - 2,c)+1), img(mod(i,r)+1,j), img(mod(i-2,r)+1,j)];
        end    
    end
end