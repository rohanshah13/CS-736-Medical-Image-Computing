mri = "../data/mri_image_";
level = ["noiseless.png" , "noise_level_low.png", "noise_level_medium.png", "noise_level_high.png" ];

%% variables
%g = 0.5, a = 0.1, var = 168 for medium, rrmse = 0.1110
gamma = 9;
a = 0.5;
%initial step size matters
step = 0.2;
max_itr = 100;
thr = 1e-8;
var=1;
option = 1;
%% main
y = imread(mri + level(2));
% gradient_descent(y,a,gamma,step,thr,max_itr,option)
% [itr, itrs, denoised]  =  gradient_descent(y,a,var,gamma,step,thr,max_itr,option);
% imshow(denoised);

%% Opt Parameters
last = 100;
lasta = 100;
lastg = 100;
for i = 1:0.1:5
    for j = 0.2:0.02:0.9
        disp (i + " " + j );
        [itr, itrs, denoised]  =  gradient_descent(y,j,var,i,step,thr,max_itr,option);
        upd = RRMSE(denoised);
        if upd < last
              lasta = j;
              lastg = i;
              last = upd;
         end
     end 
end

%option 2
%noise level high := a = 0.74, g = 5,rrmse=0.1206 var = 1;
%noise level med := a = 0.7 g = 4.2, rrmse = 0.1106 or a = 0.5, g = 9, rrmse = 0.1104
%noise level low := a = 0.4800, g = 4.8, rrmse = 0.0425

%option 3
% low a=0.72, g = 2.200
% med  a = 0.72, g = 5, rrmse = 0.1103;
%option 1
%high a=0.46,g=1,rrmse=0.1269
%med = a=0.2,g=1,rrmse=0.1163
%low a=0.2,g=1,rrmse=0.0520