<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	body {
		front-family: Ariel, sans-serif;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100%;
		background-color: #f4f4f4;
		margin: 0;
	}
	.join{
		background-color: #ffffff;
		padding: 20px;
		border-radius: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		max-width: 400px;
		width: 100%;
		border: 1px solid #ccc;
	}
	.join h2{
		text-align: center;
		margin-bottom: 20px;
	}
	.join input{
		width: calc(100% - 20px);
		padding: 10px;
		margin: 10px 0;
		border: 1px solid #ccc;
		border-radius: 5px;
	}
	.join button {
		width: calc(100% - 20px);
		padding: 10px;
		margin: 10px 0;
		background-color: #007bff;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	.join button:hover {
		background-color: #0056b3;
	}
</style>
</head>
<body>
	<div class="join">
		<h2>회원가입</h2>
		<form action="joinComplete.jsp", method="post">
			이름  <input type="text" name="name" placeholder="이름" required><br/>
			아이디  <input type="text" name="id" placeholder="id" required><br/>
			비밀번호  <input type="password" name="pass" placeholder="password" required><br/>
			생년월일 <input type="date" name="birthdate" placeholder="생년월일" required=><br/>
			전화번호  <input type="text" name="phone" placeholder="전화번호" required><br/>
			이메일  <input type="email" name="email" placeholder="email" required><br/>
			<button type="button">이메일 인증</button>
			<button type="submit">회원가입</button>
		</form>
	</div>
</body>
</html>