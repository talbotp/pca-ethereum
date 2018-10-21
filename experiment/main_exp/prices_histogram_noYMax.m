% In this script we draw a histogram of the price of ethereum against time.
% The price file is a 1 x 825 data set, without a y max.

clear all;

load data/eth_priceOnly.dat
hist(eth_priceOnly, 30);
xlabel('Ether Price');
ylabel('Number of Occurences');

print figures/eth_priceOnly_noYMax.hist.eps -depsc;

