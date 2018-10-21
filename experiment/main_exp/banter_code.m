clear all;

load data/eth_data_noTime_noReg_noPrice.dat; % 825 x 14

data = eth_data_noTime_noReg_noPrice;

Graph = boxplot(data(:,11), 'orientation', 'horizontal');
ylabel('Attributes');
xlabel('Distribution of the Ethereum Data');

print figures/test_plot -depsc;
