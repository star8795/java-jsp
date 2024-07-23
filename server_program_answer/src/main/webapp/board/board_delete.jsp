<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 삭제</h1>
	<form action="board_delete_submit.jsp" method="post">
		<input type="hidden" name="board_num" value=""/>
		비밀번호 : <input type="password" name="board_pass"/>
		<input type="submit" value="삭제"/>
	</form>
	<a href="#">목록</a>
</body>
</html>