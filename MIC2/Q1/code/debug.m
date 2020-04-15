step = 1;
dif = 5;
m = imread('../data/mri_image_noise_level_medium.png');
m = double(m);
k = m(49,49);
Ni = Nb([49,49],m);
mn = m(49,49);

while dif > 0.001
    
    fn_l = gauss_exp(k,mn,1) + quad_prior(k,Ni);
    new = k - step*(2*(sum(k-Ni)) + mn - k);
    fn_n = gauss_exp(new,mn,1) + quad_prior(new,Ni);
    
    if fn_n < fn_l
        itr=itr+1;
        k = new;
        step = 11*step/10;
    else
        step = step/2;
    end
    dif = abs(fn_n - fn_l);
    
end
