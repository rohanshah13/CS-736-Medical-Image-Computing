function [pgon] = img_plot(in)
pgon = plot(polyshape(in(1,:),in(2,:)));
pgon.FaceColor = 'none';
pgon.EdgeColor = 'Blue';
pgon.LineWidth = 0.5;
axis equal;
end