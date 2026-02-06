%refer to the dataset to find the index of the timeframe you want
%startday must be greater than or equal to window
%endday must be less than (length of the csv file) - window
%change_factor is how much market must go up for you to sell given
%window time

%This function simulates a trading algorithm on historical
%data, from the index of startday to the index of endday. 
% First, it determines the porportional change for the last
%window days, including today. If it is greater than change_factor, the algorithm
%sells the next day, and rebuys after days_skipped days. Results indicates your 
% porportional change; benchmark indicates the porportional change you
% would've had if you just bought and hold from that period, and count
% indicates how many times your program sold. To get the total duration of
% how long your portfolio was idle for, count * compute days_skipped

function [result, benchmark,count] = mean_reversion_PT(csv_name, window, change_factor, days_skipped, startday, endday)
data = readtable(csv_name);
%returns the benchmark performance
benchmark = prod(data.PorportionalChange(startday:endday));

%creates a column for the geometric mean of a set of length
%window
data.Change = zeros(height(data),1);
for i = window:height(data) 
    data.Change(i) = prod(data.PorportionalChange(i - window + 1:i)) - 1;
end

%the simulation
i = startday;
proportionalChange = [];
count = 0;

while i <= endday
    cumChange = data.Change(i);
    proportionalChange = [proportionalChange; data.PorportionalChange(i + 1)];
    if cumChange >= change_factor
         count = count + 1;
            
         i = i + days_skipped + 1;

    else
    %     % Move to the next day
        i = i + 1;
    end

end
result = prod(proportionalChange);
