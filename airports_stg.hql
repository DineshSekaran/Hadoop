Create EXTERNAL Table IF NOT EXISTS flight_stg.airport_stg
(Airport_id String,
Airport_name String,
City String,
Country String,
FAA_code String,
ICAO_code String,
Latitude Double,
Longitude Double,
Altitude Double,
Timezone Double,
DST String,
Tz String)
COMMENT 'Airport details'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/bigdatapedia/project/stg/flight_stg/airports_staging/';

