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
<script>
	let msg = '${msg}';
	// let msg = '';
	// let msg = '회원 가입 실패!';
	// let msg = 회원 가입 실패!;
	// msg != null && 
	if(msg != ''){
		alert(msg);
	}
// 	alert('header 실행');
</script>
</head>
<body>
<header>
	<div>
		<ul>
			<li><a href="test">HOME</a></li>
			<c:choose>
				<c:when test="${!empty sessionScope.member}">
					<li>
						<a href="info.mc">${member.name}</a>님 방가 //(- -)
					</li>
					<li>
						<a href="logOut.mc">로그아웃</a>
					</li>
				</c:when>
				<c:otherwise>
					<li><a href="login.mc">로그인</a></li>
					<li><a href="join.mc">회원가입</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div> 
	<div style="overflow:visible">
		<ul>
			<!-- board/notice/notice_list.jsp 페이지 로 이동 -->
			<li><a href="notice.do">공지사항</a></li>
			<li><a href="boardList.qna">질문과답변</a></li>
			<li><a href="boardListPage.qna">paging 질문과답변</a></li>
		</ul>
	</div>
</header>













