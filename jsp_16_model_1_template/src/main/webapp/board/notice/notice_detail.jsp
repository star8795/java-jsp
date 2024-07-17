<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../common/header.jsp" />
<section>
	<table>
		<tr>
			<th colspan="2"><h1>공지</h1></th>
		</tr>
		<tr>
			<td>작성자</td>
			<td></td>
		</tr>
		<tr>
			<td>제목</td>
			<td></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<div style="width: 600px; min-height: 300px;"></div>
			</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td></td>
		</tr>
		<c:if test="">
			<tr>
				<td colspan=2>
					<a href="">수정</a> | 
					<a href="">삭제</a>
				</td>
			</tr>
		</c:if>
	</table>
</section>
<jsp:include page="../../common/footer.jsp" />