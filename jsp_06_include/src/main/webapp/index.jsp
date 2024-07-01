<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="common/header.jsp" %>
	<article>
		<h1>MAIN 본문입니다.</h1>
		<h2><%=s %>></h2>
		<%! String result = "본문에서 선언된 필드"; %>
		<h3><%= result %></h3>
	</article>
<%@ include file="common/footer.jsp" %>