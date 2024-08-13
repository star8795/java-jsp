<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 집</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<link href="${path}/resources/css/common.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/resources/css/header.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/resources/css/footer.css" rel="stylesheet"
	type="text/css" />
<link rel="shortcut icon" href="${path}/favicon.ico" type="image/x-icon">
</head>
<body>
	<header>
		<div>
			<ul>
				<li><a href="${path}">HOME</a></li>
				<c:choose>
					<c:when test="${!empty sessionScope.member}">
						<li><a href="#">${sessionScope.member.name}</a></li>
						<li><a href="${path}/logout.mc">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${path}/login.mc">로그인</a></li>
						<li><a href="${path}/join.mc">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">질문과답변</a></li>
			</ul>
		</div>
	</header>
	
	
	
	
	
	