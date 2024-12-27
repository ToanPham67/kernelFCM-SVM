clc;
clear all;
% fig = figure;
KernelF=[];
xk=[];
 dataa=[];
%num2str(k)
for k = 4% 1 :10
	% Create an image filename, and read it in to a variable called imageData.
	jpgFileName = strcat('Image', sprintf('%.2d', k), '.jpg');
	if exist(jpgFileName, 'file')
		imageData = imread(jpgFileName);
        originalImage = double(rgb2gray(imageData )); % Convert to grayscale
        % Normalize the image to the range [0, 1]
        normalizedImage= mat2gray(originalImage);
%      
%         subplot(2,5,k)
%         imshow(normalizedImage{k});
%         title("Image 0"+ num2str(k))
%       
       
        numClusters = 8;  
        fuzziness = 2;   
        data = reshape(normalizedImage, [], 1);
        [centers, U] = fcm(data, numClusters, [fuzziness, NaN, NaN, NaN]);
        [~, clusterIndices] = max(U);
         clusteredResult{k} = reshape(clusterIndices, size(normalizedImage));
         normalized{k} = mat2gray(clusteredResult{k});
% %          subplot(2,5,k)
% %         imshow(normalized{k});
% %         title("Image 0"+ num2str(k))
%         glcm = graycomatrix(normalized{k},'Offset',[0 1;-1 1;-1 0;-1 -1;0 2; -2 2;-2 0;-2 -2;0 3; -3 3;-3 0;-3 -3;]);%0 4; -4 4;-4 0;-4 -4],'Symmetric',true);% -1 1;-1 0;-1 -1;0 2; -2 2;-2 0;-2 -2;0 3; -3 3;-3 0;-3 -3;0 4; -4 4;-4 0;-4 -4]);
%         stats = graycoprops(glcm,'Contrast Correlation Energy Homogeneity');
%         dataa=[dataa;stats.Energy stats.Contrast stats.Correlation stats.Homogeneity];
%         subplot(2,5,k)
%         imagesc(clusteredResult{k});
%         title("Image 0"+ num2str(k))
%         
%         % Extract tumor region (assuming the tumor is the brightest cluster)
        tumorRegion{k} = clusteredResult{k} == mode(clusterIndices);
%         subplot(2,5,k)
%         hold on
        imshow(tumorRegion{k});
        title("tumor region of image 0"+ num2str(k));
        fprintf('File %s has been read.\n', jpgFileName);
    else
		fprintf('File %s does not exist.\n', jpgFileName);
    end
    imwrite(tumorRegion{k}, 'tumorRegion.jpg');
end
% [c,d]=kmeans(dataa,2)
%  suptitle('Outcome of the MRI image segmentation process');
 hold off

