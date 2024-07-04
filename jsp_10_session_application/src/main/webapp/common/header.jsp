<%@ page import="java.util.*"%>
<%@ page import="vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- header.jsp -->
<%
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");

	// 로그인된 정보가 없는 사용자 일 경우
	if(loginMember == null){
		
		// 브라우저에서 전달된 쿠키 목록 확인
		Cookie[] cookies = request.getCookies();
		
		// 쿠키에 등록된 자동로그인용 uid 값을 저장할 변수
		String cookieUid = null;
		if(cookies != null){
			// 쿠키 정보가 존재할 때 로그인 상태 유지용 쿠키가 존재하는지 확인
			for(Cookie c : cookies){
				if(c.getName().equals("uid")){
					cookieUid = c.getValue();
					break;
				}
			}
		}
		// 로그인 정보 저장용 쿠키 정보 확인
		
		if(cookieUid != null){
			// cookie uid 존재
			System.out.println("cookieUid : "+cookieUid);
			// aWQwMDE= => 복호화
			// cookieUid 에 저장된 문자열을 복화화해서 저장한 byte[] 반환
			byte[] decodedUid = Base64.getDecoder().decode(cookieUid.getBytes());		
			// 디코딩된 바이트 배열로 문자열 생성
			cookieUid = new String(decodedUid);
			System.out.println("decodedUid : "+cookieUid);
			
			// 회원 목록에서 일치하는 uid값을 가진 사용자 정보 검색
			List<MemberVO> memberList = (List<MemberVO>)application.getAttribute("memberList");
			if(memberList != null){
				for(MemberVO m : memberList){
					// 회원목록에 등록된 사용자 중에 
					// 쿠키에 등록된 uid와 일치하는 uid를 저장한 사용자 정보 검색
					if(m.getUid().equals(cookieUid)){
						loginMember = m;
						session.setAttribute("loginMember", loginMember);
						break;
					}
				}
			} // memberList가 존재할때
			
		}// cookieUid 가 존재 할때
		
	}// end check loginMemebr
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scope Project</title>
</head>
<body>
	<header>
		<a href="main.jsp">MAIN PAGE</a> | 
<% if(loginMember == null){ %>
		<a href="join.jsp">JOIN PAGE</a> | 
		<a href="login.jsp">LOGIN PAGE</a>
<%}else{ %>
	<%= loginMember.getUname() %> 님 반갑습니다. | 
	<a href="logOut.jsp">로그아웃</a>
<%}%>
		 
		<hr/>
	</header>
<!-- request msg 정보 확인 -->
<%
	String msg = (String)request.getAttribute("msg");
	if(msg != null){
%>
	<!-- msg 가 != null 일대 실행 -->
	<script>
		alert('<%=msg%>');	
	</script>
<%
	}
%>