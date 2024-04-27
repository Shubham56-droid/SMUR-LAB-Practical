# Import necessary libraries
import pymongo

# Connect to MongoDB
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["social_network_db_Exp6"]

# Define schema
user_schema = {
    "user_id": int,
    "username": str,
    "email": str,
    # Add more fields as needed
}
post_schema = {
    "post_id": int,
    "user_id": int,
    "content": str,
    "likes": int,
    # Add more fields as needed
}
comment_schema = {
    "comment_id": int,
    "post_id": int,
    "user_id": int,
    "content": str,
    # Add more fields as needed
}

# Generate sample data
users_data = [
    {"user_id": 1, "username": "user1", "email": "user1@example.com"},
    {"user_id": 2, "username": "user2", "email": "user2@example.com"},
    # Add more sample user data
]

posts_data = [
    {"post_id": 1, "user_id": 1, "content": "This is a sample post by user1", "likes": 10},
    {"post_id": 2, "user_id": 2, "content": "This is a sample post by user2", "likes": 5},
    # Add more sample post data
]

comments_data = [
    {"comment_id": 1, "post_id": 1, "user_id": 2, "content": "Nice post!"},
    {"comment_id": 2, "post_id": 2, "user_id": 1, "content": "Great content!"},
    # Add more sample comment data
]

# Insert sample data into MongoDB
users_collection = db["users"]
users_collection.insert_many(users_data)

posts_collection = db["posts"]
posts_collection.insert_many(posts_data)

comments_collection = db["comments"]
comments_collection.insert_many(comments_data)

# Close connection
client.close()