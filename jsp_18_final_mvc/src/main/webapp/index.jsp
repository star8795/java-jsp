<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- webapp/index.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="test">test</a> <br/>
	<a href="test1?test=hello">test1</a>
	<%
		response.sendRedirect("test");
	%>
</body>
</html>