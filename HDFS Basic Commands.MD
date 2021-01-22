# Create a directory #
hdfs dfs -mkdir /test

# Create a zerobyte file #
hdfs dfs -touchz /test/samplefile.txt

# List the root HDFS directory #
hdfs dfs -ls  /

# List a specific directory #
hdfs dfs -ls /test

# List Recursively #
hdfs dfs -ls -R /

# Upload a file to HDFS #
vim hello.txt
	-- type some random content --
Hello World
	-- save and exit --

hdfs dfs -put hello.txt /test/

# Create a copy #
hdfs dfs -cp /test/hello.txt /hello_copy.txt

# Read a file #
hdfs dfs -cat /test/hello.txt

# Download a file #
hdfs dfs -get /hello_copy.txt /tmp/

# Change the replication of an existing file #
hdfs dfs -setRep 1 /hello_copy.txt

# Delete a file #
hdfs dfs -rm /hello_copy.txt

# View all filesystem HDFS commands #
hdfs dfs
