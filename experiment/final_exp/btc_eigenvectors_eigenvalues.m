% Here is the step where we actually begin implementing some of the steps
% of PCA. We note that the data must be normalized before we run this
% script.
% 
% Our first step here is to calculate the covariance matrix.
% We then save the corresponding eigenvalues and eigenvectors to a text
% file in the data folder.

clear all;

load data/btc_data_afterNorm.dat;

data = btc_data_afterNorm;

%Here we work out the covariance matrix of the normalized data.
% This will yield a 14x14 matrix.
covMatrix = cov(data);

% We save the covariance matrix.

save data/btc_covariance_matrix.dat covMatrix -ascii;


% mAYBE TRY THIS WITH EIGS FOR ORDERING.
[eigenvectors, eigenvalues] = eig(covMatrix);

%eigenvalues;
% In this next part, we save the eigenvalues to a text file

Dim_val = size(covMatrix, 1);

eigenvalues_labels = ones(Dim_val, 1);

for i = 1 : Dim_val
    eigenvalues_labels(i) = eigenvalues(i, i);
end

%{
for i = 1 : Dim_val
    disp(eigenvalues_labels(i));
end
%}

save data/btc_eigenvalues.dat eigenvalues_labels -ascii;

% Here, we save the eigenvectors

save data/btc_eigenvectors.dat eigenvectors -ascii;


