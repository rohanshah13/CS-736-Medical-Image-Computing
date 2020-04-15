function [V,E] = variation_modes(al_shapes)
    sz = size(al_shapes);
    al_shapes = transpose(reshape(al_shapes,[],sz(3)));
    %[V,E] = svd(cov(al_shapes));
    %E = diag(E);
    [V , E] = eig(cov(al_shapes));
    V = flip(V,2);
    E = flip(diag(E));
end