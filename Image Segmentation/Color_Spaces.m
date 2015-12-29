%% Explore RGB, HSR, and LAB Color Space
% This example separates the color image into various color planes and displays them for comparison.

% Copyright 2014 The MathWorks, Inc.

%% Read in image
I = imread('Toys_Candy.jpg');
imshow(I);
%% RGB Color space
rmat=I(:,:,1);
gmat=I(:,:,2);
bmat=I(:,:,3);

figure;
subplot(2,2,1), imshow(rmat);
title('Red Plane');
subplot(2,2,2), imshow(gmat);
title('Green Plane');
subplot(2,2,3), imshow(bmat);
title('Blue Plane');
subplot(2,2,4), imshow(I);
title('Original Image');


%% HSV Color space
H = rgb2hsv(I);

H_plane=H(:,:,1);
S_plane=H(:,:,2);
V_plane=H(:,:,3);

% figure;
subplot(2,2,1), imshow(H_plane);
title('H Plane');
subplot(2,2,2), imshow(S_plane);
title('S Plane');
subplot(2,2,3), imshow(V_plane);
title('V Plane');
subplot(2,2,4), imshow(I);
title('Original Image');

%%  LAB Color Spaces
RGB = I;

cform = makecform('srgb2lab');
Lab = applycform(RGB,cform);

L_plane=Lab(:,:,1);
a_plane=Lab(:,:,2);
b_plane=Lab(:,:,3);

% figure;
subplot(2,2,1), imshow(L_plane);
title('L Plane');
subplot(2,2,2), imshow(a_plane);
title('a Plane');
subplot(2,2,3), imshow(b_plane);
title('b Plane');
subplot(2,2,4), imshow(I);
title('Original Image');
