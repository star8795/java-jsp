<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<jsp:include page="../../common/header.jsp" />
<!-- 페이징 정보 처리 -->
<section>
	<table class="list">
		<tr>
			<th colspan="4">
				<h1>공지사항</h1>
			</th>
		</tr>
		<tr>
			<td colspan="4">
				<form name="searchForm" action="notice_list.jsp" method="GET">
					<select name="searchType">
						<option value="author">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> 
					<input type="text" autofocus name="searchValue" style="width:30%"/> 
					<input type="submit" value="검색" />
					<select name="perPageNum" onchange="searchForm.submit();">
						<c:forEach var="i" begin="10" end="25" step="5">
							<option value="${i}" ${param.perPageNum eq i ? 'selected' : ''}>${i}개씩 보기</option>	
						</c:forEach>
					</select>
				</form>
				<a href="notice_write.jsp">글 작성하러 가기</a>
			</td>
		</tr>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<!-- 공지글 목록 출력 -->
	</table>
</section>
<jsp:include page="../../common/footer.jsp" />

















