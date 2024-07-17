<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Member</title>
<c:url var="context" value="/"/>
<link href="${context}/css/header.css" rel="stylesheet" type="text/css" />
<link href="${context}/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${context}/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<div>
			<ul>
				<li><a href="<c:url value='/'/>">home</a></li>
				<li><a href="<c:url value='/member/login.jsp'/>">로그인</a></li>
				<li><a href="<c:url value='/member/join.jsp'/>">회원가입</a></li>
				<li><a href="googleMailTest.jsp">구글메일테스트</a></li>
			</ul>
		</div>
		<div>
			<ul>
				<li><a href="${context}/board/notice/notice_list.jsp">공지사항</a></li>
				<li><a href="${context}/board/qna/qna_list.jsp">질문과답변</a></li>
			</ul>
		</div>
	</header>
	
	
	
	
	
	
	
	