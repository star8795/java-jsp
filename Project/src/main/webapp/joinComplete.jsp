<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
	<%
		String phone= request.getParameter("phone");
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birthdate");
		String email = request.getParameter("eamil");
		
		out.println("<h2>회원가입 완료</h2>");
		out.println("<p>전화번호: " + phone + "</p>");
		out.println("<p>이름: " + name + "</p>");
		out.println("<p>생년월일: " + birthdate + "</p>");
		out.println("<p>이메일: " + email + "</p>");
	%>
</body>
</html>