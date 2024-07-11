<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
	<h1>출력된 페이지(forwardTest1.jsp)</h1>
	<table border="1">
		<tr>
			<td>이름</td>
			<td><%=request.getParameter("name") %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%=request.getParameter("age") %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=request.getParameter("addr") %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=request.getParameter("tel") %></td>
		</tr>
	</table>
</body>
</html>