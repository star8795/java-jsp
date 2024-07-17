<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qna_reply.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<jsp:include page="../../common/header.jsp" />
<%@ include file="qna_select.jsp" %>
<section class="wrap">
	<form action="qna_reply_submit.jsp" method="POST">
		<input type="hidden" name="qna_writer_num" value="${member.u_num}"/>
		
		<input type="hidden" name="qna_re_ref" value="${qna.qna_re_ref}"/>
		<input type="hidden" name="qna_re_lev" value="${qna.qna_re_lev}"/>
		<input type="hidden" name="qna_re_seq" value="${qna.qna_re_seq}"/>
		
		<table>
			<tr>
				<th colspan="2">
					${qna.qna_num} - 글 답변 작성
				</th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="qna_name" required/>
				</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>
					<input type="text" name="qna_title" required />
				</td>
			</tr>
			<tr>
				<td>
					글 내용
				</td>
				<td>
					<textarea name="qna_content" cols="50" rows="10" required></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성완료"/> 
					<input type="reset" value="새로작성"/>
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../../common/footer.jsp" />