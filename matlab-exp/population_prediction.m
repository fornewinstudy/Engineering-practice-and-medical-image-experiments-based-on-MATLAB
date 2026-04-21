% 1
% 从网站加载人口数据
url = 'http://data.stats.gov.cn/easyquery.htm?cn=C01&zb=A0301&sj=2020';
webData = webread(url);
popData = extractBetween(webData, 'data:[', ']}]');
popArray = strsplit(popData{1}, ',');
popArray = popArray(2:end);
pop = str2double(popArray);

% 为人口数据创建一个时间序列对象
startDate = datetime('1949-01-01');
endDate = datetime('2020-12-31');
popSeries = timeseries(pop, startDate:endDate, 'Name', 'Population');

% 为Prophet创建一个包含人口数据的表
popTable = table(popSeries.Data', 'VariableNames', {'y'});
popTable.ds = popSeries.Time';

% 创建Prophet模型并使其适合数据
m = prophet();
m = fit(m, popTable);

% 对未来30年做一个预测
future = m.make_future_dataframe('periods', 30*12, 'include_history', false);
forecast = predict(m, future);

% 绘制预测图
figure;
plot(m, forecast);
title('Population Forecast');
xlabel('Year');
ylabel('Population');

% 2
% 将数据分成训练集和测试集
trainEnd = datetime('2010-12-31');
testStart = datetime('2011-01-01');
trainIdx = popSeries.Time <= trainEnd;
testIdx = popSeries.Time <= testStart;
trainTable = popTable(trainIdx, :);
testTable = popTable(testIdx, :);

% 将Prophet模型拟合到训练数据中
m = prophet();
m = fit(m, trainTable);

% 对测试数据进行预测
testFuture = m.make_future_dataframe('periods', length(testTable));
testForecast = predict(m, testFuture);

% 计算平均绝对百分比误差(MAPE)
actual = testTable.y;
predicted = testForecast.yhat;
mape = mean(abs(actual - predicted)./actual)*100;

% 绘制测试数据的实际值和预测值
figure;
plot(testTable.ds, actual, 'b-', 'LineWidth', 2);
hold on;
plot(testForecast.ds, testForecast.yhat, 'r-', 'LineWidth', 2);
title('Population Forecast (Testing Data)');
xlabel('Year');
ylabel('Population');
legend('Actual', 'Predicted', 'Location', 'Northwest');