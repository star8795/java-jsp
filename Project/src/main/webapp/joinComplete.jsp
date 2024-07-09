<%@page import="java.awt.geom.Path2D"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String birthdate = request.getParameter("birthdate");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		out.println("<h2>회원가입 완료</h2>");
		out.println("<p>이름 : " + name + "</p>");
		out.println("<p>아이디 : " + id + "</p>");
		out.println("<p>비밀번호 : " + pass + "</p>");
		out.println("<p>생년월일 : " + birthdate + "</p>");
		out.println("<p>전화번호 : " + phone + "</p>");
		out.println("<p>이메일 : " + email + "</p>");
	%>
</body>
</html>