% We use this script to normalize the data for PCA.

clear all;

load data/eth_data_noTime_noReg_noPrice.dat;

data = eth_data_noTime_noReg_noPrice;

Number_of_points = size(data, 1);
Dim = size(data, 2);

% Here, we center the data.
mu = mean(data);
data = data - ones(Number_of_points, 1) * mu;

% Coordinate wise st dev is 1.

for d = 1 : Dim
   data (:,d) = data(:,d)./std(data(:,d));
end

save data/eth_data_afterNorm_noZSCORE.dat data -ascii