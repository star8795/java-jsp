<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/header.jsp"/>
<section>
	<table class="list">
		<tr>
			<th colspan="2">
				<h1>${board.getQnaNum()}번 게시글 상세보기</h1>
			</th>
		</tr>
		<tr>
			<th>제목</th>
			<td>${board.qnaTitle}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols=40 rows=20>${board.qnaContent}</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<c:if test="${!empty member}">
					<a href="boardReply.qna?qnaNum=${board.qnaNum}">[답변글]</a>
					<c:if test="${board.qnaWriterNum eq member.num}">
						<a href="boardUpdateForm.qna?qnaNum=${board.qnaNum}">[수정]</a>
						<a href="boardDelete.qna?qnaNum=${board.qnaNum}">[삭제]</a>
					</c:if>
					
				</c:if>
				<a href="boardList.qna">[목록]</a>
			</td>
		</tr>
	</table>
</section>
<jsp:include page="/common/footer.jsp"/>