SELECT *
FROM da_weather.us_weather_anomalies
LIMIT 500

SELECT station_name
FROM da_weather.us_weather_anomalies

SELECT
date_ymd,
station_name,
degrees_from_mean
FROM da_weather.us_weather_anomalies
LIMIT 1200