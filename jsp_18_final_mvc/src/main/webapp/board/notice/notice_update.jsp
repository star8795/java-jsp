<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../common/header.jsp"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="static/js/service/HuskyEZCreator.js"></script>
<section>
	
	<form action="noticeUpdate.do" method="post">
		<input type="hidden" name="notice_num" value="${notice.notice_num}"/>
		<input type="hidden" name="notice_author" value="${member.name}"/>
		<table class="list">
			<tr>
				<th colspan="2"><h1>공지사항 수정</h1></th>
			</tr>
			<tr>
				<td>카테고리</td>
				<td style="text-align:left;padding:10px;">
					<select name="notice_category">
						<option value="${notice.notice_category}" selected>${notice.notice_category}</option>
						<option value="공지">공지</option>
						<option value="알림">알림</option>
						<option value="이벤트">이벤트</option>
						<option value="당첨">당첨</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td style="text-align:left;padding:10px;"><input type="text" name="notice_title" value="${notice.notice_title}"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td style="width:700px;">
					<textarea name="notice_content" id="editor">${notice.notice_content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="작성완료"/>
				</td>
			</tr>
		</table>
	</form>	
</section>
<script>
	$(document).ready(function() {
		var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함. 
		// Editor Setting 
		nhn.husky.EZCreator.createInIFrame({ 
			oAppRef : oEditors, 
			// 전역변수 명과 동일해야 함. 
			elPlaceHolder : "editor", 
			// 에디터가 그려질 textarea ID 값과 동일 해야 함. 
			sSkinURI : "static/SmartEditor2Skin.html", 
			// Editor HTML 
			fCreator : "createSEditor2", 
			// SE2BasicCreator.js 메소드명이니 변경 금지 X 
			htParams : { 
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseToolbar : true, 
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : false, 
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : true
			} 
		}); // 전송버튼 클릭이벤트 
		$("#savebutton").click(function(){ 
			//
			if(confirm("저장하시겠습니까?")) { 
				// id가 smarteditor인 textarea에 에디터에서 대입 
				oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
				// 이부분에 에디터 validation 검증 
				//if(validation()) { 
					$("#frm").submit(); 
				//} 
			} 
		}); 
	}); 
</script>
<jsp:include page="../../common/footer.jsp"/>