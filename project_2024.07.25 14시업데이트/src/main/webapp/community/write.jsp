<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시물 작성 </title>
<style type="text/css">


.category {
    text-align: center; /* 내부 요소들을 가운데 정렬 */
}

.category > div {
	width:20%;
    display: inline-block; /* 인라인 블록 요소로 설정 */
    cursor: pointer;
    border: 1px solid gray;
    margin:0 10px;
    box-sizing: border-box;
    border-radius: 10px;
    font-weight: bold;
    line-height: 40px;
    margin-top: 10px;
}

footer>.category > div {
	width:20%;
    display: inline-block; /* 인라인 블록 요소로 설정 */
    cursor: pointer;
    border: 1px solid gray;
    margin:0 10px;
    box-sizing: border-box;
    border-radius: 10px;
    font-weight: bold;
    line-height: 60px;
    margin-top: 10px;
}
td input[type=text],textarea,select {
	outline: none;
	height: 20px;
	font-size: 14px; 
	width:90%;
}
</style>
</head>
<body>
	<%@ include file="../main/header.jsp" %>
	
	<div style="width: 80%; /*  border: 1px solid black;  */ margin: auto;">
		<h1 style="margin: 30px 0;">인기 카테고리</h1>
			<div class="category">
				<div>고객센터</div>
				<div>메인화면</div>
				<div>구현되지 않은 기능</div>
				<div>뭐로하지</div>
				<div>잠온다</div>
				<div>김동하</div>
				<div>타자</div>
				<div>개빠름</div>
			</div>
	</div>
	<div style="width: 60%; /*border: 1px solid black; */ margin:50px auto;">
		<h1>게시물 작성</h1>
		<form action="writeInput.jsp">
			<table style="width: 100%;">
				<tr>
					<td>
						<h4>카테고리*</h4>
					</td>
					<td>
						<select name="category" style="width: auto;">
						  <option value="category0">일반</option>
						  <option value="category1">복기</option>
						  <option value="category2">질문</option>				  
						  <option value="category3">퍼즐</option>
						  <option value="category4">정보</option>	
						  <option value="cateogry5">팁</option>	  
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<h4>제목*</h4>
					</td>
					<td>
						<input type="text" name="title"required/> 
					</td>
				</tr>
				<tr>
					<td>
						<h4>닉네임*</h4>
					</td>
					<td>
						<input type="text" name="nickname"required/> 
					</td>
				</tr>
				<tr>
					<td height="10px">
					</td>
					<td height="10px">
						<h6>닉네임 없을 경우 입력해주세요. 이 후 입력하신 닉네임으로 사용됩니다.</h6>
					</td>
				</tr>
				<tr>
					<td>
						<h4>유튜브 링크</h4>
					</td>
					<td>
						<input type="text" name="link"/> 
					</td>
				</tr>
				<tr>
					<td>
						<h4>내용*</h4>				
					</td>
					<td>
						<textarea name="main" cols="100" rows="15" style="min-height:500px; resize: none;"></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="작성(임시버튼)">
		</form>
		<table>
			<tr>
				<td>
					<h4>첨부파일</h4>
				</td>
				<td>
					<h4>'png', 'gif', 'jpg', 'jpeg' 파일만 업로드가 가능합니다.</h4>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
						<input type='file' name='e' multiple/>
					</form>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
						<input type='file' name='f' multiple/>
					</form>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
						<input type='file' name='g' multiple/>
					</form>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
						<input type='file' name='h' multiple/>
					</form>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
						<input type='file' name='i' multiple/>
					</form>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>			
					<button  onclick="history.back()">취소</button>	
					<button  onclick="">글쓰기</button>		
				</td>
			</tr>
		</table>
		<div class="footer">
			<div class="category">
				<div>고객센터</div>
				<div>메인화면</div>
				<div>구현되지 않은 기능</div>
				<div>뭐로하지</div>
				<div>잠온다</div>
				<div>김동하</div>
				<div>타자</div>
				<div>개빠름</div>
			</div>
		</div>
	</div>
	<%@ include file="../main/footer.jsp" %>
</body>
</html>