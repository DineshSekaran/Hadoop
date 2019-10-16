# FileFormat:
Text File is a default storage format. You can use the text format to interchange the data with other client application. 
Data is stored in lines, with each line being a record. Each lines are terminated by a newline character (\n).

Sequence File stored in a binary storage format consisting of binary key value pairs.

RC File stores columns of a table in a record columnar format rather than row oriented fashion  and provides considerable compression .

AVRO File open source project that provides data serialization and data exchange services for Hadoop.

ORC File stands for Optimized Row Columnar file format. 

Parquet File is a column-oriented binary file format. The parquet is highly efficient for the types of large-scale queries. 

# Database
```
show databases;

create database exercises;

use exercises;

show tables;
```

# Working with MANAGED tables 
```
create table orders (order_id int, customer_id int, order_date date, amount float) 
row format DELIMITED 
fields terminated by ',' 
stored as textfile;

show create table orders;

CREATE TABLE `orders`(
  `order_id` int, 
  `customer_id` int, 
  `order_date` date, 
  `amount` float)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' 
WITH SERDEPROPERTIES ( 
  'field.delim'=',', 
  'serialization.format'=',') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/user/hive/warehouse/exercises.db/orders'
TBLPROPERTIES (
  'COLUMN_STATS_ACCURATE'='{\"BASIC_STATS\":\"true\"}', 
  'numFiles'='0', 
  'numRows'='0', 
  'rawDataSize'='0', 
  'totalSize'='0', 
  'transient_lastDdlTime'='1568469784')
```
# Decribe Data type
```
desc orders:
--ony column and data type
 col_name            	data_type  
order_id            	int                 	                    
customer_id         	int                 	                    
order_date          	date                	                    
amount              	float  

```
# describe Formatted orders
```
col_name            	data_type           	comment             
	 	 
order_id            	int                 	                    
customer_id         	int                 	                    
order_date          	date                	                    
amount              	float               	                    
```	
# detailed Table Information	

```
Database:           	exercises           	 
Owner:              	jpasolutions        	 
CreateTime:         	Sat Sep 14 07:03:04 PDT 2019	 
LastAccessTime:     	UNKNOWN             	 
Retention:          	0                   	 
Location:           	hdfs://localhost:8020/user/hive/warehouse/exercises.db/orders	 
Table Type:         	MANAGED_TABLE       	 
Table Parameters:	 	 
	COLUMN_STATS_ACCURATE	{\"BASIC_STATS\":\"true\"}
	numFiles            	0                   
	numRows             	0                   
	rawDataSize         	0                   
	totalSize           	0                   
	transient_lastDdlTime	1568469784          
```	 	 
# Storage Information	
```
SerDe Library:      	org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe	 
InputFormat:        	org.apache.hadoop.mapred.TextInputFormat	 
OutputFormat:       	org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat	 
Compressed:         	No                  	 
Num Buckets:        	-1                  	 
Bucket Columns:     	[]                  	 
Sort Columns:       	[]                  	 
Storage Desc Params:	 	 
	field.delim         	,                   
	serialization.format	  

```
# check file in hdfs location
```
dfs -put /home/... /hiveexercises;
dfs -ls /hiveexercises;
```
# Load Data to tables
```
load data inpath '/hiveexercises/orders.txt' into table orders;
```
# To handle the mainly for csv file format 
```
CREATE EXTERNAL TABLE myopencsvtable (
   col1 string,
   col2 string,
   col3 string,
   col4 string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   'separatorChar' = ',',
   'quoteChar' = '"',
   'escapeChar' = '\\'
   )
STORED AS TEXTFILE
LOCATION 's3://location/of/csv/';--can be anything based on our project
```
# CTAS create table as same/copy
```
create table customers_copy as select * from customers;
```
# Dropping MANAGED tables 
```
Truncate table tablename; 
*data purge alone*
drop table tablename; 
*Both table structure and data path everything purged*
```

# EXTERNAL TABLE
```
create EXTERNAL table employees (employee_id int, name string) 
row format DELIMITED 
fields terminated by '|' 
stored as textfile
LOCATION '/employees';
```
# Dropping MANAGED tables 
```Truncate table tablename; 
Cannot truncate non-managed table.
drop table tablename;  
Table structure deleted but data/files remains in same path.
```
# Managed tables with Static PARTITIONS 
```
create table tbl_a (field1 int, field2 string, field3 string, field4 string) 
PARTITIONED BY (alphabet char(1)) 
row format SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
stored as textfile;

load data local inpath 'files/sour1.txt' into table tbl_a PARTITION (alphabet='a'); 
sour1.txt file will be tagged to alphabet='a' irrespective any data.

load data local inpath 'files/sour2.txt' into table tbl_a PARTITION (alphabet='b');
```
