Create EXTERNAL Table IF NOT EXISTS flight_stg.routes_staging
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
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/bigdatapedia/project/stg/flight_stg/routes_staging/';

