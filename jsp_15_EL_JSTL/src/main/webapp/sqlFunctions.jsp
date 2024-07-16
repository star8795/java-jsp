<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="test" value="Hello, Java Server Page!"/>
	EL test : ${test} <br/>
	toUpperCase : ${fn:toUpperCase(test)} <br/>
	toLowerCase : ${fn:toLowerCase(test)} <br/>
	<c:set var="img" value="image/png" /> <!-- MIME type, Content type, Media Type -->
	<c:if test="${fn:startsWith(img, 'image')}">
		이미지 파일입니다. <br/>
	</c:if>
	
	<c:set var="text" value="readme.txt"/>
	<c:choose>
		<c:when test="${fn:endsWith(text, 'txt')}">
			텍스트 파일입니다. <br/>
		</c:when>
		<c:otherwise>
			텍스트 파일 아입니더. <br/>
		</c:otherwise>
	</c:choose>
	
	<%-- <c:set var="test" value="Hello, Java Server Page!"/> --%>
	contains : ${fn:contains(test, 'java')} <br/>
	containsIgnoreCase : ${fn:containsIgnoreCase(test, 'java')} <br/>
	<hr/>
	indexOf : ${fn:indexOf(test, 'java')} <br/>
	substringBefore : ${fn:substringBefore(test, 'Java')} <br/>
	substringAfter : ${fn:substringAfter(test, 'Java')} <br/>
	<!-- substring(잘라낼 문자열, 시작인덱스, 마지막인덱스(-1)) -->
	substring : ${fn:substring(test, fn:indexOf(test, 'Java'), 11)} <br/>
	<hr/>
	<c:set var="strs" value="${fn:split(test, ' ')}"/>
	strs 배열의 길이 : ${fn:length(strs)} <br/>
	<c:forEach var="str" items="${strs}">
		${str}
	</c:forEach>
	<br/>
	${fn:join(strs,'|')} <br/>
	<hr/>
	<div style='border:1px solid red'>안녕하세요! 배고프죠?!</div>
	<c:set var="tag" value="<div style='border:1px solid red'>안녕하세요! 배고프죠?!</div>"/>
	${tag} <hr/><br/>
	escapeXml : ${fn:escapeXml(tag)} <br/>
	<hr/>
	${fn:replace(tag, '<', '&lt;')} <br/>
	
	
	&lt;div style='border:1px solid red'>안녕하세요! 배고프죠?!&lt;/div>
	
</body>
</html>