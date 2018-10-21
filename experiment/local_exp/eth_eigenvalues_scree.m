clear all;

load data/eth_eigenvalues_supply.dat;

data = eth_eigenvalues_supply;

dim_data = size(data, 1);

% Swap to get the order correct.
data_swap = ones(dim_data, 1);


for i = 1 : dim_data
    data_swap(i) = data(dim_data - i + 1);
end

% Here we put the amount that each principal component counts towards the
% total variance of the data.
variance_percent = ones(dim_data, 1);

SUM = 0;
for i = 1 : dim_data
    SUM = SUM + data_swap(i);
end

for i = 1 : dim_data
    variance_percent(i) = 100 * (data_swap(i) / SUM); 
end

cumulative_variance_percent = ones(dim_data, 1);
cumulative_variance_percent(1) = variance_percent(1);

for i = 2 : dim_data
    cumulative_variance_percent(i) = variance_percent(i) + cumulative_variance_percent(i-1);
end

save data/eth_variance_cum_frequency.dat cumulative_variance_percent -ascii;

% Next, we draw the scree plot.

y1 = ones(8, 1);

for i = 1 : 8
    y1(i) = variance_percent(i);
end

y2 = ones(8, 1);

for i = 1 : 8
    y2(i) = cumulative_variance_percent(i);
end

x = 1 : 1 : 8;
figure;
plot(x, y2);
xlabel('Principal Component');
ylabel('Variance Described (%)');

hold on;
bar(y1);

print figures/scree_plot_supply.scree.eps -depsc;
