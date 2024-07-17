<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 처리 실패</title>
</head>
<body>
	<h1>요청 처리실패!- ${param.message}</h1>
	<button onclick="history.go(-1);">돌아가기</button>
</body>
</html>