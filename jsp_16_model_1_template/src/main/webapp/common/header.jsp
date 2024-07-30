<%@page import="javax.naming.*, javax.sql.*, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<%-- 
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			out.println(c.getName()+":"+c.getValue() +"<br/>");
			if(c.getName().equals("u_id")){
				String u_id = c.getValue();
				
				InitialContext init = new InitialContext();
				DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(
					"SELECT * FROM digital_member WHERE u_id = ?"
				);
				pstmt.setString(1, u_id);
				
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					vo.MemberVO member = new vo.MemberVO();
					member.setU_no(rs.getInt("u_no"));
					member.setU_id(rs.getString("u_id"));
					member.setU_pw(rs.getString("u_pw"));
					member.setU_name(rs.getString("u_name"));
					member.setU_profile(rs.getString("u_profile"));
					member.setU_birth(rs.getString("u_birth"));
					member.setU_addr_post(rs.getString("u_addr_post"));
					member.setU_addr(rs.getString("u_addr"));
					member.setU_addr_detail(rs.getString("u_addr_detail"));
					member.setU_phone(rs.getString("u_phone"));
					member.setU_withdraw(rs.getString("u_withdraw"));
					member.setU_date(rs.getTimestamp("u_date"));
					member.setU_visit_date(rs.getTimestamp("u_visit_date"));
					member.setU_point(rs.getInt("u_point"));
					// session 에 추가
					session.setAttribute("member", member);
				}
			} // check u_id cookie
		} // end for cookies
	}
%>
 --%>
<%--  
${cookie.u_id}
${cookie.u_asfadfasd}  
 --%>
 <!-- cookie 목록 중에 name 이 u_id 인 쿠키가 존재 할때 -->
 <c:if test="${!empty cookie.u_id and empty sessionScope.member}">
 	<s:query var="rs" dataSource="jdbc/MySQLDB">
 		SELECT * FROM digital_member WHERE u_id = ?
 		<s:param>${cookie.u_id.value}</s:param>
 	</s:query>
 	<c:if test="${rs.rowCount > 0}">
 		<jsp:useBean id="member" class="vo.MemberVO" scope="session"/>
 		<c:forEach var="columnName" items="${rs.columnNames}">
 			<c:set target="${member}" property="${columnName}" value="${rs.rows[0][columnName]}"/>
 		</c:forEach>
 	</c:if>
 </c:if>
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
				<c:choose>
					<c:when test="${!empty member}">
						<li>
							<c:if test="${!empty member.u_profile}">
								<img width="30" src="${path}/member/profileImage.jsp?fileName=${member.u_profile}" alt="사람 프로필 이미지"/>
							</c:if>
							${member.u_name} 님 방가.
						</li>
						<li><a href="${path}/member/logOut.jsp">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="<c:url value='/member/login.jsp'/>">로그인</a></li>
						<li><a href="<c:url value='/member/join.jsp'/>">회원가입</a></li>
					</c:otherwise>
				</c:choose>
				
				<li><a href="${path}/googleMailTest.jsp">구글메일테스트</a></li>
			</ul>
		</div>
		<div>
			<ul>
				<li><a href="${context}/board/notice/notice_list.jsp">공지사항</a></li>
				<li><a href="${context}/board/qna/qna_list.jsp">질문과답변</a></li>
				<li><a href="${path}/javascript_ajax.jsp">AJAX</a></li>
				<li><a href="${path}/sms.jsp">cool sms</a></li>
			</ul>
		</div>
	</header>
	
	
	
	
	
	
	
	