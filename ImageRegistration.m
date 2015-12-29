clc
clear all
close all

%% Capture Images

% img1 = imread('images/example_7/image_1.jpg');
% %img2 = imread('images/example_2/image_2.jpg');
% img2 = Registered;
% 
% img1_gray = rgb2gray(img1);
% Result  = img1_gray-img2;
% 
% figure; imshow(Result);
orthophoto = imread('images/example_7/image_1.jpg');
figure, imshow(orthophoto)
unregistered = imread('images/example_7/image_2.jpg');
figure, imshow(unregistered)
cpselect(unregistered, orthophoto)

%% Show points
mytform = fitgeotrans(movingPoints, fixedPoints, 'projective');
registered = imwarp(unregistered, mytform);

 
    



%Moving = rgb2gray(Moving);
%imshowpair(Fixed,Moving,'montage');
Fixed = rgb2gray(Fixed);
%% Image Registration
% tformEstimate = imregcorr(Moving,Fixed);
% Rfixed = imref2d(size(Fixed));
% movingReg = imwarp(Moving,tformEstimate,'OutputView',Rfixed);
%  
% figure, imshowpair(Fixed,movingReg,'montage');
% figure, imshowpair(Fixed,movingReg,'falsecolor');