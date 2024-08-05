<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../../common/header.jsp" />
<script src="resources/static/js/service/HuskyEZCreator.js"></script>
	<section>
		<form id="frm" action="noticeWrite.do" method="post">
		<input type="hidden" name="notice_author" value="${member.name}"/>
			<table class="list">
				<tr>
					<th colspan=2><h1>공지글 작성</h1></th>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${member.name}</td>
				</tr>
				<tr>
					<td>카테고리 </td>
					<td>
						<select name="notice_category">
							<option value="공지" selected>공지</option>
							<option value="알림">알림</option>
							<option value="이벤트">이벤트</option>
							<option value="당첨">당첨</option>		
					  </select>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="notice_title"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td style="width:710px;"><textarea style="width:700px;" name="notice_content" id="smarteditor"></textarea></td>
				</tr>
				<tr>
					<td colspan=2>
						<input type="submit" id="savebutton" value="작성완료"/>
					 	<input type="reset" value="초기화"/>
					 </td>
				</tr>
			 </table> 
		</form>
	</section>
<jsp:include page="../../common/footer.jsp" />




