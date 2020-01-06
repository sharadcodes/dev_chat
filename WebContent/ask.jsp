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
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
</head>
<body>
	<nav class="nav">
		<div class="nav-l">
			<a class="logo" href="#">Dev_Chat</a>
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

	<h2 class="category">Ask anytime :)</h2>

	<textarea autocomplete="off" id="question_text" autocomplete="off"
		placeholder="Write your question here ..." autofocus required></textarea>

	<div id="editor-container">
		<div id="editor"></div>
	</div>

	<div id="loader_container" style="margin-top: 1rem;">
		<div id="loader"></div>
	</div>
	
	<button id="submit" onclick="submit()">Submit</button>
	
	<div id="cont"></div>
	</main>

	<script>
      function submit() {
		document.getElementById("loader").innerHTML = `<p>Submitting please wait...</p>`;    	 
    	     	  
        const user_id =	`<%= session.getAttribute("uname")%>`;
        const question = document.getElementById("question_text").value;
        const markdown = quill.container.firstChild.innerHTML;

        fetch("qapi", {
       	  method: "post",
       	  headers: {
       	    'Accept': 'application/json',
       	    'Content-Type': 'application/json',
       	    'user_id': JSON.stringify(user_id),
       	 	'question': JSON.stringify(question),
       	 	'markdown': JSON.stringify(markdown)
       	  }
       	})
       	.then( (response) => { 
       		if(response.status == 304) {
    		document.getElementById("loader").innerHTML = `
           		    <p>Question should be of atleast 4 words</p>
            `;
       		}
       		else if(response.status == 201) {
        		document.getElementById("loader").innerHTML = `
        			<p>Submitted</p>
                `;

        		location.reload(); 
			   }
       	});
      }
    </script>

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
	
	document.getElementById("profile").addEventListener("click", function() {
	  document.getElementById("overlay-id").classList.toggle("show");
	});
	
	document.getElementById("overlay-id").addEventListener("click", function() {
	  document.getElementById("overlay-id").classList.toggle("show");
	});	
	
	</script>

	<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>

	<script>
      var quill;
      var metaData = [];
      function qqqq() {
        quill = new Quill("#editor", {
          placeholder: "More details will go here ...",
          modules: {
            toolbar: [
              [{ header: [1, 2, 3, false] }],
              ["bold", "italic", "underline"],
              [{ list: "ordered" }, { list: "bullet" }],
              ["code-block"]
            ]
          },
          theme: "snow"
        });
      }
      qqqq();
    </script>
</body>
</html>
