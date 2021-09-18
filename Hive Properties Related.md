# To dispaly header in hive terminal
```
 set hive.cli.print.header=true;
 ```
 ```
select * from customers;
OK
customers.customer_id	customers.customer_name	customers.total_orders
1	Chris	25
2	John	20
3	Martin	30
```
# For Dynamic Partition
```
SET hive.exec.dynamic.partition=true; 
set hive.exec.dynamic.partition.mode=nonstrict;
```
# To display DB in prompt shell
```
hive> set hive.cli.print.current.db=true;
hive (exercises)> 
```
# Drop an external table along with data
```
TBLPROPERTIES ('external.table.purge'='true');
```

# MSCK REPAIR TABLE tablename

i have data in partitioned way. so i have created table on top of that. 

CREATE EXTERNAL TABLE IF NOT EXISTS tbtest.user_info_part1(user_id string, firstname string, lastname string)
    > COMMENT 'A partitened copy of user_info'
    > PARTITIONED BY(ds string)
    > LOCATION '/user/tamilboomi/user_info_part';
OK
Time taken: 0.704 seconds


                     ## no Partitions listed
                      hive> show partitions user_info_part1;
                      OK
                      Time taken: 1.156 seconds



                      ## After MSCK it shows and updated metastore
                     hive> msck repair table user_info_part1;
                     OK
                     Partitions not in metastore:	user_info_part1:ds=2016-03-12	user_info_part1:ds=2018-05-08	user_info_part1:ds=2021-09-17
                     Repair: Added partition to metastore user_info_part1:ds=2016-03-12
                     Repair: Added partition to metastore user_info_part1:ds=2018-05-08
                     Repair: Added partition to metastore user_info_part1:ds=2021-09-17
                     Time taken: 1.181 seconds, Fetched: 4 row(s)
                     hive> 

              # Table with location pointed. so creating directory and palcing file.in that case need to use msck repair otherwise it wont consider.
              
               hdfs dfs -mkdir /user/tamilboomi/user_info_part/ds=2021-09-18
              hdfs dfs -put /home/tamilboomi/Desktop/Hive/user_info.txt /user/tamilboomi/user_info_part/ds=2021-09-18


               msck repair table user_info_part_t;
               OK
               Partitions not in metastore:	user_info_part_t:ds=2021-09-18
               Repair: Added partition to metastore user_info_part_t:ds=2021-09-18
               Time taken: 0.567 seconds, Fetched: 2 row(s)

The newly added directory partitioned is got refreshed.


# Hive Static Partition
```
set hive.mapred.mode = strict 
```

# To See the location of hive Path
```
hive> set hive.metastore.warehouse.dir;
hive.metastore.warehouse.dir=/user/hive/warehouse
```
