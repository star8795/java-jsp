<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/common/header.jsp" />
<section class="wrap">
<table class="info">
	<tr>
		<td>회원번호</td>
		<td>${member.u_num}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${member.u_id}</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${member.u_name}</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>${member.u_age}</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<c:choose>
				<c:when test="${member.u_gender eq 'male'}">
					남성
				</c:when>
				<c:otherwise>
					여성
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td>회원등록일</td>
		<td>
			<fmt:formatDate value="${member.u_regdate}" pattern="yyyy-MM-dd hh:mm:ss"/>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<c:url value="/index.jsp" var="index"/>
			<input type="button" onclick="location.href='${index}';" value="메인" /> | 
			<input type="button" onclick="withdraw();" value="회원탈퇴" />
		</td>
	</tr>
</table>

<script>
	function withdraw() {
		if ('${member.u_id}' == 'admin') {
			alert('관리자 계정은 삭제할 수 없습니다.');
			return;
		}

		if (confirm('정말로 탈퇴 하시겠습니까?')) {
			location.href = '<c:url value="/member/withdraw.jsp"/>?u_id='+ u_id;
		}
	}
</script>
</section>
<jsp:include page="/common/footer.jsp" />

