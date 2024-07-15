<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- catch body 블럭 내부에서 예외가 발생하면 page 영역에 예외 객체를 e라는 이름으로 저장 -->
	<c:catch var="e">
		
		<s:setDataSource var="conn" 
			driver="com.mysql.cj.jdbc.Driver" 
			url="jdbc:mysql://localhost:3306/digital_jsp" 
			user="digital" 
			password="1234"/>
			
		<h3>${conn}</h3>	
		<!-- insert, update, delete s:update -->
		<s:update var="result" dataSource="${conn}">
			INSERT INTO test_member VALUES(null,?,?,?,?,?,?);
			<s:param>${param.id}</s:param>
			<s:param>${param.pass}</s:param>
			<s:param>${param.addr}</s:param>
			<s:param>${param.phone}</s:param>
			<s:param>${param.gender}</s:param>
			<s:param>${param.age}</s:param>
		</s:update>
		
		<c:if test="${result > 0}">
			<h3>회원 등록 완료</h3>
		</c:if>
		
		<c:if test="${result == 0}">
			<h3>회원 등록 실패</h3>
		</c:if>
			
	</c:catch>
	
	<!-- e에 저장된 값이 존재하면 예외가 발생 -->
	<c:if test="${!empty e}">
		에러메세지 : <c:out value="${e.getMessage()}"/> <br/>
		<c:out value="${e.toString()}"/>
	</c:if>
	<hr/>
	<a href="sqlQuery.jsp">member list</a>
</body>
</html>