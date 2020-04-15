function[Ram_Lak_filtered, Shepp_Logan_filtered, Cosine_filtered] = myFilter(R,xp,theta,L)
    
    N = length(xp);
    freqs = linspace(-1,1,N).';
    %freqs = abs(freqs);
    freqs(abs(freqs)>L) = 0;
    
    Ram_Lak = abs(freqs);
    Shepp_Logan = freqs*0;
    Shepp_Logan(abs(freqs)>0) = abs(freqs(abs(freqs)>0))./(0.5*pi*freqs(abs(freqs)>0)/L).*sin(0.5*pi*freqs(abs(freqs)>0)/L);
    Cosine = abs(freqs).*cos(0.5*pi*freqs/L);
    
    Ram_Lak = repmat(Ram_Lak, [1 length(theta)]);
    Shepp_Logan = repmat(Shepp_Logan, [1 length(theta)]);
    Cosine = repmat(Cosine, [1 length(theta)]);

    dft_centred = fftshift(fft(R),1);
    
    filtered1 = Ram_Lak.*dft_centred;
    filtered1 = ifftshift(filtered1,1);
    Ram_Lak_filtered = real(ifft(filtered1));
    
    filtered2 = Shepp_Logan.*dft_centred;
    filtered2 = ifftshift(filtered2,1);
    Shepp_Logan_filtered = real(ifft(filtered2));
    
    filtered3 = Cosine.*dft_centred;
    filtered3 = ifftshift(filtered3,1);
    Cosine_filtered = real(ifft(filtered3));
    
end