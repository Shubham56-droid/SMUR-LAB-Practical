import pandas as pd

ride_data = pd.read_csv('historical_ride_data.csv')

ride_data.dropna(inplace=True)

ride_data['hour_of_day'] = pd.to_datetime(ride_data['timestamp']).dt.hour

from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_squared_error

X = ride_data[['hour_of_day', 'day_of_week', 'weather']]
y = ride_data['demand']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

rf_model = RandomForestRegressor(n_estimators=100, random_state=42)
rf_model.fit(X_train, y_train)

y_pred = rf_model.predict(X_test)

mse = mean_squared_error(y_test, y_pred)
print("Mean Squared Error:", mse)

new_data = pd.DataFrame({'hour_of_day': [10], 'day_of_week': [3], 'weather': [2]})
predicted_demand = rf_model.predict(new_data)
print("Predicted Demand:", predicted_demand)
