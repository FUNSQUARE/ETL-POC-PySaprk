
import findspark
findspark.find()

from pyspark.sql import SparkSession

spark = SparkSession.builder.master("local[*]").getOrCreate()
spark.conf.set("spark.sql.legacy.timeParserPolicy", "legacy")
dt = spark.read.csv('./example.csv', header = True, inferSchema = True, )

dt.show()
