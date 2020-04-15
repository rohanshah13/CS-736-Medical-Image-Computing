function [sh] = find_closest(al_shapes, ref)
    sz = size(al_shapes);
    sz = sz(3);
    ind = 1;
    min = 100000;
    
    for i = 1:sz
        dist = img_dist(ref , al_shapes(:,:,i));
        if dist < min
            min = dist;
            ind = i;
        end
    end
    
    sh = al_shapes(:,:,ind);
    
end