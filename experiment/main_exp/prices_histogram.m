% In this script we draw a histogram of the price of ethereum against time.
% The price file is a 1 x 825 data set.
% Now the second graph
clear all;

load data/eth_priceOnly.dat

hist(eth_priceOnly, 30);
xlabel('Ether Price');
ylabel('Number of Occurences');
ylim([0 100]);
hold on;

T1 = 25;
T2 = 118.75;
T3 = 212.5;
T4 = 306.25;
T5 = 400;

plot([T1,T1], [0, 600], 'r--');
plot([T2,T2], [0, 600], 'r--');
plot([T3,T3], [0, 600], 'r--');
plot([T4,T4], [0, 600], 'r--');

print figures/eth_priceOnly.hist.eps -depsc;

N_Data = size(eth_priceOnly, 1);
Labels = ones(N_Data, 1);

for i = 1 : N_Data
    
    if     eth_priceOnly(i) < T1
           Labels(i) = 1;
    elseif eth_priceOnly(i) < T2
           Labels(i) = 2;
    elseif eth_priceOnly(i) < T3
           Labels(i) = 3;
    elseif eth_priceOnly(i) < T4
           Labels(i) = 4;
    elseif eth_priceOnly(i) < T5 
           Labels(i) = 5;
    end
end

save data/priceOnly_labels.dat Labels -ascii;
    
    