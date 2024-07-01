<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
	<hr />
	<h1>ADD COOKIE</h1>
	<hr />
	<%
	/*
		Max-Age는 초단위
		60 * 60 * 24 * 30
	*/
	//	response.addHeader("Set-Cookie","id=id001; Max-Age=2592000; path=/");

	// 2번째 방법
	Cookie cookie = new Cookie("PM_NAME", "김동찬");
	cookie.setMaxAge(2592000);
	cookie.setPath("/");
	response.addCookie(cookie);
	%>
	<a href="index.jsp">메인으로</a>
</body>
</html>