package api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import db.DBConnector;

@SuppressWarnings("serial")
public class SingleQuestion extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MongoDatabase database = DBConnector.getDBConnection();
		MongoCollection<Document> coll = database.getCollection("questions");
		
		
	    BasicDBObject query = new BasicDBObject();
	    query.put("_id", new ObjectId(req.getParameter("ques") + ""));
	
		var data = coll.find(query);

		MongoCursor<Document> cur = data.iterator();
		
		String id = "";
		String username = "";
		String iso_date_time = "";
		String question = "";
		String markdown = "";
		
		for (MongoCursor<Document> iterator = cur; iterator.hasNext();) {
			Document d = (Document) iterator.next();
			id = d.get("_id") +"";
			username = d.get("username") + "";
			iso_date_time = d.get("iso_date_time") + "";
			question = d.get("question") + "";
			markdown = d.get("markdown") + "";
		}
		
		req.setAttribute("id",id);
		req.setAttribute("username",username);
		req.setAttribute("iso_date_time",iso_date_time);
		req.setAttribute("question",question);
		req.setAttribute("markdown",markdown);
		req.getRequestDispatcher("question.jsp").forward(req, resp);
	}
}
