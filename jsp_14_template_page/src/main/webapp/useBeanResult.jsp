<%@page import="test.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%-- 
<%
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String paramAge = request.getParameter("age");
	int age = Integer.parseInt(paramAge);
	
	UserVO user = new UserVO(name,addr,age);
	session.setAttribute("user",user);
%>
 --%>
 <!-- useBean 활용 -->
 <%
 /*
 	UserVO user = (UserVO)session.getAttribute("user");
 	if(user == null){
 		user = new UserVO();
 		session.setAttribute("user", user);
 	}
 */
 %>
<jsp:useBean id="user" class="test.UserVO" scope="session"/>
<jsp:setProperty name="user" property="*"/>
<!-- user.setName(request.getParameter("name")); -->
<%-- 
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="addr"/>
<jsp:setProperty name="user" property="age"/>
 --%> 
 

<%
	response.sendRedirect("index.jsp");



%>