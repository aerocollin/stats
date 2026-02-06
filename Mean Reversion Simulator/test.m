%mean_reversion_reversed(csv_name, window, change_factor, days_skipped, startday, endday)
[a,b,c] = mean_reversion_PT('last5yearsSPY.csv', 18, 0.03, 2, 40, 1200);
disp(a);
disp(b);
disp(c);

