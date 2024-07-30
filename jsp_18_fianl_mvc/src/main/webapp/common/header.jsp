<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path"  value="${pageContext.request.contextPath}" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/footer.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/list.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<header>
	<div>
		<ul>
			<li><a href="test">HOME</a></li>
			<li><a href="login.mc">로그인</a></li>
			<li><a href="join.mc">회원가입</a></li>
		</ul>
	</div>
	<div style="overflow:visible">
		<ul>
			<li><a href="">공지사항</a></li>
			<li><a href="">질문과답변</a></li>
		</ul>
	</div>
</header>