<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/header.jsp"/>
<section>
	
	<form action="boardWriteSubmit.qna" method="POST">
		<!-- 로그인된 사용자 == 게시글 작성자  의 회원 번호 파라미터로 전달 -->
		<input type="hidden" name="qna_writer_num" value="${member.num}"/>
		<table>
			<tr>
				<th colspan="2"><h1>글작성</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${member.name}</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>
					<input type="text" name="qna_title" required/>
				</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea name="qna_content" cols="50" rows="15" required></textarea>
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




