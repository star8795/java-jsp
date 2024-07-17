<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp" />
<section class="wrap">
	<form action="notice_write_submit.jsp" method="post">
		<table class="list">
			<tr>
				<th colspan=2><h1>공지글 작성</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${member.u_id}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="n_category" style="width:100%;">
						<option value="공지" selected>공지</option>
						<option value="알림">알림</option>
						<option value="이벤트">이벤트</option>
						<option value="당첨">당첨</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="n_title" autofocus required style="width:100%;"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td style="width: 710px;">
					<textarea style="width: 700px;height:100px;" name="n_content" required></textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="작성완료" />
					<input type="reset" value="초기화" />
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../../common/footer.jsp" />