package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.bson.types.BSONTimestamp;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

@SuppressWarnings("serial")
public class Questions extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MongoClient mongoClient = MongoClients
				.create(System.getenv("MONGO_URL"));
		MongoDatabase database = mongoClient.getDatabase("dev_chat_db");
		MongoCollection<Document> coll = database.getCollection("questions");

		var data = coll.find();

		MongoCursor<Document> cur = data.iterator();

		String json_response_string = "{ \"questions\": [";
		mongoClient.close();
		for (MongoCursor<Document> iterator = cur; iterator.hasNext();) {
			Document d = (Document) iterator.next();
			json_response_string += "{ ";
			json_response_string += "\"id\" :\"" + d.get("_id") + "\",";
			json_response_string += "\"username\" :\"" + d.get("username") + "\",";
			json_response_string += "\"iso_date_time\" :\"" + d.get("iso_date_time") + "\",";
			json_response_string += "\"question\" :\"" + d.get("question") + "\",";
			json_response_string += "\"markdown\" :\"" + d.get("markdown") + "\"";
			if (iterator.hasNext())
				json_response_string += " },";
			else
				json_response_string += " }";
		}

		json_response_string += "]}";

		PrintWriter out = resp.getWriter();
		resp.setContentType("application/json");
		out.print(json_response_string);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (req.getSession(false).getAttribute("user_token") != null) {

			MongoClient mongoClient = MongoClients.create(System.getenv("MONGO_URL"));
			MongoDatabase database = mongoClient.getDatabase("dev_chat_db");
			MongoCollection<Document> coll = database.getCollection("questions");

			String user_id = req.getHeader("user_id") + "";
			String question = req.getHeader("question") + "";
			String markdown = req.getHeader("markdown") + "";

			if (question.split(" ").length < 5) {

				PrintWriter out = resp.getWriter();
				resp.setContentType("application/json");
				resp.setStatus(304);
				out.print(
						"{\"status\": \"Something went wrong with sumbitted question. <br/> Note: Question should contain more than 4 words\"}");
			} else {

				Map<String, Object> question_details = new HashMap<String, Object>();

				question_details.put("username", user_id);
				question_details.put("bson_date_time", new BSONTimestamp());
				question_details.put("iso_date_time", new Date());
				question_details.put("question", question);
				question_details.put("markdown", markdown);

				Document full_data = new Document(question_details);

				coll.insertOne(full_data);
				mongoClient.close();
				PrintWriter out = resp.getWriter();
				resp.setContentType("application/json");
				resp.setStatus(201);
				out.print("{\"status\": \"sumbitted\"}");
			}
		} else {
			PrintWriter out = resp.getWriter();
			resp.setContentType("application/json");
			resp.setStatus(401);
			out.print("{\"status\": \"not authenticated\"}");
		}
	}
}
