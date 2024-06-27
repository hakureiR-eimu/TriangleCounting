/usr/local/hadoop/sbin/start-dfs.sh 

/usr/local/sbt/sbt package     

hdfs dfs -put ./input/* input/TriangleCounting/  
## /home/usami/workU/SparkTasks/TriangleCounting/target/scala-2.12/trianglecounting_2.12-1.0.jar



/usr/local/spark/bin/spark-submit \
    --class "TriangleCounting" \
    --conf spark.executor.extraJavaOptions=-XX:+UseG1GC --conf spark.driver.extraJavaOptions=-XX:+UseG1GC \
    --conf spark.default.parallelism=200 \
    --executor-memory 50G \
    --driver-memory 50G \
    /home/usami/workU/BigDataSystem/SparkTasks/TriangleCounting/target/scala-2.12/trianglecounting_2.12-1.0.jar \
    2>&1
