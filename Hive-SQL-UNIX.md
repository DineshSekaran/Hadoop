Running SQL as SCRIPTS which will used as shell script/oozie/scheduling
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







