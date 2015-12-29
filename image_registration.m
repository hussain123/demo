function res = image_registration(img1,img2)

[optimizer, metric]  = imregconfig('monomodal');
res = imregister(img1,img2,'similarity',optimizer,metric);

end