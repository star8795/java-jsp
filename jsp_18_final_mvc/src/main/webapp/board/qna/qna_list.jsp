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
			<th>seq</th>
			<th>lev</th>
			<th>del</th>
		</tr>
		<c:choose>
			<c:when test="${!empty boardList}">
				<!-- 등록된 게시글 목록 출력 boardList -->
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.qnaNum}</td>
						<td>
							<!-- 답변글 표현 -->
							<c:if test="${board.qnaReLev != 0}">
								<c:forEach begin="1" end="${board.qnaReLev}">
									&nbsp;&nbsp;&nbsp;
								</c:forEach>
								└>
							</c:if>
							<c:choose>
								<c:when test="${board.qnaDelete eq 'n'}">
									<!-- 조회수 증가 후 상세보기 페이지로 이동 -->
									<a href="boardRead.qna?qnaNum=${board.qnaNum}">${board.qnaTitle}</a>
								</c:when>
								<c:otherwise>
									삭제된 게시글 입니다.
								</c:otherwise>
							</c:choose>
							
						</td>
						<td>${board.qnaName}</td>
						<td>${board.qnaDate}</td>
						<td>${board.qnaReadCount}</td>
						<td>${board.qnaReRef}</td>
						<td>${board.qnaReSeq}</td>
						<td>${board.qnaReLev}</td>
						<td>${board.qnaDelete}</td>
					</tr>
				</c:forEach>
				<!-- 페이징 블럭 -->
				<c:if test="${!empty pm}">
					<tr>
						<td colspan="9">
							<div class="pageWrap">
								<c:if test="${pm.cri.page ne 1}">
									<a href="?page=1">[처음]</a>
									<c:if test="${pm.prev}">
										<a href="?page=${pm.startPage - 1}">[이전]</a>
									</c:if>
								</c:if>
								<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
									<a href="?page=${i}">[${i}]</a>
								</c:forEach>
								<c:if test="${pm.endPage ne pm.maxPage}">
									<c:if test="${pm.next}">
										<a href="?page=${pm.endPage + 1}">[다음]</a>
									</c:if>
									<a href="?page=${pm.maxPage}">[마지막]</a>
								</c:if>
							</div>
						</td>
					</tr>
				</c:if>
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









