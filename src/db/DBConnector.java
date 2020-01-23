package db;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class DBConnector {
	private static MongoDatabase database = null;

	public static MongoDatabase getDBConnection() {
		if(database != null) {
			MongoClient mongoClient = MongoClients.create(System.getenv("MONGO_URL"));
			database = mongoClient.getDatabase("dev_chat_db");
			return database;
		}
		else
		{
			return database;
		}
	}
}
