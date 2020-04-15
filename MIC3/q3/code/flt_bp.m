function[img] = flt_bp(R, xp, theta, L, flt, mx)
    freq = (linspace(-1,1,length(xp)))';
    k = fft(R,[],1);
    k = fftshift(k,1);
    k = k.*repmat(myFilter(freq, L, flt),[1 length(theta)]);
    k = ifftshift(k,1);
    R =  real(ifft(k,[],1));
    img = iradon(R,theta,mx,'linear','none');
    img = mat2gray(img);
end