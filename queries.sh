# A. Find list of Airports operating in the Country India 
hive -e "select airport_name from flight_landing.airport where country in ('india','INDIA','India');"

# B. Find the list of Airlines having zero stops  
hive -e "select distinct Airline from flight_landing.routes where Stops = 0;"

# C. List of Airlines operating with code share 
hive -e "select distinct Airline from flight_landing.routes where Codeshare = 'Y';"

# D. Which country (or) territory having highest Airports  
hive -e "select * from (select country, count(airport_id) cnt from flight_landing.airport group by country order by cnt desc) a limit 1 ;"

# E. Find the list of Active Airlines in United state 
hive -e "select airline_name from flight_landing.airlines where country = 'United States' and active = 'Y';"

# F. Find the Top 10 Airlines which is running across the world.
hive -e "select /*+ MAPJOIN(al) */ Airline_name, count(*) as Total from flight_landing.airlines al inner join flight_landing.airport ap inner join flight_landing.routes r where al.Airline_id=r.Airline_id and al.ICAO_code=ap.ICAO_code group by Airline_name order by Total desc limit 10;"
