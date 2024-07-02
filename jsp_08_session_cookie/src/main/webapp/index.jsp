<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<%@ include file="check.jsp" %>
	<h1>MAIN PAGE</h1>
	<a href = "addCookie.jsp">쿠키 추가</a>
	<a href = "removeCookie.jsp">REMOVE Cookie</a>
	<a href = "addSession.jsp">addSession</a>
	<h1><%=session.getAttribute("uid") %></h1>
</body>
</html>