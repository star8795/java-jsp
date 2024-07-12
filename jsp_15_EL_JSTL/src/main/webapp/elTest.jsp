<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTest.jsp</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		session.setAttribute("sessionID", id);
	%>
EL : ${id} <br/>
EL sessionID : ${sessionID} <br/>
EL scopeName : ${scopeName} <br/>
<br/>
param id : <%= id %> <br/>
EL param id : ${param.id} <br/>

<input type="text" value="<%=id%>"/> <br/>
<input type="text" value="${param.id}"/>

<hr/>
<h2>EL 표현언어 내부에서의 연산</h2>
<!-- 
	기본적인 연산식
	산술연산, 비교연산, 동등비교연산, 논리비교 연산  
-->
<h3>\${5 + 7} : ${5 + 7} </h3> <!-- +, - , * , / , % -->
<h3>\${ 5 == 7 } : ${5 == 7} </h3> <!-- >=, >, < , <=, ==, !=  -->
<!-- 삼항 연산자 -->
<h3>\${5 + 7 > 8 ? '크다' : '작다'} : ${5 + 7 > 8 ? '크다' : '작다'}</h3>

<%
	String s  = "a";
	String s1 = new String("hi?");
	String s2 = new String("attribute");
	String s3 = new String("attribute");
	request.setAttribute("s" , s);
	request.setAttribute("s1" , s1);
	request.setAttribute("s2" , s2);
	request.setAttribute("s3" , s3);
%>

<%= s == s1 %> <br/>
<%= s2 == s3 %> <br/>
<%= s2.equals(s3) %> <br/>

<!-- 동등비교 연산은 equals method를 이용하여 비교 -->
<h3>\${s == s1} : ${s == s1} </h3>
<h3>\${s2 == s3} : ${s2 == s3} </h3>
<h3>\${s2 != s3} : ${s2 != s3} </h3>
<h3>\${s2 eq s3} : ${s2 eq s3} </h3>		<!-- equals -->
<h3>\${s2 ne s3} : ${s2 ne s3} </h3>		<!-- not equals -->
<hr/>
<h3>\${s != s2 && s2 == s3} : ${s != s2 && s2 == s3}</h3>
<h3>\${s != s2 and s2 == s3} : ${s != s2 and s2 == s3}</h3>
<h3>\${s != s2 || s2 == s3} : ${s != s2 || s2 == s3}</h3>
<h3>\${s != s2 or s2 == s3} : ${s != s2 or s2 == s3}</h3>

<hr/>
<h3>\${s1 eq "hi?"} : ${s1 eq "hi?"}</h3>
<h3>\${s1 ne "hi?"} : ${s1 ne "hi?"}</h3> 

<%
	java.util.ArrayList<String> list = null;
	// boolean isCheck = list.isEmpty();  // NullPointereException;
	request.setAttribute("memberList" , list);
%>
<h3>\${empty memberList} : ${empty memberList}</h3>
<h3>\${not empty memberList} : ${not empty memberList}</h3>
<%
	list = new java.util.ArrayList<>();
	request.setAttribute("memberList" , list);
%>
<h3>\${memberList.isEmpty()} : ${memberList.isEmpty()}</h3>
<h3>\${empty memberList} : ${empty memberList}</h3>
<h3>\${! empty memberList} : ${! empty memberList}</h3>
<%
	list.add("최기근");
%>
</body>
</html>