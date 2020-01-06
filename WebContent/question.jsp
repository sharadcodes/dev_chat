<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
		if (session.getAttribute("user_token") == null) {
			response.sendRedirect("login.jsp");
		}
	%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Dev_Chat | Question</title>
<link rel="stylesheet" href="./assets/css/style.css" />
</head>
<body>
	<nav class="nav">
		<div class="nav-l">
			<a class="logo" href="index.jsp">Dev_Chat</a>
		</div>

		<div class="nav-r">
			<a href="#" id="profile"> <img src="./assets/icons/profile_1.png"
				alt="" />
				<p>Profile</p>
			</a> <a href="dash.jsp"> <img src="./assets/icons/questions.png"
				alt="" />
				<p>Questions</p>
			</a> <a href=""> <img src="./assets/icons/dm.png" alt="" />
				<p>
					Direct <br /> Messages
				</p>
			</a> <a href="ask.jsp" id="ask"> <img src="./assets/icons/add.png"
				alt="" />
				<p>Ask</p>
			</a>
		</div>
		<a href="signout.do"> <img src="./assets/icons/logout.png" alt="" />
			<p>Sign Out</p>
		</a>
	</nav>

	<main>

	<h2 class="category">Q & A</h2>

	<div id="target">
	
	<% if(request.getAttribute("id") != null ) { %>
	
		<div class="ans-card">
			<p class="ques"> ${requestScope.question} </p>
			<div class="two">
			<p class="username"> @${requestScope.username} </p>
			<p class="date"> ${requestScope.iso_date_time} </p>
			</div>
			${requestScope.markdown}
		</div>		
		
	<% } %>		
	
	</div>

	</main>

	<!-- id overlay -->
	<div id="overlay-id">
		<div id="overlay-body">
			<img src="./assets/icons/profile_1.png" alt="" />
			<p>
				<br />
				<%= session.getAttribute("uname")+"" %>
			</p>
		</div>
	</div>

	<script type="text/javascript">
	//for id overlay
	
	document.getElementById("profile").addEventListener("click", function() {
	  document.getElementById("overlay-id").classList.toggle("show");
	});
	
	document.getElementById("overlay-id").addEventListener("click", function() {
	  document.getElementById("overlay-id").classList.toggle("show");
	});	
	</script>
</body>
</html>
