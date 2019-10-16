# To dispaly header in hive terminal

 set hive.cli.print.header=true;
 
select * from customers;
OK
customers.customer_id	customers.customer_name	customers.total_orders
1	Chris	25
2	John	20
3	Martin	30

# For Dynamic Partition

SET hive.exec.dynamic.partition=true; 
set hive.exec.dynamic.partition.mode=nonstrict;

# To display DB in prompt shell

hive> set hive.cli.print.current.db=true;
hive (exercises)> 

# Drop an external table along with data

TBLPROPERTIES ('external.table.purge'='true');


# MSCK REPAIR TABLE tablename


# Hive Static Partition
set hive.mapred.mode = strict 


# To See the location of hive Path

hive> set hive.metastore.warehouse.dir;
hive.metastore.warehouse.dir=/user/hive/warehouse
