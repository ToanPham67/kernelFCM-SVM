% clc
% clear all
% % Đọc hình ảnh vào biến img
% img = imread('Image01.jpg');
% 
% % Chuyển hình ảnh sang ảnh xám nếu cần thiết
% if size(img, 3) == 3
%     img_gray = rgb2gray(img);
% else
%     img_gray = img;
% end
% 
% % Chia hình ảnh thành các ô có kích thước mong muốn (ví dụ: 32x32 ô)
% window_size = 32;
% [rows, cols] = size(img_gray);
% num_windows_row = floor(rows / window_size);
% num_windows_col = floor(cols / window_size);
% 
% % Khởi tạo ma trận GLCM
% glcm = graycomatrix(img_gray, 'Offset', [0 1], 'Symmetric', true);
% 
% % Tính toán đặc trưng năng lượng của texture từ ma trận GLCM
% energy = zeros(num_windows_row, num_windows_col);
% 
% % for i = 1:num_windows_row
% %     for j = 1:num_windows_col
% %         % Lấy ô ảnh trong cửa sổ
% %         window = img_gray((i-1)*window_size + 1:i*window_size, (j-1)*window_size + 1:j*window_size);
% %         
% %         % Tính toán ma trận GLCM cho cửa sổ
% %         glcm_window = graycomatrix(window, 'Offset', [0 1], 'Symmetric', true);
% %         
% %         % Tính toán energy từ ma trận GLCM
% %         energy(i, j) = sum(glcm_window(:).^2);
% %     end
% % end
% 
% % Hiển thị đặc trưng năng lượng của texture
% % disp('Energy feature of image texture:');
% % disp(energy);
% % 
% % % Hiển thị hình ảnh
% % subplot(1, 2, 1);
% % imshow(img_gray);
% % title('Grayscale Image');
% %
% % Chia hình ảnh thành các ô có kích thước mong muốn
% window_size = 32;
% [rows, cols] = size(img_gray);
% num_windows_row = floor(rows / window_size);
% num_windows_col = floor(cols / window_size);
% 
% % Khởi tạo các ma trận cho các đặc trưng
% energy = zeros(num_windows_row, num_windows_col);
% contrast = zeros(num_windows_row, num_windows_col);
% correlation = zeros(num_windows_row, num_windows_col);
% homogeneity = zeros(num_windows_row, num_windows_col);
% 
% for i = 1:num_windows_row
%     for j = 1:num_windows_col
%         % Lấy ô ảnh trong cửa sổ
%         window = img_gray((i-1)*window_size + 1:i*window_size, (j-1)*window_size + 1:j*window_size);
%         
%         % Tính toán ma trận GLCM cho cửa sổ
%         glcm_window = graycomatrix(window, 'Offset', [0 1], 'Symmetric', true);
%         
%         % Tính toán các đặc trưng từ ma trận GLCM
%         stats = graycoprops(glcm_window, {'Energy', 'Contrast', 'Correlation', 'Homogeneity'});
%         energy(i, j) = stats.Energy;
%         contrast(i, j) = stats.Contrast;
%         correlation(i, j) = stats.Correlation;
%         homogeneity(i, j) = stats.Homogeneity;
%             
%         % Compute the autocorrelation
%         glcm_norm = glcm_window / sum(glcm_window(:));
%         autocorrelation(i, j) =  glcm_norm(i, j) .* (i * j);
%           
%     end
% end
%%
clc;
clear all;

% Đọc hình ảnh vào biến img
img = imread('tumorRegion.jpg');

% Chuyển hình ảnh sang ảnh xám nếu cần thiết
if size(img, 3) == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

% Chia hình ảnh thành các ô có kích thước mong muốn (ví dụ: 32x32 ô)
window_size = 32;
[rows, cols] = size(img_gray);
num_windows_row = floor(rows / window_size);
num_windows_col = floor(cols / window_size);

% Khởi tạo các ma trận cho các đặc trưng
energy = zeros(num_windows_row, num_windows_col);
contrast = zeros(num_windows_row, num_windows_col);
correlation = zeros(num_windows_row, num_windows_col);
homogeneity = zeros(num_windows_row, num_windows_col);
autocorrelation = zeros(num_windows_row, num_windows_col);

for i = 1:num_windows_row
    for j = 1:num_windows_col
        % Lấy ô ảnh trong cửa sổ
        window = img_gray((i-1)*window_size + 1:i*window_size, (j-1)*window_size + 1:j*window_size);
        
        % Tính toán ma trận GLCM cho cửa sổ
        glcm_window = graycomatrix(window, 'Offset', [-1 -1], 'Symmetric', true);
        
        % Tính toán các đặc trưng từ ma trận GLCM
        stats = graycoprops(glcm_window, {'Energy', 'Contrast', 'Correlation', 'Homogeneity'});
        energy(i, j) = stats.Energy;
        contrast(i, j) = stats.Contrast;
        correlation(i, j) = stats.Correlation;
        homogeneity(i, j) = stats.Homogeneity;
        
        % Tính toán autocorrelation từ ma trận GLCM
        glcm_norm = glcm_window / sum(glcm_window(:));
        [m, n] = size(glcm_norm);
        autocorr = 0;
        for k = 1:m
            for l = 1:n
                autocorr = autocorr + glcm_norm(k, l) * (k * l);
            end
        end
        autocorrelation(i, j) = autocorr;
    end
end

% Hiển thị đặc trưng năng lượng của texture
% disp('Energy feature of image texture:');
% disp(energy);
% 
% disp('Autocorrelation feature of image texture:');
% disp(autocorrelation);




% Hiển thị hình ảnh và các đặc trưng
figure;

% Hiển thị hình ảnh xám
subplot(2, 3, 1);
imshow(img_gray);
title('Grayscale Image');

% Hiển thị Energy
subplot(2, 3, 2);
imagesc(energy);
colorbar;
title('Energy');

% Hiển thị Contrast
subplot(2, 3, 3);
imagesc(contrast);
colorbar;
title('Contrast');

% Hiển thị Contrast
subplot(2, 3, 4);
imagesc(autocorrelation);
colorbar;
title('autocorrelation');

% Hiển thị Correlation
subplot(2, 3, 5);
imagesc(correlation);
colorbar;
title('Correlation');

% Hiển thị Homogeneity
subplot(2, 3, 6);
imagesc(homogeneity);
colorbar;
title('Homogeneity');




