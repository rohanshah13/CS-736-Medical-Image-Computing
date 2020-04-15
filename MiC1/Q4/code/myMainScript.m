%Written with MATLAB 2019Rb
%Note that some functions might not work in depricated versions

tic
warning('off','all');
%% load data

w = waitbar(0.2, "Loading Pointsets...",'windowstyle', 'modal' );
shapes = importdata('../data/pointset/data.mat');

sz = size(shapes);
n = sz(3); %no of images
p = sz(2);

%% Plot all shapes
fig1 = figure('Name','a) Plot all shapes');
plot_all(shapes);
waitbar(0.25, w, "Plotting all shapes...");

%% Mean Shape
[mn, al_shapes, itr] = mean_img(shapes);
fig2 = figure('Name','b) Plot computed shape mean');
img_plot(mn);
waitbar(0.3,w,"Calculating Mean Shape...");

%% Modes of variation
waitbar(0.35,w,"Finding Modes of Variation...");
[vec, val] = variation_modes(al_shapes);
waitbar(0.5,w,"Plotting Variations");
fig3 = figure('Name', 'c) Plot variations');
plot(val);
snapnow


%% Aligned shapes
waitbar(0.4,w,"Plotting aligned shapes...");
fig4 = figure('Name','Aligned Shapes and Mean');
plot_all(al_shapes);
hold on
plt = img_plot(mn);
plt.EdgeColor = 'Black';
plt.LineWidth = 2;


%% first three modes of variation
fig5 = figure('Name','first 3 modes of variation');
t=tiledlayout(3,3);

names = ["1st" "2nd" "3rd"];

for r = 1:3

waitbar(0.45+(r-1)*0.05, w,"Plotting " + names(r) + " Mode...");
v1 = vec(:,r);
v1 = reshape(v1,2,[]);
val1 = sqrt(val(r));

tl = nexttile;
plt=img_plot(mn- v1*3*val1);
title(tl,'mode2 -3*sd');
plt.FaceColor = 'blue';
plt.FaceAlpha = 0.1;

tl=nexttile;
plt=img_plot(mn);
title(tl,'mean');
plt.FaceColor = 'blue';
plt.FaceAlpha = 0.1;

tl=nexttile;
plt=img_plot(mn+ v1*3*val1);
title(tl,'mode2 +3*sd');
plt.FaceColor = 'blue';
plt.FaceAlpha = 0.1;
end

t.Padding='compact';
t.TileSpacing = 'compact';

%% Figure 6
v2 = vec(:,1);
v2 = reshape(v2,2,[]);
val2 = sqrt(val(1));

fig6 = figure('Name','e) Closest shapes');
t=tiledlayout(2,2);

names = ["mean" "mode1 -3sd" "mode1 +3sd"];

for r = 1:3
waitbar(0.7 + (r-1)*0.1,w,"Shape Closest to " + names(r) + "...");
tl = nexttile;
hold on
plt=img_plot(find_closest(al_shapes , mn));
plt.EdgeColor = 'red';
plt.FaceAlpha = 0.3; 
plt = img_plot(mn);
plt.EdgeColor = 'blue';
plt.FaceAlpha = 0; 
title(tl, "closest to "+names(r) );
axis equal
legend('closest shape','reference')
hold off

end
t.TileSpacing = 'compact';
t.Padding = 'compact';

%% Finshing and Saving Plots
waitbar(1,w,"Finishing and saving plots...");
%{
figures = [fig1 fig2 fig3 fig4 fig5 fig6];
k=0;
for j = figures
    k=k+1;
    saveas(j,"../report/fig" + k + ".jpg");
end
%}
close(w);
toc