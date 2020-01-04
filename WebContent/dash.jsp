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
<title>Dev_Chat | Dashboard</title>
<link rel="stylesheet" href="./assets/css/style.css" />
<script src="./assets/js/ques.js"></script>
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

	<h2 class="category">Recent Questions</h2>

	<div id="target">
	
		<!-- SVG LOADER -->
			<br />
			<br />
			<br />
			<br />
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin: auto; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: block; shape-rendering: auto; animation-play-state: running; animation-delay: 0s;" width="50vw" height="40vh" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
			<path fill="none" stroke="#ffb74d" stroke-width="5" stroke-dasharray="230.93003540039064 25.658892822265614" d="M24.3 30C11.4 30 5 43.3 5 50s6.4 20 19.3 20c19.3 0 32.1-40 51.4-40 C88.6 30 95 43.3 95 50s-6.4 20-19.3 20C56.4 70 43.6 30 24.3 30z" stroke-linecap="round" style="transform: scale(0.69); transform-origin: 50px 50px 0px; animation-play-state: running; animation-delay: 0s;">
			  <animate attributeName="stroke-dashoffset" repeatCount="indefinite" dur="0.9090909090909091s" keyTimes="0;1" values="0;256.58892822265625" style="animation-play-state: running; animation-delay: 0s;"></animate>
			</path>
			</svg>
		<!-- SVG LOADER END -->	
		
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
