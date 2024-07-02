<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, vo.MemberVO"%>
<!-- 
	join parameter
	회원가입을 요청한 1명의 사용자 정보 
	uid | upw | uname 
-->
<%
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
String uname = request.getParameter("uname");

// 회원 가입 요청한 멤버 정보를 application 영역 객체에 저장
List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");

// 아직 등록된 회원 목록 리스트가 없음
if (memberList == null) {
	// 새로운 리스트 생성
	memberList = new ArrayList<>();
	// application 영역객체에 회원목록 정보를 저장할 list 추가
	application.setAttribute("memberList", memberList);
}

// 등록할 신규 회원 정보
MemberVO member = new MemberVO(uid, upw, uname);

// 회원 아이디 중복 체크

// 이미 사용중인 아이디 인지 여부를 저장할 변수
boolean isCheck = false;

for (MemberVO m : memberList) { // 등록된 회원 목록 순회
	if (m.getUid().equals(uid)) {
		// 이미 사용중인 아이디
		isCheck = true;
		break; // for 문 즉시 탈출
	}
} // 일치하는 아이디 검색 종료

String msg = "이미 사용중인 아이디입니다.";
String nextPage = "join.jsp";

if (!isCheck) {
	// 사용중인 아이디가 아닐 경우
	msg = "회원 가입 완료!";
	nextPage = "login.jsp";
	memberList.add(member); // 회원 정보 등록
}

request.setAttribute("msg", msg);
request.getRequestDispatcher(nextPage).forward(request, response);

System.out.println(memberList);
/* 
application.setAttribute("uid", uid);
application.setAttribute("upw", upw);
application.setAttribute("uname", uname);
 */
%>