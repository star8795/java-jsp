<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- loginCheck.jsp -->
<!--
	 로그인 요청 처리 
	 로그인 성공한 회원의 정보를 member 를 키값으로 저장
-->
<jsp:useBean id="member" class="vo.MemberVO" scope="session" />

<!-- datbase 에서 u_id , u_pw 컬럼의 값이 일치하는 사용자 정보 검색 -->
<c:catch var="e">
	<s:query var="rs" dataSource="jdbc/MySQLDB">
		SELECT * FROM digital_member 
		WHERE u_id = ? AND u_pw = ?
		<s:param>${param.u_id}</s:param>
		<s:param>${param.u_pass}</s:param>
	</s:query>
	
	<c:choose>
		<c:when test="${rs.rowCount == 1}">
			<!-- 일치하는 사용자 정보 검색 -->
			<!-- rs.columnNames  테이블의 컬럼 이름 목록 -->
			<c:forEach var="columnName" items="${rs.columnNames}">
				<c:set target="${member}" property="${columnName}" value="${rs.rows[0][columnName]}"/>
			</c:forEach>
			<%-- 
			<c:set target="${member}" property="u_id" value="${rs.rows[0].u_id}"/>
			 --%>
			 <%-- ${member} --%>
			 <!-- 로그인 성공 시 session에 member 정보 추가 후 자동로그인 체크박스 확인 -->
			 <c:if test="${!empty param.login}">
			 	<!-- 사용자가 로그인 상태 유지 요청 -->
			 	<%
			 		// response 객체를 통해서 사용자 브라우저에 쿠키 정보 등록
			 		Cookie cookie = new Cookie("u_id", member.getU_id());
			 		cookie.setPath("/");
			 		cookie.setMaxAge(60*60*24*7);  //seconds
			 		response.addCookie(cookie);
			 	%>
			 </c:if>
			 <script>
			 	alert('${member.u_id} : 로그인 성공');
			 	location.href='${path}'; // 메인으로 이동
			 </script>
		</c:when>
		<c:otherwise>
			<!-- 일치하는 사용자 정보가 존재하지 않음 -->
			<script>
				alert('로그인 실패');
				history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>
</c:catch> 

<c:if test="${!empty e}">
	${e.printStackTrace()} 
	<script>
		alert('로그인 실패 - ${e.getMessage()}');
		history.back();
	</script>
</c:if>





















