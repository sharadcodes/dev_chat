package dev_chat;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

@SuppressWarnings("serial")
public class LogIn extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MongoClient mongoClient = MongoClients
				.create("mongodb+srv://dcadmin:dojomojo9@cluster0-nzssz.mongodb.net/test?retryWrites=true&w=majority");
		MongoDatabase database = mongoClient.getDatabase("dev_chat_db");
		@SuppressWarnings("rawtypes")
		MongoCollection coll = database.getCollection("users");

		String user_email = req.getParameter("form_email");
		String user_pass = "" + req.getParameter("form_password");

		Bson b = new Document("email", user_email);
		var temp = coll.find(b).first();

		if (temp != null) {

			String temp_pass = "" + ((Document) temp).get("upass");

			if (temp_pass.equals(user_pass)) {

				HttpSession hs = req.getSession();

				String t_id = "" + ((Document) temp).get("_id");
				String username = "" + ((Document) temp).get("username");

				mongoClient.close();

				hs.setAttribute("user_token", t_id);
				hs.setAttribute("uname", username);
				resp.sendRedirect("dash.jsp");

			} else {

				mongoClient.close();

				req.setAttribute("message", "Wrong password");
				req.setAttribute("color", "danger");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}

		} else {

			mongoClient.close();

			req.setAttribute("message", "Invalid E-mail");
			req.setAttribute("color", "danger");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		mongoClient.close();
	}
}