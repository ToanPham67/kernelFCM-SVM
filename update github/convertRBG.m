% Read the grayscale image
grayImage = imread('Cancer01.jpg'); % Replace 'grayscale_image.jpg' with the filename of your grayscale image
% Convert grayscale image to RGB
rgbImage = cat(3, grayImage, grayImage, grayImage);

% Display the grayscale and RGB images side by side
figure;

% Display grayscale image
subplot(1, 2, 1);
imshow(grayImage);
title('Grayscale Image');

% Display RGB image
subplot(1, 2, 2);
imshow(rgbImage);
title('RGB Image from Grayscale');
