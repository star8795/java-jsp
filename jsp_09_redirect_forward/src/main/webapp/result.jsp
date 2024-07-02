<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
	<h1>result.jsp</h1>
	<h3>pageContext : <%= pageContext.getAttribute("index") %></h3>
	<h3>request : <%= request.getAttribute("index") %></h3>
	<hr/>
	<form action="redirect" method="post">
		<input type="text" name="id"/>
		<button>POST</button>
	</form>
</body>
</html>