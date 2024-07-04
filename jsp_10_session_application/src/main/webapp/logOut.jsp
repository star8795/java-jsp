<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	session.removeAttribute("loginMember");
	// session.invalidate();
	
	// 로그아웃 요청 시 pc 브라우저에 저장된 
	// 자동로그인용 쿠키 정보 제거
	Cookie cookie = new Cookie("uid","김동하");
	cookie.setPath("/");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
<script>
	alert("로그아웃 완료");
	location.href='main.jsp';
</script>