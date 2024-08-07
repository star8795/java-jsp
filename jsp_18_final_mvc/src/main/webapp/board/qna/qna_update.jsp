<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/header.jsp"/>
<section>
	<form action="boardUpdate.qna" method="POST">
		<!-- 로그인된 사용자 == 게시글 작성자  의 회원 번호 파라미터로 전달 -->
		<input type="hidden" name="qnaWriterNum" value="${member.num}"/>
		<input type="hidden" name="qnaNum" value="${board.qnaNum}"/>
		<table>
			<tr>
				<th colspan="2"><h1>게시글 수정</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${member.name}</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>
					<input type="text" name="qnaTitle" value="${board.qnaTitle}" required/>
				</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea name="qnaContent" cols="50" rows="15" required>${board.qnaContent}</textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="작성완료"/>
					<input type="reset" value="새로작성"/>		
				</th>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="/common/footer.jsp"/>




