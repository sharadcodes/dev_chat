<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
		if (session.getAttribute("user_token") != null) {
			response.sendRedirect("dash.jsp");
		}
	%>

<!DOCTYPE html>
<html>
<head>
<title>Dev_Chat | Log in</title>
<%@ include file="partials/head.html"%>
</head>
<body>

	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header class="masthead mb-auto">
			<div class="inner">
				<a href="index.jsp"><h3 class="masthead-brand">Dev_Chat</h3></a>
				<nav class="nav nav-masthead justify-content-center">
					<a class="nav-link" href="index.jsp">Home</a> <a
						class="nav-link active" href="login.jsp">Log in</a> <a
						class="nav-link " href="signup.jsp">Sign Up</a>
				</nav>
			</div>
		</header>

		<main class="inner cover">

		<form action="login.do" method="POST">
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<input type="email" name="form_email" class="form-control"
						id="inputEmail3">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" name="form_password" class="form-control"
						id="inputPassword3">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-12">
					<button type="submit" class="btn btn-lg btn-block btn-info">Log
						in</button>
				</div>
			</div>

			<%
				if(request.getAttribute("color") != null ){
			%>

			<div class="alert text-center alert-${requestScope.color}"
				role="alert">${requestScope.message}</div>

			<%
				}
			%>
		</form>

		</main>

		<%@ include file="partials/footer.jsp"%>
	</div>
</body>

</html>