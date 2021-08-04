**Serialization: Process of converting object into stream of bytes and stored in DB/Memory/FIles**
**DeSerialization: Opposite to serialization. Takes object from DB/Files and **

# Hive DDL
```
create table t1(
c1 String,
c2 String,
c3 String)
row formated delimited---------> Serde HIve
fileds terminated by ','
stored as textfile;-------------->input and output Stream----->MApreduce
```
# Hadoop Architect
```          
        MR                             DE
HDFS-------------->TEXT(Record Reader)-------->MEMory and Breaking down into pieces using jar
      I/P
```


# Compression on intermediate level(MApper/Reducer)

set hive.exec.compress.output=true;
hive> set mapreduce.output.fileoutputformat.compress=true;

$ hive --hiveconf hive.exec.compress.output=true hive.exec.compress.intermediate=true
