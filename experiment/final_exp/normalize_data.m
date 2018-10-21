% We use this script to normalize the data for PCA.
% Should be 286 x 14

clear all;

load data/btc_data.dat;

data = btc_data;

Number_of_points = size(data, 1);
Dim = size(data, 2);

% Here, we center the data.
mu = mean(data);
data = data - ones(Number_of_points, 1) * mu;

% Coordinate wise st dev is 1.

for d = 1 : Dim
   data (:,d) = data(:,d)./std(data(:,d));
end

save data/btc_data_afterNorm.dat data -ascii;