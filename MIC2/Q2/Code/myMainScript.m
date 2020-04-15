
tic

mri = "../data/histology_";
level = "noisy.png" ;

figure()
subplot(2,3,1);
imshow(mri+"noiseless.png");
title('Noiseless Image');

subplot(2,3,2);
imshow(mri+level);
title('Noisy Image');

%% variables

gamma = [5.28, 7.7, 4.4];
a = [0.70, 0.91, 0.95];
prior = ["Quadratic", "Huber", "Discontinuity Adaptive"];
%initial step size matters
step = 0.2;
max_itr = 100;
thr = 1e-8;
var=1;
i = zeros(256,256,3,3);
itrs = zeros(1,max_itr,3);
itr = zeros(3,1);
%option = 1;
%rrmse_vals11 = zeros(19,25);
%% main


y = imread(mri + level);
%gradient_descent(y,a,gamma,step,thr,max_itr,option)
i = zeros(256,256,3);
% for a = 0.1:0.05:1
%     for gamma = 1:25
%         [itr, itrs, i]  =  gradient_descent(y,a,var,gamma,step,thr,max_itr,option);
%         rrmse_vals11(int16((a-0.05)/0.05),gamma) = RRMSE(i);
%      end
%  end

for option = 1:3
    [itr(option), itrs(:,:,option), i(:,:,:,option)]  =  gradient_descent(y,a(option),var,gamma(option),step,thr,max_itr,option);
    subplot(2,3,option+3);
    imshow(uint8(i(:,:,:,option)));
    [HeightA,~,~] = size(uint8(i(:,:,:,option)));

    hT1 = title( strcat(prior(option), " prior"));
    T1Pos = round(get(hT1,'Position'));
    hT1_2 = text(T1Pos(1),T1Pos(2) + HeightA+50,strcat("RRMSE = ",num2str(RRMSE(i(:,:,:,option)))),'HorizontalAlignment','center');
end
for j = 1:3
    figure()
    plot(linspace(1,itr(j),itr(j)),itrs(1,1:itr(j),j))
    title( strcat(prior(j), " prior"));
end
% imshow(uint8(i));
% RRMSE(i)
toc