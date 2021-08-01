
# Hive Tables

----- Notes ---
Optional for Managed and external table:- location '/user/hive/warehouse/test.db/user_info';

row_format : DELIMITED (below Oprions used with row format delimited)

[FIELDS TERMINATED BY char [ESCAPED BY char]] 
[LINES TERMINATED BY char]
[COLLECTION ITEMS TERMINATED BY char]
[MAP KEYS TERMINATED BY char]
----- Notes end---

# Extrenal Table

Directory is not existed but when i create table it is created and automatically directory also created which is user_info

CREATE  EXTERNAL TABLE IF NOT EXISTS  tbtest.user_info_ext(
user_id string,
firstname string,
lastname string,
ds string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/tamilboomi/user_info/';

# Local to HDFS  

dfs -put /home/tamilboomi/Desktop/Hive/user_info.txt /user/tamilboomi/user_info/;
