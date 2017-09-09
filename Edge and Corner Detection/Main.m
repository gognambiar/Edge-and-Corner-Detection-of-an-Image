pkg load image
A = imread("img03.jpg");
A = rgb2gray(A);
sigma = 5;
h = fspecial('gaussian',[3,3], sigma);
img1 = myImageFilter(A,h);
imwrite(uint8(img1),"ImageFilter_Img03.jpg");
[Im, Io, Ix, Iy] = myEdgeFilter(A,5);


imwrite(uint8(Im),"edge_Img03.jpg");
[R] = myHarrisCorner(Ix, Iy, 8000);

figure;
imshow((A));
hold on;
plot(R(:,2),R(:,1),'ro');
hold off;



A = imread("img04.jpg");
A = rgb2gray(A);
img1 = myImageFilter(A,h);
imwrite(uint8(img1),"ImageFilter_Img04.jpg");
[Im, Io, Ix, Iy] = myEdgeFilter(A,5);
[R] = myHarrisCorner(Ix, Iy, 8000);

figure;
imshow((A));
hold on;
plot(R(:,2),R(:,1),'ro');
hold off;



A = imread("img05.jpg");
A = rgb2gray(A);
img1 = myImageFilter(A,h);
imwrite(uint8(img1),"ImageFilter_Img05.jpg");
[Im, Io, Ix, Iy] = myEdgeFilter(A,5);


imwrite(uint8(Im),"edge_Img05.jpg");
[R] = myHarrisCorner(Ix, Iy, 8000);

figure;
imshow((A));
hold on;
plot(R(:,2),R(:,1),'ro');
hold off;




A = imread("img02.jpg");
#A = rgb2gray(A);
img1 = myImageFilter(A,h);
[Im, Io, Ix, Iy] = myEdgeFilter(A,5);

imwrite(uint8(img1),"ImageFilter_Img02.jpg");
imwrite(uint8(Im),"edge_Img02.jpg");
[R] = myHarrisCorner(Ix, Iy, 8000);

figure;
imshow((A));
hold on;
plot(R(:,2),R(:,1),'ro');
hold off;





A = imread("img01.jpg");
#A = rgb2gray(A);
img1 = myImageFilter(A,h);
[Im, Io, Ix, Iy] = myEdgeFilter(A,5);

imwrite(uint8(img1),"ImageFilter_Img01.jpg");
imwrite(uint8(Im),"edge_Img01.jpg");

[R] = myHarrisCorner(Ix, Iy, 8000);

figure;
imshow((A));
hold on;
plot(R(:,2),R(:,1),'ro');
hold off;



