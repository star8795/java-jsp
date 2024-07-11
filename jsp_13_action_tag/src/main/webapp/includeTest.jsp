<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest.jsp</title>
</head>
<body>
	<%
		String includePage = request.getParameter("includePage");
	%>

	<h1>여기는 includeTest.jsp 입니다.</h1>
	<!-- 디렉티브 태그를 이용한 include -->
	<%-- <%@ include file="includePage.jsp" %> --%>
	<!-- 액션 태그를 이용한 include -->
	<jsp:include page="<%=includePage%>"/>
	<%-- <h2><%=s%></h2> --%>
</body>
</html>