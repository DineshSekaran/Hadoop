hdfs-site.xml
core-site.xml
yarn-site.xml

Daemon:
Namenode
Datanode
Secondarynamenode

Node Manager
Resource Manager


#View all hdfs files:
hdfs dfs

# List the root HDFS directory #
hdfs dfs -ls  /

# List a specific directory #
hdfs dfs -ls /directory

# List Recursively #
hdfs dfs -ls -R /

# to check file count rows
hdfs dfs -cat /hiveexercises2 |wc -l;

# Delete a file #
hdfs dfs -rm /filemname

#distcp

# Create a directory #
hdfs dfs -mkdir /test

#Placing file for hive table
dfs -put inputenviornment/fiels /HDFSfiellocation;


============================Deleting the Sqoop placed file directory============

 hdfs dfs -rm /sqoop/import_plain/part*
 
 Output:
 
19/10/10 08:50:48 INFO fs.TrashPolicyDefault: Namenode trash configuration: Deletion interval = 0 minutes, Emptier interval = 0 minutes.
Deleted /sqoop/import_plain/part-m-00000
19/10/10 08:50:50 INFO fs.TrashPolicyDefault: Namenode trash configuration: Deletion interval = 0 minutes, Emptier interval = 0 minutes.
Deleted /sqoop/import_plain/part-m-00001
19/10/10 08:50:50 INFO fs.TrashPolicyDefault: Namenode trash configuration: Deletion interval = 0 minutes, Emptier interval = 0 minutes.
Deleted /sqoop/import_plain/part-m-00002
19/10/10 08:50:50 INFO fs.TrashPolicyDefault: Namenode trash configuration: Deletion interval = 0 minutes, Emptier interval = 0 minutes.
Deleted /sqoop/import_plain/part-m-00003
jpasolutions@ubuntu:/$ hdfs dfs -rm /sqoop/import_plain/_S*
19/10/10 08:51:07 INFO fs.TrashPolicyDefault: Namenode trash configuration: Deletion interval = 0 minutes, Emptier interval = 0 minutes.
Deleted /sqoop/import_plain/_SUCCESS

