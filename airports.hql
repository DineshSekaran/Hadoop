Create EXTERNAL Table IF NOT EXISTS flight_landing.airport
(
Airport_id String,
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
STORED AS ORC
LOCATION '/user/bigdatapedia/project/landing/flight_landing/airports/';

