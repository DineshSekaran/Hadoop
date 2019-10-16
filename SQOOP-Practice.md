****Below is the example Mysql DB:****\n
****sqoopdb---> Database Name****
****Port-->3306****
****Ref URL http://sqoop.apache.org/docs/1.4.2/SqoopUserGuide.html#_purpose_11****
# List Tables
```
sqoop list-tables \
	  --connect jdbc:mysql://localhost:3306/sqoopdb \
	  --username root \
	  --password root
```    
# Evaluate the query 
```
sqoop eval \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--query 'select * from patients'
 ``` 

# Sqoop Import complete table
```
sqoop import \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--table patients \
	--num-mappers 3 \
	--delete-target-dir \         ----> Optional
	--target-dir '/sqoop/import_plain/'
```
TO Check: hdfs dfs -ls /sqoop/import_plain/
Note: Based on Mappers , o/p will get genearted and 1 Success FIle if 3 Mappers then 3 o/p

19/10/10 09:10:34 INFO mapreduce.Job:  map 0% reduce 0%
19/10/10 09:10:50 INFO mapreduce.Job:  map 100% reduce 0%
19/10/10 09:10:51 INFO mapreduce.Job: Job job_1570715401966_0002 completed successfully
19/10/10 09:10:52 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=135510
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=595
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=12061
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=12061
		Total vcore-seconds taken by all map tasks=12061
		Total megabyte-seconds taken by all map tasks=12350464
	Map-Reduce Framework
		Map input records=25
		Map output records=25
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=112
		CPU time spent (ms)=3390
		Physical memory (bytes) snapshot=163651584
		Virtual memory (bytes) snapshot=1034866688
		Total committed heap usage (bytes)=92798976
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=595
19/10/10 09:10:34 INFO mapreduce.Job:  map 0% reduce 0%
19/10/10 09:10:50 INFO mapreduce.Job:  map 100% reduce 0%
19/10/10 09:10:51 INFO mapreduce.Job: Job job_1570715401966_0002 completed successfully
19/10/10 09:10:52 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=135510
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=595
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=12061
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=12061
		Total vcore-seconds taken by all map tasks=12061
		Total megabyte-seconds taken by all map tasks=12350464
	Map-Reduce Framework
		Map input records=25
		Map output records=25
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=112
		CPU time spent (ms)=3390
		Physical memory (bytes) snapshot=163651584
		Virtual memory (bytes) snapshot=1034866688
		Total committed heap usage (bytes)=92798976
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=595
		
# sqoop import Where 
```
sqoop import \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--table patients \
	--delete-target-dir \
	--num-mappers 1 \
	--where "drug='metacin'" \
	--target-dir '/sqoop/import_where'		
```
hdfs dfs -ls /sqoop/import_where/
hdfs dfs -cat /sqoop/import_where/part-m-00000

# import as Sequence and selected columns
```
sqoop import \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--table patients \
	--delete-target-dir \
	--num-mappers 1 \
	--columns "drug,age" \          -----------> column selection
	--target-dir '/sqoop/import_columns' \
	--as-sequencefile;         -----------> File Formate
```	
# Passing PAssword as Runtime
```
sqoop import \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	-P \                ----------->Parameter RUntime
	--table patients \
	--delete-target-dir \
	--num-mappers 1 \
	--columns "drug,age" \
	--target-dir '/sqoop/import_columns' \
	--as-sequencefile
```	

