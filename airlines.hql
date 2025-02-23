Create EXTERNAL Table IF NOT EXISTS flight_landing.airlines
(Airline_id String,
Airline_name String,
Alias String,
IATA_code String,
ICAO_code String,
Callsign String,
Country String,
Active String)
COMMENT 'Airline details'
STORED AS ORC
LOCATION '/user/bigdatapedia/project/landing/flight_landing/airlines/';


