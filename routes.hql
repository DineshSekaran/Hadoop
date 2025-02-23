Create EXTERNAL Table IF NOT EXISTS flight_landing.routes
(Airline String,
Airline_ID String,
Source_airport String,
Source_airport_ID String,
Destination_airport String,
Destination_airport_id String,
Codeshare String,
Stops Double,
Equipment Double
)
COMMENT 'Routes details'
STORED AS ORC
LOCATION '/user/bigdatapedia/project/landing/flight_landing/routes/';

