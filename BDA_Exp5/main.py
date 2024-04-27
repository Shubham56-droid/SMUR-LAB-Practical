# Importing pymongo library
from pymongo import MongoClient

# Connect to MongoDB
client = MongoClient('mongodb://localhost:27017/')

# Select database
db = client['BDAEXP5']

# Select collection
collection = db['collectionBDAEXP5']

# Create operation: Insert a document into the collection
def create_document():
    post = {"name": "Rahul",
            "text": "Hello MongoDB"}
    post_id = collection.insert_one(post).inserted_id
    print("Document inserted with id:", post_id)

# Read operation: Retrieve all documents from the collection
def read_documents():
    cursor = collection.find({})
    for document in cursor:
        print(document)

# Update operation: Update a document in the collection
def update_document():
    query = {"name": "Rahul"}
    new_values = {"$set": {"name": "Rahul Kumar"}}
    collection.update_one(query, new_values)
    print("Document updated successfully")

# Delete operation: Delete a document from the collection
def delete_document():
    query = {"name": "Rahul Kumar"}
    collection.delete_one(query)
    print("Document deleted successfully")

#CRUD operations
# create_document()
# print("\nDocuments in the collection:")
# read_documents()

# print("\nUpdating document:")
# update_document()
# print("\nDocuments in the collection after update:")
# read_documents()

print("\nDeleting document:")
delete_document()



