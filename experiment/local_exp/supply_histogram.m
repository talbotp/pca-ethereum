% In this script we draw a histogram of the price of ethereum against time.
% The price file is a 1 x 825 data set.
% Now the second graph
clear all;

load data/eth_supplyOnly.dat

hist(eth_supplyOnly, 30);
xlabel('Number of New Ether Daily');
ylabel('Total');
xlim([1.5*10^4 3*10^4]);
ylim([0 90]);
hold on;


T1 = (1.875 * 10^4) -400;
T2 = (2.25 * 10^4) - 400;
T3 = (2.625 * 10^4) - 400;
T4 = 3 * 10^4;

plot([T1,T1], [0, 600], 'r--');
plot([T2,T2], [0, 600], 'r--');
plot([T3,T3], [0, 600], 'r--');
%plot([T4,T4], [0, 600], 'r--');


print figures/eth_supplyOnly.hist.eps -depsc;

N_Data = size(eth_supplyOnly, 1);
Labels = ones(N_Data, 1);

for i = 1 : N_Data
    
    if     eth_supplyOnly(i) < T1
           Labels(i) = 1;
    elseif eth_supplyOnly(i) < T2
           Labels(i) = 2;
    elseif eth_supplyOnly(i) < T3
           Labels(i) = 3;
    elseif eth_supplyOnly(i) < T4
           Labels(i) = 4;
    end
end

save data/eth_labels_supplyOnly.dat Labels -ascii;
    
    