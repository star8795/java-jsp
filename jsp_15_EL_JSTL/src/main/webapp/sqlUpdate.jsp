<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
	<form action="sqlUpdateSubmit.jsp" method="post">
		<input type="hidden" name="num" value="${param.num}"/>
		<h2>기존 비밀번호를 입력해주세요.</h2>
		<input type="password" name="pass"/>
		<h3>새로운 비밀번호를 입력해주세요.</h3>
		password : <input type="password" name="newPass"/>
		<button>확인</button>
	</form>
</body>
</html>