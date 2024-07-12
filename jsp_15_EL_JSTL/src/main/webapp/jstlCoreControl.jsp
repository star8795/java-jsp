<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlCoreControl.jsp</title>
</head>
<body>
	<h3>CORE TAG CONTROL CONDITION</h3>
	<c:set var="mycar" value="SANTAFE"/>
	
	<!-- if tag의 조건에 만족할 때만 tag body 실행 -->
	<c:if test="${mycar eq 'SANTAFE'}">
		내차는 싼타페 <br/>
	</c:if>
	<c:if test="${mycar == 'G90'}">
		내차는 G90 <br/>
	</c:if>
	<c:set var="grade" value="95"/>
	<c:choose>
		<c:when test="${grade >= 90}">
			<h3>A학점</h3>
		</c:when>
		<c:when test="${grade >= 80}">
			<h3>B학점</h3>
		</c:when>
		<c:otherwise>
			<h4>조건에 만족하는 값이 아님</h4>
		</c:otherwise>
	</c:choose>
		<br/>
	<hr/>
	<!-- for 반복문 -->
	<!-- 선언, 초기화 ; 탈출 조건식; 증감식 -->
	<!-- int i = 1;  i <= 100; i+=3 --> 
	<!-- step 기본값은 1 -->
	<c:forEach var="i" begin="1" end="100" step="3">
		${i}&nbsp; &nbsp;&nbsp;
	</c:forEach>
	<%
		int[] nums = {9,8,7,6,5,4,3,2,1};
		request.setAttribute("nums" , nums);
		
		for(int i : nums){
			out.println(i);
		}
	%>
	<br/>
	<c:forEach var="n" items="${nums}">
		${n} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<c:set var="datas" value="최기근,페이커,이순신,세종대왕"/>
	<c:forTokens var="name" items="${datas}" delims=",">
		${name} &nbsp;
	</c:forTokens>
	
	<c:redirect url="index.jsp"/>
</body>
</html>