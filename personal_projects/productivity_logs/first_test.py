from statsmodels.tsa.arima.model import ARIMA

#           0  1  2  3   4  5   6  7  8  9  10  11 12 13 14  15 16 17 18 19 20 
sessions = [4, 1, 3, 1, 12, 8, 12, 5, 7, 4, 13, 4, 7, 9, 11, 3, 8, 8, 1, 0, 8]

dates = ["05.09.2025", "05.09.2025","06.09.2025","07.09.2025","08.09.2025","09.09.2025","10.09.2025","11.09.2025","12.09.2025","13.09.2025","14.09.2025",
         "15.09.2025","16.09.2025","17.09.2025","18.09.2025","19.09.2025","20.09.2025","21.09.2025","22.09.2025","23.09.2025","24.09.2025"]



test_sessions = sessions[:15]
print(test_sessions)



test_model_1 = ARIMA(test_sessions, order=(1,1,1))
# test_model_2 = ARIMA(test_sessions, order=(1,0,0))
# test_model_3 = ARIMA(test_sessions, order=(0,1,0))

fitted_1 = test_model_1.fit()
# fitted_2 = test_model_2.fit()
# fitted_3 = test_model_3.fit()

test_forecast_1 = fitted_1.forecast(steps = 2)
# test_forecast_2 = fitted_2.forecast(steps = 2)
# test_forecast_3 = fitted_3.forecast(steps = 2)

print(test_forecast_1)

model = ARIMA(sessions, order=(1,1,1))

fitted = model.fit()

forecast_1 = fitted.forecast(steps = 1)
forecast_5 = fitted.forecast(steps = 5)

print(forecast_1)
print(forecast_5)