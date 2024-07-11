<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="test.UserVO" %>
<h1>Beans Test</h1>
<%-- 
<%
	UserVO user = new UserVO();
	session.setAttribute("user",user);
	
	user.setName("최기근");
	user.setAddr("부산");
	user.setAge(26);
%>
 --%>
 <jsp:useBean id="user" class="test.UserVO" scope="session"/>
 
 <jsp:setProperty name="user" property="name" value="김동하"/>
 <jsp:setProperty name="user" property="addr" value="평양"/>
 <jsp:setProperty name="user" property="age" value="26"/>
 
 
<h3><%=user.getName()%></h3>
<h3><%=user.getAddr()%></h3>
<h3><%=user.getAge()%></h3>

<!-- scope 기본값은 page -->
<jsp:useBean id="aaa" class="test.UserVO" scope="page"/>
<jsp:useBean id="bbb" class="test.UserVO" scope="request"/>
<jsp:useBean id="ccc" class="test.UserVO" scope="session"/>
<jsp:useBean id="ddd" class="test.UserVO" scope="application"/>

<%
	UserVO a = (UserVO)pageContext.getAttribute("aaa");
	out.println(a);
	out.println("<hr/>");
	UserVO b = (UserVO)request.getAttribute("bbb");
	out.println(b);
	out.println("<hr/>");
	UserVO c = (UserVO)session.getAttribute("ccc");
	out.println(c);
	out.println("<hr/>");
	UserVO d = (UserVO)application.getAttribute("ddd");
	out.println(d);
	out.println("<hr/>");
	
	UserVO test = (UserVO)application.getAttribute("aaa");
	out.println(test);
	out.println("<hr/>");
%>

<!-- id 속성에 부여된 변수이름 중복 -->
<%-- <jsp:useBean id="ddd" class="test.UserVO" scope="application"/> --%>
<h3><jsp:getProperty name="user" property="name"/></h3>
<h3><jsp:getProperty name="user" property="addr"/></h3>
<h3><jsp:getProperty name="user" property="age"/></h3>