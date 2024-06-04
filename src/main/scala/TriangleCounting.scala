import org.apache.spark.graphx.{GraphLoader, PartitionStrategy}

object TriangleCounting {
  def main(args: Array[String]): Unit = {
    // 创建 SparkSession
    val spark = org.apache.spark.sql.SparkSession.builder
      .appName("TriangleCounting")
      .getOrCreate()

    val sc = spark.sparkContext

    // 读取输入数据
    val graph = GraphLoader
      .edgeListFile(sc, "hdfs://localhost:9000/input/TriangleCounting/Cit-HepPh.txt",true)
      .partitionBy(PartitionStrategy.EdgePartition2D)

    // 运行三角形计数算法
    val triangleCount = graph.triangleCount().vertices.collect().toMap

    // 输出结果
    // triangleCount.foreach { case (vertexId, count) =>
    //   println(s"Vertex $vertexId is part of $count triangles.")
    // }
    // 计算总的三角形数量
    val totalTriangleCount = triangleCount.values.sum

    // 输出总的三角形数量
    println(s"data:Total triangles count: $totalTriangleCount")

    // 停止 SparkSession
    spark.stop()
  }
}
