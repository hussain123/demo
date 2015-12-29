%% Color Based Segmentation
% This example preprocesses and image with color based segmentation in the RGB color space.  
% After segmenting the image, region properties are extracted to count and label the objects. 

% Copyright 2014 The MathWorks, Inc.


%% Read in image

I = sub2;
imshow(I);

%% Solution:  Thresholding the image on each color pane
%Im=double(img)/255;
Im=I;

rmat=Im(:,:,1);
gmat=Im(:,:,2);
bmat=Im(:,:,3);

subplot(2,2,1), imshow(rmat);
title('Red Plane');
subplot(2,2,2), imshow(gmat);
title('Green Plane');
subplot(2,2,3), imshow(bmat);
title('Blue Plane');
subplot(2,2,4), imshow(I);
title('Original Image');

%%
levelr = 0.63;
levelg = 0.5;
levelb = 0.4;
i1=im2bw(rmat,levelr);
i2=im2bw(gmat,levelg);
i3=im2bw(bmat,levelb);
Isum = (i1&i2&i3);

% Plot the data
subplot(2,2,1), imshow(i1);
title('Red Plane');
subplot(2,2,2), imshow(i2);
title('Green Plane');
subplot(2,2,3), imshow(i3);
title('Blue Plane');
subplot(2,2,4), imshow(Isum);
title('Sum of all the planes');

%% Complement Image and Fill in holes
Icomp = imcomplement(Isum);
Ifilled = imfill(Icomp,'holes');
figure, imshow(Ifilled);

%%
se = strel('disk', 25);
Iopenned = imopen(Ifilled,se);
% figure,imshowpair(Iopenned, I);
imshow(Iopenned);

%% Extract features

Iregion = regionprops(Iopenned, 'centroid');
[labeled,numObjects] = bwlabel(Iopenned,4);
stats = regionprops(labeled,'Eccentricity','Area','BoundingBox');
areas = [stats.Area];
eccentricities = [stats.Eccentricity];

%% Use feature analysis to count skittles objects
idxOfSkittles = find(eccentricities);
statsDefects = stats(idxOfSkittles);

figure, imshow(I);
hold on;
for idx = 1 : length(idxOfSkittles)
        h = rectangle('Position',statsDefects(idx).BoundingBox,'LineWidth',2);
        set(h,'EdgeColor',[.75 0 0]);
        hold on;
end
if idx > 10
title(['There are ', num2str(numObjects), ' objects in the image!']);
end
hold off;


