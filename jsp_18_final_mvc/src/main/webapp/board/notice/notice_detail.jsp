<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../../common/header.jsp"/>
	<section>
		
		<table class="list">
			<tr>
				<th colspan="2"><h1>공지</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${notice.notice_author}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${notice.notice_title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<div style="width:600px;min-height:300px;">${notice.notice_content}</div>
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${notice.notice_date}</td>
			</tr>
			<c:if test="${sessionScope.member.id eq 'admin'}">
				<tr>
					<td colspan=2>
						<a href="noticeUpdateForm.do?notice_num=${notice.notice_num}">수정</a>
						<a href="noticeDelete.do?notice_num=${notice.notice_num}">삭제</a>
					</td>
				</tr>
			</c:if>
		</table>	
	</section>
	<jsp:include page="../../common/footer.jsp"/>
	
	
	
	
	