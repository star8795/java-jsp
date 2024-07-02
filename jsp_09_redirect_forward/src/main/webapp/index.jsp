<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	
	<%
		pageContext.setAttribute("index", "pageTemp");
		request.setAttribute("index" ,"requestTemp");
	%>
	
	<h3>pageContext : <%= pageContext.getAttribute("index") %></h3>
	<h3>request : <%= request.getAttribute("index") %></h3>
	
	<a href = "result.jsp">result</a>
	
</body>
</html>
