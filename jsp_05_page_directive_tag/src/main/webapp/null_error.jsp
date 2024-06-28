<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="error_500.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page Test</title>
</head>
<body>
	<%
		String age = request.getParameter("age");
		int ageNum = Integer.parseInt(age);
	%>
	당신의 나이는 : <%= ageNum %> 입니다.
</body>
</html>