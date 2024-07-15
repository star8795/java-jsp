<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- jstlSQL.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="sqlResult.jsp" method="POST">
		id : <input type="text" name="id" required/> <br/>
		pass : <input type="password" name="pass" required/> <br/>
		addr : <input type="text" name="addr" required/> <br/>
		phone : <input type="text" name="phone" required/> <br/>
		gender : <label>
			<input type="radio" name="gender" value="남성"/> 남성
		</label>
		<label>
			<input type="radio" name="gender" value="여성" checked/> 여성
		</label>
		age : <input type="number" name="age" min="1"/> <br/>
		<button>확인</button>
	</form>
</body>
</html>