<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response.jsp</title>
</head>
<body>
	<h1>response.jsp</h1>
	<h3>pageContext : <%= pageContext.getAttribute("index") %></h3>
	<h3>request :  <%= request.getAttribute("index") %></h3>
	<h3>request servlet attribute <%= request.getAttribute("attrID") %></h3>
	<h3>request parameter : <%= request.getParameter("id") %></h3>
</body>
</html>