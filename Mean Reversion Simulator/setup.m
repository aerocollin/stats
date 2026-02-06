data = readtable("last5yearsSPY.csv");


% This below creates the relative and porportional daily price changes, and
% also adds it to the original CSV file
% data.PriceChange = [data.Close(1:end-1) ./ data.Close(2:end); 1];
% data.PercentChange = (data.PriceChange - 1) * 100;

%Makes the csv file be in chronological order
% data = flipud(data);
writetable(data, 'last5yearsSPY.csv');

