<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="co" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core</title>
</head>
<body>
	<h1>JSP Standard Tag Library</h1>
	<!-- 특정 영역객체에 속성 값을 추가 -->
	<!-- scope  :   page request session application -->
	<co:set var="varPage" value ="page 영역" scope="page"/>
	
	EL : ${varPage} <br/>
	
	<co:set var="numPage" value="10" scope="page"/>
	EL num : ${numPage + 11} <br/>
	<co:set var="request1" value="request 영역" scope="request"/>
	request1 : ${requestScope.request1} <br/> 
	<co:remove var="request1" scope="session"/> <!-- scope="page" -->
	request1 : ${request1} <br/>
	<hr/>
	<co:out value="${request1}"/> <br/>
	${request1} <br/>
	
	<co:set var="test" value="<script>alert('메롱메롱!');</script>"/>
	<%-- ${test} <br/> --%>
	<!-- escapeXml="true" 기본값이 true -->
	<co:out value="${test}" escapeXml="true" />
	<!-- \${} -->
	<br/>
	<co:out value="${test2}" default="test2의 값이 존재하지 않습니다."/>
	<br/>
	<co:out value="${test2}">
		<h3>test2 는 존재 하지 않습니다.</h3>
	</co:out>
	<br/>
	<br/>
	<br/>
	<br/>
	<div>
		<co:import url="index.jsp"/>
	</div>	
	<div>
		<%@ include file="index.jsp" %>
	</div>
	<div>
		<jsp:include page="index.jsp"/>
	</div>
	<hr/>
	<div>
		<!-- 외부 사이트의 페이지 include  -->
		<co:import url="https://www.nate.com"/>
	</div>
</html>