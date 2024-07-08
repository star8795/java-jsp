<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String enteredCode = request.getParameter("authCode");
	String sessionCode = (String) session.getAttribute("authCode");
	
	
%>