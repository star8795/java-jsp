<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp"%>
<div class="container">
	<section>
	<form action="notice_write_submit.nb" method="post">
		<div>
			<h1>게시글 작성</h1>
		</div>
		<div class="row m-5">
			<div class="col-md-2">
				<label class="form-control-plaintext">카테고리</label>
			</div>
			<div class="col-md-4">
				<select class="form-control" name="notice_category">
					<option value="공지" selected>공지</option>
					<option value="알림">알림</option>
					<option value="당첨">당첨</option>
					<option value="이벤트">이벤트</option>
				</select>
			</div>
			<div class="col-md-2">
				<span class="form-control-plaintext text-center">작성자</span>
			</div>
			<div class="col-md-4">
				<input class="form-control" name="notice_author" type="text" value="관리자" readonly/>
			</div>
		</div>
		<div class="row m-5">
			<div class="col-md-2">
				<span class="form-control-plaintext">제목</span>
			</div>
			<div class="col-md-10">
				<input class="form-control" name="notice_title" type="text" />
			</div>
		</div>
		
		<div class="row m-5">
			<div class="col-md-2">
				<span class="form-control-plaintext">내용</span>
			</div>
			<div class="col-md-10">
				<textarea name="notice_content" class="form-control" rows="10"></textarea>
			</div>
		</div>
		<div class="row m-5">
			<div class="col-md-12">
				<input type="submit" value="작성완료" class="form-control btn btn-primary"/>
			</div>
		</div>
	</form>
	</section>
</div>
<%@ include file="../common/footer.jsp"%>