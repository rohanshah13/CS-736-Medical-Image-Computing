function [val] = RRMSE(denoised)
    noiseless = double(imread('../data/mri_image_noiseless.png'));
    denoised = double(denoised);
    val = sqrt(sum((denoised - noiseless).^2,'all'))/sqrt(sum(noiseless.^2,'all'));
end