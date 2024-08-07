<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- /board/qna/qna_list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/header.jsp"/>
<section>
	<table class="list">
		<tr>
			<th colspan="5">
				<h1>질문과 답변 목록</h1>
			</th>
		</tr>
		<c:if test="${!empty member}">
			<tr>
				<th colspan="5">
					<a href="boardWrite.qna">질문 작성하러 가기</a>
				</th>
			</tr>
		</c:if>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
			<th>Ref</th>
		</tr>
		<c:choose>
			<c:when test="${!empty boardList}">
				<!-- 등록된 게시글 목록 출력 boardList -->
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.qnaNum}</td>
						<td>
							<a href="boardDetail.qna?qnaNum=${board.qnaNum}">${board.qnaTitle}</a>
						</td>
						<td>${board.qnaName}</td>
						<td>${board.qnaDate}</td>
						<td>${board.qnaReadCount}</td>
						<td>${board.qnaReRef}</td>
					</tr>
				</c:forEach>
				<!-- 페이징 블럭 -->
				
			</c:when>
			<c:otherwise>
				<tr>
					<th colspan="5">등록된 게시물이 없습니다.</th>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</section>
<jsp:include page="/common/footer.jsp"/>









