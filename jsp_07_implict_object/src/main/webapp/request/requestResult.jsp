<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
	<!-- 스크립틀릿 태그 -->
	<%
	// 요청 시 호출되는 _jspService method내부에 작성

	// request로 전달된 data를 처리할 문자셋 정보 확인
	String encoding = request.getCharacterEncoding();
	// 응답 객체를 통해서 출력할 스트림 정보를 저장한 내장 객체
	out.println("encoding : " + encoding + "<br/>");

	// 요청 시 전달된 파라미터 값 확인
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] habbies = request.getParameterValues("habbies");

	if (gender != null) {
		gender = (gender.equals("male")) ? "남성" : "여성";
	}

	out.println("name : " + name + "<br/>");
	out.println("gender : " + gender + "<br/>");
	out.println("habbies : " + Arrays.toString(habbies) + "<br/>");

	// 요청한 클라이언트 원격지 아이피 주소
	String ip = request.getRemoteAddr();
	out.println("ip : " + ip + "<br/>");

	// 요청이 전달된 사용자의 요청 전송 방식
	String method = request.getMethod();
	out.println("요청 전송 방식 " + method + "<br/>");

	// contextPath
	// WAS(Web Application Server)에서
	// wepApp을 구분하기 위한 경로
	String contextPath = request.getContextPath();
	out.println("contextPath : " + contextPath + "<br/>");

	// 요청 경로 - 현재 서버의 프로젝트별 전체 요청 경로
	String requestURI = request.getRequestURI();
	out.println("requestURI : " + requestURI + "<br/>");

	String str = "text";
	str += " append";
	str += " result";

	// 전체 요청 경로 - URL
	StringBuffer requestURL = request.getRequestURL();
	out.println("requestURL : " + requestURL + "<br/>");

	// get 방식으로 전달된 파라미터 정보
	String queryString = request.getQueryString();
	out.println("queryString : " + queryString + "<br/>");

	// 요청시 전달된 contentType
	String contentType = request.getContentType();
	out.println("contentType : " + contentType + "<br/>");
	%>
</body>
</html>