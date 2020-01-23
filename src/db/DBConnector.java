package db;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class DBConnector {
	public static MongoDatabase database;

	public static MongoDatabase initiateConnection() {
		MongoClient mongoClient = MongoClients.create(System.getenv("MONGO_URL"));
		return database = mongoClient.getDatabase("dev_chat_db");
	}
}
