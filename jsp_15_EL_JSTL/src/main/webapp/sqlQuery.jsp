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
<%-- 
<s:setDataSource var="conn" 
	driver="com.mysql.cj.jdbc.Driver" 
	url="jdbc:mysql://localhost:3306/digital_jsp" 
	user="digital" 
	password="1234"/>
 --%>
 
<s:query var="rs" dataSource="java/MySQLDB" 
		 sql="SELECT * FROM test_member ORDER BY num DESC"/>
<%-- 		 
<s:query var="rs" dataSource="${conn}">
	SELECT * FROM test_member ORDER BY num DESC
</s:query>
 --%>
 <!-- rs.rowcount : 검색된 행의 개수 -->
 <c:choose>
 	<c:when test="${rs.rowCount > 0}">
 		<h2>등록된 회원정보가 존재합- ${rs.rowCount}</h2>
 		<c:forEach var="m" items="${rs.rows}">
 			${m.num} - ${m.id} - ${m.pass} - ${m.addr} - ${m.phone} - ${m['gender']} - ${m['age']}
 			- <a href="sqlUpdate.jsp?num=${m.num}">수정</a> | <a href="sqlDelete.jsp?num${m['num']}">삭제</a>
 			<br/>
 		</c:forEach>
 	</c:when>
 	<c:otherwise>
 		<h2>검색된 정보가 없습니다.</h2>
 	</c:otherwise>
 </c:choose>
 
</body>
</html>