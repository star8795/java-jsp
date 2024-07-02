<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD SESSION</title>
</head>
<body>
	<%@ include file = "check.jsp" %>
	<h1>ADD SESSION</h1>
	<%
		if(session.getAttribute("uid") == null){
			session.setAttribute("uid", "chlrlrms");
		}
	%>
	<a href = "checkSession.jsp">checkSession</a>
</body>
</html>