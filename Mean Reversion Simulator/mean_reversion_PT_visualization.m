function mean_reversion_PT_visualization(csv_name, startday, endday, variable1, variable1_range,...
    variable2, variable2_range, fixed_variable, value)
    var1 = variable1_range;
    var2 = variable2_range;

    % Initialize results matrix
    results = zeros(length(var2), length(var1)); % Correct dimensions

    % Loop through combinations of variable1 and variable2
    for i = 1:length(var1)
        for j = 1:length(var2)
            if strcmp(fixed_variable, 'days_skipped')
                [result, ~, ~] = mean_reversion_PT(csv_name, var1(i), var2(j), value, startday, endday);
            elseif strcmp(fixed_variable, 'window')
                [result, ~, ~] = mean_reversion_PT(csv_name, value, var1(i), var2(j), startday, endday);
            else
                [result, ~, ~] = mean_reversion_PT(csv_name, var1(i), value, var2(j), startday, endday);
            end
            results(j, i) = result; % Store correctly with flipped indexing
        end
    end

    % Generate mesh grid for visualization
    [X, Y] = meshgrid(var1, var2);

    % Plot surface
    figure;
    surf(X, Y, results);
    xlabel(['X: ', variable1]);
    ylabel(['Y: ', variable2]);
    zlabel('Z: Result');
    title(['Results for ', fixed_variable, ' = ', num2str(value)]);
end