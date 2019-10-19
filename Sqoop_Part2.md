

# Import to Hive 
```sqoop import \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--table din_test \
        --delete-target-dir \
        --target-dir '/user/hive/warehouse/sqooptest.db/' \
	--hive-table sqooptest.din_test \
	--create-hive-table \
	--hive-import \
         -m 1 \
	
# Create hive table 


sqoop create-hive-table \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--hive-database exercises \
	--hive-table partial_patients \
	--table patients \
```


# Create hive table and data import
```
sqoop import \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--table patients \
	--hive-database exercises \
	--hive-table test_tbl \
	--hive-table sqooptest.patients \
	--create-hive-table \
	--hive-import \
         -m 1 ;
```
# Import all Tables with exclude option
```
sqoop import-all-tables \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--autoreset-to-one-mapper \
	--exclude-tables patients_exclude,patients_export
```
# Import to hive
```
sqoop import \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--query "select * from patients where gender = 'm' AND \$CONDITIONS" \
	--hive-table patienthive \
	--hive-import \
--delete-target-dir \
--target-dir '/user/hive/warehouse/patienthive/' \
	--m 1 
```
# Hive Overwrite
```
sqoop import \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--query "select * from patients where gender = 'f' AND \$CONDITIONS" \
	--hive-table patienthive \
	--hive-import \
--target-dir '/sqoop/import_hive_tmp' \
-hive-overwrite \
	--m 1 
```	
# Hive Incremental
```
sqoop import \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--table patients \
	--num-mappers 1 \
	--target-dir '/sqoop/import_plain/' \
	--incremental append \
	--check-column id \
	--last-value 25 
```

# Mysql to Hive import and export to Mysql
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
op:
19/10/19 09:38:46 INFO mapreduce.ImportJobBase: Transferred 135 bytes in 39.156 seconds (3.4478 bytes/sec)
19/10/19 09:38:46 INFO mapreduce.ImportJobBase: Retrieved 6 records.

jpasolutions@ubuntu:~$ hdfs dfs -ls /sqoop/import_where
Found 2 items
-rw-r--r--   3 jpasolutions supergroup          0 2019-10-19 09:38 /sqoop/import_where/_SUCCESS
-rw-r--r--   3 jpasolutions supergroup        135 2019-10-19 09:38 /sqoop/import_where/part-m-00000


sqoop export \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--table patients_export \
	--export-dir /sqoop/import_where/

op:
19/10/19 09:43:45 INFO mapreduce.ExportJobBase: Transferred 981 bytes in 129.5031 seconds (7.5751 bytes/sec)
19/10/19 09:43:45 INFO mapreduce.ExportJobBase: Exported 6 records.
```
