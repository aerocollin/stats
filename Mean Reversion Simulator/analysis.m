data = readtable("last5yearsSPY.csv");

data.cumChange = zeros(height(data),1);
for i = 5:height(data) % Start from row 5 (first valid 5-day window)
    data.cumChange(i) = prod(data.PorportionalChange(i-4:i)) - 1;
end
% openvar("data");

proportionalGains = [];

% Iterate through the dataset to identify buy signals and calculate returns
for i = 1:(height(data) - 6) % Ensure there's a 5-day window for returns
    % Get the CumChange value
    cumChange = data.cumChange(i);
    
    % Check if CumChange is between -1 and -3
    if cumChange >= -0.03 && cumChange <= -0.01
        % Buy on the next day and sell after 5 days
        buyPrice = data.Close(i + 1);
        sellPrice = data.Close(i + 6);
        
        % Calculate proportional increase
        proportionalIncrease = sellPrice / buyPrice;
        
        % Append the proportional gain to the array
        proportionalGains = [proportionalGains; proportionalIncrease];
    end
end

% Display the entire proportionalGains array
disp('Proportional Gains for All Trades:');
writematrix(proportionalGains, 'ProportionalGains.csv');