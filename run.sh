/usr/local/hadoop/sbin/start-dfs.sh 

/usr/local/sbt/sbt package     

## /home/usami/workU/SparkTasks/TriangleCounting/target/scala-2.12/trianglecounting_2.12-1.0.jar

/usr/local/spark/bin/spark-submit \
    --class "TriangleCounting" \
    /home/usami/workU/SparkTasks/TriangleCounting/target/scala-2.12/trianglecounting_2.12-1.0.jar \
    2>&1