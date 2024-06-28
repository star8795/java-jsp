<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>loginSubmit.jsp</title>
</head>
<body>
	<h1>Java Server Page</h1>
	<%
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
	%>
	
	<%= uid %> <br/>
	<%= upw %> <br/>
	<a href="index.html">메인으로</a>
</body>
</html>