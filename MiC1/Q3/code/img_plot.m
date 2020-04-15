function [pgon] = img_plot(in)
pgon = plot(polyshape(in(1,:),in(2,:)));
axis equal;
pgon.FaceColor = 'none';
pgon.EdgeColor = 'Blue';
pgon.LineWidth = 0.8;
end