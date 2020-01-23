package dev_chat;

import java.io.IOException;
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
import com.mongodb.client.MongoDatabase;

import db.DBConnector;

@SuppressWarnings("serial")
public class SignUp extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MongoDatabase database = DBConnector.initiateConnection();
		MongoCollection<Document> coll = database.getCollection("users");

		String user_email = req.getParameter("form_email").trim();
		String user_pass = "" + req.getParameter("form_password").trim();

		if (user_email.length() <= 3 || user_pass.length() < 8) {
			req.setAttribute("message",
					"Something wrong with email or password.<br/> Passwords should be atleast 8 characters long.");
			req.setAttribute("color", "danger");
			req.getRequestDispatcher("signup.jsp").forward(req, resp);
		}

		Map<String, Object> new_user_details = new HashMap<String, Object>();

		new_user_details.put("email", user_email);
		Document email_data_doc = new Document(new_user_details);

		new_user_details.put("username", user_email.split("@")[0]);
		new_user_details.put("upass", user_pass);
		new_user_details.put("bson_date_time", new BSONTimestamp());
		new_user_details.put("iso_date_time", new Date());

		Document full_data = new Document(new_user_details);

		var temp = coll.find(email_data_doc).first();

		if (temp == null) {
			coll.insertOne(full_data);
			req.setAttribute("message",
					"Account created succesfully you can <a style='color: #195C44; text-decoration: underline;' href='login.jsp'>login</a> now");
			req.setAttribute("color", "success");
			req.getRequestDispatcher("signup.jsp").forward(req, resp);
		} else {
			req.setAttribute("message", "This E-mail is being used by another account use another E-mail");
			req.setAttribute("color", "danger");
			req.getRequestDispatcher("signup.jsp").forward(req, resp);
		}
	}

}
