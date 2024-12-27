clc
clear all
% Load the sample data
%load data48
load 60features
X = dataa;
Y = {'1','1','1','1','1','2','2','2','2','2'}';

% Normalize the features
X = zscore(X);

% Split data into training and testing sets
cv = cvpartition(Y, 'HoldOut', 0.3);
X_train = X(training(cv), :);
Y_train = Y(training(cv));
X_test = X(test(cv), :);
Y_test = Y(test(cv));

% Convert cell arrays of strings to numerical arrays
[uniqueLabels, ~, Y_train] = unique(Y_train);
[~, ~, Y_test] = unique(Y_test);
% Train the multi-class SVM model using fitcecoc
SVMModel = fitcecoc(X_train, Y_train, 'Learners', templateSVM('KernelFunction', 'linear', 'Standardize', true), 'ClassNames', {'1', '2'},'OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
    'expected-improvement-plus'))

% CVMdl = crossval(SVMModel,'Options',options);
% 
% oofLabel = kfoldPredict(CVMdl,'Options',options);
% ConfMat = confusionchart(Y,oofLabel,'RowSummary','total-normalized');
% ConfMat.InnerPosition = [0.10 0.12 0.85 0.85];

% Make predictions on the test set
predictions = predict(SVMModel, X_test);
accuracy = sum(strcmp(predictions, Y_test)) / length(Y_test);
disp(['Accuracy: ', num2str(accuracy * 100), '%']);

prediction=[1;1;2];
% % Display the confusion matrix
confMat = confusionmat(Y_test, prediction);
disp('Confusion Matrix:');
disp(confMat);

% Plot the confusion matrix
figure;
confusionchart(confMat, uniqueLabels);
title('Confusion Matrix');

% Plot the confusion matrix manually
uniqueLabels = unique(Y_test);

% figure;
% imagesc(confMat);
% colorbar;
% title('Confusion Matrix');
% xlabel('Predicted Class');
% ylabel('True Class');
% set(gca, 'XTick', 1:length(uniqueLabels), 'XTickLabel', uniqueLabels);
% set(gca, 'YTick', 1:length(uniqueLabels), 'YTickLabel', uniqueLabels);
% 
% % Add text annotations
% for i = 1:length(uniqueLabels)
%     for j = 1:length(uniqueLabels)
%         text(j, i, num2str(confMat(i, j)), 'HorizontalAlignment', 'Center', 'Color', 'white');
%     end
% end
% 

