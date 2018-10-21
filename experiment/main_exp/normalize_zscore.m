% We use this script to normalize the data for PCA, using the zscore
% function built into matlab.

clear all;

load data/eth_data_noTime_noReg_noPrice.dat;

data = eth_data_noTime_noReg_noPrice;

Number_of_points = size(data, 1);
Dim = size(data, 2);
    
% Here, we center the data.
for d = 1 : Dim
    data(:,d) = zscore(data(:,d));
end

save data/eth_data_afterNorm.dat data -ascii