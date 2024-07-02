<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
	<h1>REMOVE COOKIE</h1>
	<%
		Cookie cookie = new Cookie("PM_NAME","");
		// path 지정하지 않으면 contextPath
		// name이 같더라도 path가 틀리면 서로 다른 cookie로 인식
		cookie.setPath("/");
		// maxAge 미지정 시 유지시간은 session
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	%>
	<a href = "index.jsp">메인으로</a>
</body>
</html>