<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INCLUDE TEST</title>
</head>
<body>
	<h1>HEADER JSP</h1>
	<a href="index.jsp">메인으로</a> | <a href="second.jsp">SECOND</a> 
	<hr/>
<!-- 선언문 -->
<%!
	String s = "Header에서 선언된 전역변수 - Field";
%>