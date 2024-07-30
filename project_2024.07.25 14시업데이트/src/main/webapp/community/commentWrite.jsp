<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[type="submit"] {
background-color: black;
color:white;
cursor:pointer;
width: 100px; 
height: 50px; 
font-size: 17px;
margin-top:20px;
}
textarea {
width: 100%; 
height:100px; 
resize: none; 
margin-right: 10px;
border:2px solid black;
</style>
</head>
<body>
	<form action="../community/commentWriteSubmit.jsp">
	<div style="display: flex;">
		<textarea name="main"></textarea>
		<input type="hidden" name="num" value="${param.post_num}">
		<input type="hidden" name="nickname" value="로그인 기능 구현 필요">
		<input type="submit" value="댓글 등록" >
	</div>
		
	</form>
</body>
</html>