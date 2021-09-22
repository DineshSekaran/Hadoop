***Running SQL as SCRIPTS which will used as shell script/oozie/scheduling****
# Create empty file
```
touch get_hive_reocrds.hql<filename>
```
# open the empty file
```
vim get_hive_records.hql

select * from dbname.customers;

cat get_hive_records.hql 
```

# Run the above
```
hive> ! hive -f get_parms_hive_records.hql;  ===========> in hive sheall

hive -f get_hive_records.hql================>unix shell 
```
Result:
O/P data will dispalyed in terminal


# Running SQl script with Runtime Parameter
```

get_parms_hive_records.hql    ==========>Filename

$ touch get_parms_hive_records.hql

$ vim get_parms_hive_records.hql
select * from ${hiveconf:tablename} where customer_id=${hiveconf:filter_codn};

$ cat get_parms_hive_records.hql
select * from ${hiveconf:tablename} where customer_id=${hiveconf:filter_codn};
```
# Run Runtime parameter script
```
hive> ! hive -f get_parms_hive_records.hql -hiveconf tablename=customers -hiveconf filter_codn=1;

```

# Using hive shell list the dircetory and put the files

hive> ! ls /home/tamilboomi/Desktop/Hive/;
hive> dfs -put /home/tamilboomi/Desktop/Hive/user_info.txt /user/tamilboomi/user_info/;


#  Exporting Data
================================
 
Linux> hive -e "select * from tbtest.city where countrycode = 'PHL'" > /home/tamilboomi/Desktop/hive_export/city_op.txt
syntax:  hive -e 'query' > destination_path


hive> INSERT [OVERWRITE] [LOCAL] DIRECTORY '/home/tamilboomi/Desktop/hive_export' 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
select * from tbtest.city where countrycode = 'PHL';

# Hive Array Split

https://community.cloudera.com/t5/Support-Questions/Hive-Split-for-columns/td-p/194255


# Linux commands on Hive Shell

## To List
hive> ! ls /home/tamilboomi/Desktop/Hive/;

## To Put file 
hive> dfs -put /home/tamilboomi/Desktop/Hive/user_info.txt /user/tamilboomi/user_info/;
