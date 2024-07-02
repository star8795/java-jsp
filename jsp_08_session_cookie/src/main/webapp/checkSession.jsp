<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkSession.jsp</title>
</head>
<body>
	<%@ include file="check.jsp"%>
	<h1>Session Check</h1>

	<%
	// tomcat server  설정 기본 session 유지 시간 : 1800s - 30분
	// project web.xml 에 설정된 session 유지시간 : 600s - 10분

	// 해당 session 만 유지 시간을 60s로 지정
	// session.setMaxInactiveInterval(60);

	// 해당 session 객체의 최대 유지 시간 - 초단위
	int max = session.getMaxInactiveInterval();
	out.println("max inactive : " + max + "<br/>");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	// session 객체 가 생성된 시간을 millis로 반환
	long create = session.getCreationTime();
	String time = sdf.format(create);
	out.println("현재 session 생성 시간 : " + time + "<br/>");

	// 현재 session으로 들어온 클라이언트의 마지막 요청 시간 - millis 
	long last = session.getLastAccessedTime();
	time = sdf.format(last);
	out.println("현재 session 마지막 요청 시간 : " + time + "<br/>");

	String uid = (String) session.getAttribute("uid");
	out.println("session 속성에 저장된 uid : " + uid + "<br/>");

	// 해당 세션 객체에 등록된 속성값들 중에
	// name이 uid인 속성 개체
	session.removeAttribute("uid");

	// session 무효화
	session.invalidate();
	%>
	<a href="index.jsp">메인으로</a>
</body>
</html>