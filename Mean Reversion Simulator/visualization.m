
days_skipped_index = 2;
windows = 4:2:30; 
change_factors = 0.005:0.005:0.2; 


results = zeros(length(windows), length(change_factors), 10);



csv_name = "last5yearsSPY.csv";
startday = 40; 
endday = 1200; 

for i = 1:length(windows)
    for j = 1:length(change_factors)
        
        [result, benchmark, count] = mean_reversion_PT( ...
                csv_name, ...
                windows(i), ...
                change_factors(j), ...
                days_skipped_index, ...
                startday, ...
                endday ...
            );
            
            results(i, j, days_skipped_index) = result;
            
        
    end
end

% Visualization

figure;

[X, Y] = meshgrid(change_factors, windows); 
Z = squeeze(results(:, :, days_skipped_index)); 
surf(X, Y, Z);
xlabel('X: Change Factor');
ylabel('Y: Window');
zlabel('Z: Result');
title(['Results for days skipped = ', num2str(days_skipped_index)]);