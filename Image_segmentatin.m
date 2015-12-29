%%Read in Image
I = imread('images/example_8/image_1.jpg');
imshow(I)
%% Convert To GrayScal
Igray = rgb2gray(I);
imshow(Igray);
%%
level = 0.3;
Ithresh = im2bw(Igray,level);
imshowpair(I,Ithresh,'montage');