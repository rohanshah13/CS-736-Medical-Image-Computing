function [] = plot_all(shapes)
warning('off','all');
sz = size(shapes);
rng = sz(3);
hold on
for i = 1:rng
plt=img_plot(shapes(:,:,i));
plt.EdgeColor = rand(1,3);
end
hold off
end