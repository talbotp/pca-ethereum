%Here is a script that we can use on the data to build a box plot
%displaying the distribution of each of the attributes after they 
%have been normalized..

clear all;

load data/btc_data_afterNorm.dat; % 825 x 14

attributes = {'eth_etherprice', 'eth_tx', 'eth_address', 'eth_marketcap', ...
    'eth_hashrate', 'eth_difficulty', 'eth_blocks', 'eth_uncles', ...
    'eth_blocksize', 'eth_blocktime', 'eth_gasprice', 'eth_gaslimit', ...
    'eth_gasused', 'eth_ethersupply'};

data = btc_data_afterNorm;

Graph = boxplot(data(:,1:14), attributes, 'orientation', 'horizontal');
ylabel('Attributes');
xlabel('Values');

print figures/boxplot_after_norm_btc.eps -depsc
