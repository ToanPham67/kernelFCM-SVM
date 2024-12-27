clc
clear all
% Example data (replace this with your actual predicted scores and true labels)
predicted_scores = rand(100, 1);  % Replace with your predicted scores
true_labels = randi([0, 1], 100, 1);  % Replace with your true labels (0 or 1)

% Calculate AUC
[~, ~, ~, AUC] = perfcurve(true_labels, predicted_scores, 1);
disp(['AUC: ', num2str(AUC)])

% Convert predicted scores to binary predictions using a threshold (e.g., 0.5)
threshold = 0.5;
binary_predictions = predicted_scores >= threshold;

% 
% true_labels = logical(true_labels);
% 
% % Calculate confusion matrix
% conf_mat = confusionmat(true_labels, binary_predictions);
% 
% % Display the confusion matrix
% disp('Confusion Matrix:');
% disp(conf_mat);
% % 

% Calculate Accuracy (ACC)
accuracy = sum(binary_predictions == true_labels) / length(true_labels);
disp(['Accuracy: ', num2str(accuracy)])

% Calculate True Positive (TP), False Positive (FP), True Negative (TN), False Negative (FN)
TP = sum(binary_predictions == 1 & true_labels == 1);
FP = sum(binary_predictions == 1 & true_labels == 0);
TN = sum(binary_predictions == 0 & true_labels == 0);
FN = sum(binary_predictions == 0 & true_labels == 1);

% Calculate Precision, Recall, and F1 Score
precision = TP / (TP + FP);
recall = TP / (TP + FN);
f1_score = 2 * (precision * recall) / (precision + recall);

disp(['Precision: ', num2str(precision)])
disp(['Recall: ', num2str(recall)])
disp(['F1 Score: ', num2str(f1_score)])
