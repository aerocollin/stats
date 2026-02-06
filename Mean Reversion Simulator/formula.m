data = readtable("last5yearsSPY.csv");
proportionalGains = [];
i = 1;

% While loop to traverse the dataset
while i <= height(data) - 6
    cumChange = data.cumChange5Days(i);
    
    % Check the buy signal condition
    if cumChange >= 0.005
        % Execute trade logic (e.g., calculate proportional gain)
        buyPrice = data.Close(i + 1);
        sellPrice = data.Close(i + 6);
        proportionalIncrease = sellPrice / buyPrice;
        proportionalGains = [proportionalGains; proportionalIncrease];
        
        % Skip the next 6 days
        i = i + 6;
    else
        % Move to the next day
        i = i + 1;
    end
end
disp('Proportional Gains for All Trades:');
writematrix(proportionalGains, 'Gains.csv');

matrix = readmatrix('Gains.csv');
totalProduct = prod(matrix(:));
disp(totalProduct);
