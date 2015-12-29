%% Active Contour Example
% This example allows the user to select and segment a portion of the
% image using active countours

% Copyright 2014 The MathWorks, Inc.

%% Read in image
I = imread('Toys_Candy.jpg');
imshow(I);
%%  Convert to grayscale image
Igray = rgb2gray(I);
imshow(Igray);

%%  Complement the image 
Igray = imcomplement(Igray);
imshow(Igray);
%% Create a mask to select the area to segment
mask = roipoly;
  
imshow(mask)
title('Initial MASK');

%%  Run activecontour() with set number interations
maxIterations = 500; 
% bw = activecontour(Igray, mask, maxIterations, 'edge');
bw = activecontour(Igray, mask, maxIterations, 'Chan-Vese');
% Display segmented image
imshow(bw)
title('Segmented Image');   



