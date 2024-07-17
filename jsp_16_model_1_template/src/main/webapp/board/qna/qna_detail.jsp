<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<!-- 조회 수 증가 -->
<jsp:include page="../../common/header.jsp" />
<!-- 게시글 상세보기 -->
<section class="wrap">
	<table class="list">
		<tr>
			<th colspan=2><h1>게시물 상세내용</h1></th>
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
			<td><textarea readonly cols=40 rows=10></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
			<c:if test="${!empty member}">
				<a href="">[답글]</a>
				<c:if test="${qna.qna_writer_num eq member.u_num}">
					<a href="">[수정]</a>
					<a href="">[삭제]</a>
				</c:if>
			</c:if> 
			<a href="qna_list.jsp">[목록]</a></td>
		</tr>
	</table>
</section>
<jsp:include page="../../common/footer.jsp" />