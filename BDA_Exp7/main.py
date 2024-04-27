import pandas as pd
from pymongo import MongoClient

# Connection URL for MongoDB
mongo_url = "mongodb://localhost:27017"

# Connect to MongoDB
client = MongoClient(mongo_url)

# Create or select a database
database_name = "CSV_to_MongoDB"
db = client[database_name]

# Create or select a collection
collection_name = "csv_data"
collection = db[collection_name]

# Specify the CSV file path
csv_file_path = "C:/data/student-dataset_Exp7.csv"

# Read CSV data into a Pandas DataFrame
df = pd.read_csv(csv_file_path)
print(df)

# Convert DataFrame to a list of dictionaries (each row as a dictionary)
records = df.to_dict(orient='records')
print(records)

# Insert data into the MongoDB collection
result = collection.insert_many(records)
print(f"{len(result.inserted_ids)} documents inserted into MongoDB collection.")


# Close the MongoDB connection
client.close()