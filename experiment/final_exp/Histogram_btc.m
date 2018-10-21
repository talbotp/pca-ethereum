% In this script we aim to label and create a histogram displaying all of
% our data regarding the prciing of Bitcoin.

load data/btc_priceOnly.dat;

data = btc_priceOnly;

yas = zeros(427, 1);
for i = 500 : size(data, 1);
    yas(i, 1) = data(i, 1);
end

histogram(yas);