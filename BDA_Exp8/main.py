# Importing necessary libraries
from pyspark import SparkContext
from pyspark.sql import SparkSession
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.regression import RandomForestRegressor
from pyspark.ml.evaluation import RegressionEvaluator

# Initializing SparkContext and SparkSession
sc = SparkContext("local", "PredictiveAnalyticsWithMLlib")
spark = SparkSession(sc)

data = spark.read.csv("./regression_data2.csv", header=True, inferSchema=True)

# Explore your dataset (optional)
print("Schema of the dataset:")
data.printSchema()
print("First few rows of the dataset:")
data.show(5)
# Select features and target variable
feature_columns = [col for col in data.columns if col != 'target_variable']
assembler = VectorAssembler(inputCols=feature_columns, outputCol='features')
data = assembler.transform(data)
# Split data into training and testing sets
(train_data, test_data) = data.randomSplit([0.8, 0.2], seed=42)
# Define the Random Forest model
rf = RandomForestRegressor(featuresCol='features', labelCol='target_variable', numTrees=100)
# Train the model
model = rf.fit(train_data)
# Make predictions on the test set
predictions = model.transform(test_data)
# Evaluate the model
evaluator = RegressionEvaluator(labelCol="target_variable", predictionCol="prediction", metricName="rmse")
rmse = evaluator.evaluate(predictions)
print("Root Mean Squared Error (RMSE) on test data = %g" % rmse)
# Show some predictions
print("Sample predictions:")
predictions.select("prediction", "target_variable", *feature_columns).show(5)
# Stop SparkContext
sc.stop()