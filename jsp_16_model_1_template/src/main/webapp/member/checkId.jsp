<%@ page language="java" contentType="text/html; charset=UTF-8"%>]
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<c:catch var="e">
	<s:setDataSource 
		var="conn"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/digital_jsp"
		user="digital"
		password="1234"/>
	<s:query var="rs" dataSource="${conn}">
		SELECT * FROM digital_member WHERE u_id = ?
		<s:param>${param.u_id}</s:param>
	</s:query>
	
	<c:choose>
		<c:when test="${rs.rowCount > 0}">
			<!-- 동일한 아이디 존재 -->
			<script>
				alert('이미 사용중인 아이디입니다.');
			</script>
		</c:when>
		<c:otherwise>
			<!-- 동일한 아이디 존재하지 않음 -->
			<script>
				alert('사용 가능한 아이디입니다.');
			</script>
		</c:otherwise>
	</c:choose>
</c:catch>