<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, vo.MemberVO" %>
<!-- loginCheck.jsp -->
<%
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	
	String rememberMe = request.getParameter("rememberMe");
	
	List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
	if(memberList == null){
%>		
<!-- memberList가 null 일때 실행되는 HTML 영역 -->
<script>
	alert("등록된 회원 정보가 없습니다. 회원가입부터...");
	location.href='join.jsp';
</script>
<%
		return; // service method 종료
	}
	
	// memberList가 존재
	// 로그인 요청한 uid와 upw 정보로 등록된 회원 정보 비교
	
	MemberVO loginMember = null; // 로그인 성공한 회원 정보를 저장할 변수
	for(MemberVO m : memberList){
		// 아이디와 비밀번호가 둘다 일치하는 회원 검색
		if(uid.equals(m.getUid()) && upw.equals(m.getUpw())){
			loginMember = m;
			break;
		}
	} // end for
	
	if(loginMember == null){
		// 일치하는 사용자 정보가 존재하지않음 - 로그인 실패
		out.println("<script>");
		out.println("alert('로그인 실패');");
		out.println("history.go(-1);");  // 이전 페이지로 이동
		out.println("</script>");
	}else{
		// 일치하는 사용자 정보가 존재 - 로그인 성공
		session.setAttribute("loginMember",loginMember);
		
		// 자동로그인 - 로그인 정보 저장 요청 처리
		if(rememberMe != null){ // 자동로그인 체크박스 체크
			
			byte[] bytes = uid.getBytes(); // 문자열을 byte[] 로 반환
			// byte[]로 변환된 문자열을  64바이트의 새로운 방식의 byte[]로 반환
			byte[] encodedUid = java.util.Base64.getEncoder().encode(bytes);
			System.out.println("uid : " + uid);
			// byte[] 에 저장된 data를 이용하여 문자열 생성
			uid = new String(encodedUid);
			System.out.println("encodedUid : " + uid);
			
			// 인증 완료된 사용자의 uid 값을 사용자 PC 브라우저 Cookie로 저장
			Cookie cookie = new Cookie("uid", uid);
			cookie.setMaxAge(60*60*24*15); // 초단위 seconds
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		
		// welcome page로 이동
		// /jsp_10_session_application/
		// response.sendRedirect(request.getContextPath());
		response.sendRedirect("/jsp_10_session_application/");
	}
	
	
%>