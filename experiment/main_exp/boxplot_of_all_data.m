%Here is a script that we can use on the data to build a box plot
%displaying the distribution of each of the attributes before they 
%have been normalized..

clear all;

load data/eth_data_noTime_noReg_noPrice.dat; % 825 x 14

data = eth_data_noTime_noReg_noPrice;

attributes = {'eth_tx', 'eth_address', 'eth_supply', 'eth_marketcap', ...
    'eth_hashrate', 'eth_difficulty', 'eth_blocks', 'eth_uncles', ...
    'eth_blocksize', 'eth_blocktime', 'eth_gasprice', 'eth_gaslimit', ...
    'eth_gasused', 'eth_ethersupply'};

Graph = boxplot(data(:,1:14), attributes, 'orientation', 'horizontal');
ylabel('Attributes');
xlabel('Values');

print figures/boxplot_before_norm.eps -depsc;


