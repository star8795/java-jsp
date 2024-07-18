<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%
	/* response.setHeader("Content-Type","application/json;charset=utf8;"); */
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	System.out.println("name : " + name);
	System.out.println("age : " + age);
	
	String json = "{\"name\" : \"" + name +"\", \"age\" : "+age+"}";
	System.out.println(json);
	response.getWriter().print(json);
	
%>