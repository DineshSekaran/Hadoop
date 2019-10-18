

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
# Import all Tables
```
sqoop import-all-tables \
	--connect jdbc:mysql://localhost:3306/sqoopdb \
	--username root \
	--password root \
	--autoreset-to-one-mapper \
	--exclude-tables patients_exclude,patients_export
```