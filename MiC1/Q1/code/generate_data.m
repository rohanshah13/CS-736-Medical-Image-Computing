

A = imread('../data/elipse/1.jpg');

BW = im2bw(A);

stats = regionprops('table',BW,'MajorAxisLength','MinorAxisLength','Orientation','Centroid')
center = stats.Centroid.'
major = stats.MinorAxisLength
points = zeros(2,16,150);

for i = 1:150
    points(1,:,i) = sin(linspace(0,2*pi,16));
    points(2,:,i) = cos(linspace(0,2*pi,16));
end

path = "../data/";
ext = ".jpg";

for i = 1:150
    
    img = path+i+ext;
    A = im2bw(imread(img));
    stats = regionprops('table',A,'MajorAxisLength','MinorAxisLength','Orientation','Centroid');
    T = stats.Centroid.';
    S = [ stats.MajorAxisLength, 0; 0, stats.MinorAxisLength];
    phi = stats.Orientation;
    R = [cosd(phi), -1*sind(phi); sind(phi), cosd(phi)];
    points(:,:,i) = R*(S*points(:,:,i)) + T;
end

save('../data/pointset/data.mat','points');