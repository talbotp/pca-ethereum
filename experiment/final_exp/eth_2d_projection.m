
% In this script we collect our first two principal components, form there
% we concatenate them into a matrix, which will be our Projection Matrix.

clear all;

%load data/eth_eigenvalues.dat;  % Just so we can ensure that our data is in
                                %ascending / descending order as we need.

load data/eth_eigenvectors_supply.dat;

% In these files our eigenvalues are in ascending order, and as we are
% considering two dimensions, we consider the last two eigenvectors as our
% projection matrix.

proj_matrix = zeros(14, 2); % Require a 14 x 2 matrix.

% We hard code it as there are only two vectors

proj_matrix(:, 1) = eth_eigenvectors_supply(:, 14);

proj_matrix(:, 2) = eth_eigenvectors_supply(:, 13);

save data/eth_projection_matrix_supply.dat proj_matrix -ascii;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In this next part, we use our projection matrix to transform our sample
% data to our new space. This new space should contain our data in 2
% dimensions with an 825 x 2 matrix.

load data/eth_data_afterNorm.dat;

transform = eth_data_afterNorm * proj_matrix;

save data/eth_data_2d_transform_supply.dat transform -ascii;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Next, we plot our data as a 2d transform with our labels we created long
% ago.

load data/eth_labels_supplyOnly.dat;


N = size(eth_labels_supplyOnly, 1);

% Loop through the labels and plot their corresponding point in the
% 2d transformed data.

for i = 1 : N
    
    if eth_labels_supplyOnly(i) == 1
        plot(transform(i, 1), transform(i, 2), 'm*');   % black *
    elseif eth_labels_supplyOnly(i) == 2
        plot(transform(i, 1), transform(i, 2), 'bo');   % blue circle
    elseif eth_labels_supplyOnly(i) == 3
        plot(transform(i, 1), transform(i, 2), 'g+');   % green +
    elseif eth_labels_supplyOnly(i) == 4
        plot(transform(i, 1), transform(i, 2), 'rs');   % red square
   % elseif priceOnly_labels(i) == 5
    %    plot(transform(i, 1), transform(i, 2), 'kx');   % magenta x
    end
    
    hold on;
end

xlabel('First Principal Component');
ylabel('Second Principal Component');

print figures/eth_2d_projection.eps -depsc;








