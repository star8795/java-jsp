<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import= "vo.MemberVO" %>
<%
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEADER</title>
</head>
<body>
	<header>
		<a href="main.jsp">MAIN PAGE</a> | 
<% if(loginMember == null){ %>
		<a href="join.jsp">JOIN PAGE</a> | 
		<a href="login.jsp">LOGIN PAGE</a>
<%}else{ %>
	<%= loginMember.getUname() %> 님 반갑습니다. | 
	<a href="logOut.jsp">로그아웃</a>
<%}%>
		 
		<hr/>
	</header>