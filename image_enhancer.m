
clc
clear all
close all

%read images
%% replace your images here
img1 = imread('images/example_2/image_1.jpg');
img2 = imread('images/example_2/image_2.jpg');
% img3 = imread('images/example_2/image_3.jpg');
% img4 = imread('images/example_2/image_4.jpg');

%% grayscaled
img1_gray = rgb2gray(img1);
img2_gray = rgb2gray(img2);

%black and white
img1_bw = im2bw(img1_gray);
img2_bw = im2bw(img2_gray);

% get array upper bounds
[x, y, z] = size(img1);

% initialize reconstructed image
reconstructed_img_bg = img1;
reconstructed_img_fg = zeros(x,y,z);

size(reconstructed_img_bg);

imtool(reconstructed_img_bg)

oculuded1 = img2-img1;
oculuded2 = img1-img2;

imtool(oculuded1)
imtool(oculuded2)

for i=1:x
    for j=1:y
        
            if oculuded1(i,j,1) > 15 || oculuded1(i,j,2) > 15  || oculuded1(i,j,3) > 15 
                
                reconstructed_img_bg(i,j,1) = img2(i,j,1);
                reconstructed_img_bg(i,j,2) = img2(i,j,2);
                reconstructed_img_bg(i,j,3) = img2(i,j,3);
                
            elseif oculuded2(i,j,1) > 15 || oculuded2(i,j,2) > 15  || oculuded2(i,j,3) > 15
                
                reconstructed_img_bg(i,j,1) = img1(i,j,1);
                reconstructed_img_bg(i,j,2) = img1(i,j,2);
                reconstructed_img_bg(i,j,3) = img1(i,j,3);
                
            end
                   
    end
end
imwrite(reconstructed_img_bg,'images/Result/example8.jpg');
 figure; imshow(reconstructed_img_bg);
 figure('units','normalized','outerposition',[0 0 1 1])
 subplot(1,5,1),imshow(img1);title('Image 1 RGB')
 subplot(1,5,2),imshow(img2);title('Image 2 RGB')
 subplot(1,5,3),imshow(oculuded1);title('Ocluded region 1')
 subplot(1,5,4),imshow(oculuded2);title('Ocluded region 2')
 subplot(1,5,5),imshow(reconstructed_img_bg);title('Reconstructed Image')

% test1 = abs(img2-img1);
% test2 = abs(img2-img3);
% 
% imtool(test1);
% imtool(test2);
% 
% 
% for i=1:x
%     for j=1:y
%         
%             if test1(i,j,1) ~= 1 && test1(i,j,2) ~= 1 && test1(i,j,3) ~= 1
%                 
%                 reconstructed_img_bg(i,j,1) = img1(i,j,1);
%                 reconstructed_img_bg(i,j,2) = img1(i,j,2);
%                 reconstructed_img_bg(i,j,3) = img1(i,j,3);  
%                 
%             end  
%           
%     end
% end
% 
% 
% for i=1:x
%     for j=1:y
%         
%             if test2(i,j,1) ~= 1 && test2(i,j,2) ~= 1 && test2(i,j,3) ~= 1
%                 
%                 reconstructed_img_bg(i,j,1) = img1(i,j,1);
%                 reconstructed_img_bg(i,j,2) = img1(i,j,2);
%                 reconstructed_img_bg(i,j,3) = img1(i,j,3);  
%                 
%             end  
%           
%     end
% end
% 
% 
% imtool(reconstructed_img_bg)
% 
% for i=1:x
%     for j=1:y
%         
%             if reconstructed_img_bg(i,j,1) == 1 && reconstructed_img_bg(i,j,2) == 1 && reconstructed_img_bg(i,j,3) == 1
%                 
%                 reconstructed_img_bg(i,j,1) = img1(i,j,1);
%                 reconstructed_img_bg(i,j,2) = img1(i,j,2);
%                 reconstructed_img_bg(i,j,3) = img1(i,j,3);                
%             end  
%          
%     end
% end
% 
% 
% 
% % reconstruct final background
% % for i=1:x
% %     for j=1:y
% % 
% %             if reconstructed_img_bg(i,j,k) > 0
% %                 
% % 
% %                 reconstructed_img_bg(i,j,k) = img2(i,j,k);
% %                 
% %             end 
% %           
% %     end
% % end
% 
% 
% figure('units','normalized','outerposition',[0 0 1 1])
% subplot(1,4,1),imshow(img1);title('Image 1 RGB')
% subplot(1,4,2),imshow(img2);title('Image 2 RGB')
% subplot(1,4,3),imshow(img3);title('Image 3 RGB')
% subplot(1,4,4),imshow(reconstructed_img_bg);title('Reconstructed Background')