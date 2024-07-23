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
	<h1>게시물 상세내용</h1>
	<table>
		<tr>
			<td>작성자</td>
			<td></td>
		</tr>
		<tr>
			<td>제목</td>
			<td></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea readonly cols=40 rows=10></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<a href="#">[수정]</a>
				<a href="#">[삭제]</a>
				<a href="#">[목록]</a>
			</td>
		</tr>
	</table>
</body>
</html>