<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 입력 페이지</title>
</head>
<body>
	<h1>회원정보 입력</h1>
	<form action="insertExecute.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" required /></td>
			</tr>
			<tr>
				<th colspan="2">
					<button>등록</button>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>