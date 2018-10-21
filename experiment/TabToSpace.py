# course: ida
# name: Andrew P Talbot 1434667
# date: 20/02/2018
#
# description: Here is a program that we use to take a text file with tabs between the data, and then replace those tabs
#               with spaces, as we require spaces between the data.

fileFrom = 'data/btc_data_tabbed.dat'
fileTo = 'data/btc_data.dat'


# Here we perform the operation on the fileFrom and put it as FileTo with
with open(fileFrom) as fin, open(fileTo, 'w') as fout:
    for line in fin:
        fout.write(line.replace('\t', ' '))
