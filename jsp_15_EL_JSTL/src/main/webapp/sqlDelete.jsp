<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
</head>
<body>

	<s:update var="result" dataSource="java/MySQLDB">
		DELETE FROM test_member WHERE num = ?
		<s:param>${param.num}</s:param>
	</s:update>

	<c:if test="${result == 1}">
		<script>
			alert('정상적으로 처리가 완료 되었습니다.');
			location.href='sqlQuery.jsp';
		</script>
	</c:if>
	
	<c:if test="${result != 1}">
		<script>
			alert('처리가 실패 하였습니다.');
			location.href='sqlQuery.jsp';
		</script>
	</c:if>
</body>
</html>