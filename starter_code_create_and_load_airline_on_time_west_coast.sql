-- The original source of the data is enigma.io

BEGIN;

-- add a statement to drop the public.airline_on_time_west_coast table or delete all data from it if it exists

CREATE TABLE IF NOT EXISTS public.airline_on_time_west_coast(
	day_of_month TEXT,
	day_of_week TEXT,
	flight_date DATE,
	unique_carrier VARCHAR(4),
	carrier VARCHAR(4),
	flight_num int,
	Origin VARCHAR(80),
	Origin_city_name VARCHAR(60),
	dest_city_name VARCHAR(60),
	arrival_time CHAR(4),
	arrival_delay DECIMAL,
	carrier_delay DECIMAL,
	weather_delay DECIMAL,
	nas_delay DECIMAL,
	security_delay DECIMAL,
	late_aircraft_delay DECIMAL);

DELETE FROM public.airline_on_time_West_coast;

-- Add a copy statement to load the Airline_on_time_west_coast.csv data into the airline_on_time_west_coast table statement

COPY public.airline_on_time_west_coast FROM '/Users/micahowens/Documents/SQL_Files/Airline_on_time_west_coast.csv'
WITH DELIMITER ',' CSV;

COMMIT;
