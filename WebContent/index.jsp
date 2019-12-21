<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Dev_Chat | Home</title>
<%@ include file="partials/head.html"%>
</head>
<body class="text-center">

	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header class="masthead mb-auto">
			<div class="inner">
				<a href="index.jsp"><h3 class="masthead-brand">Dev_Chat</h3></a>
				<nav class="nav nav-masthead justify-content-center">
					<a class="nav-link active" href="index.jsp">Home</a> <a
						class="nav-link" href="login.jsp">Log in</a> <a class="nav-link"
						href="signup.jsp">Sign Up</a>
				</nav>
			</div>
		</header>

		<main role="main" class="inner cover">
		<h1 class="cover-heading">Join the Community Now !</h1>
		<p class="lead">
			We have made this community for the students, teachers and
			developers. <br /> This will help you in the studies and will keep
			you in touch with the latest technologies in demand
		</p>
		<p class="lead">
			<a href="signup.jsp" class="btn btn-lg btn-secondary">Become a
				Member</a>
		</p>
		</main>

		<%@ include file="partials/footer.jsp"%>
	</div>
</body>

</html>