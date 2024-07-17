<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/common/header.jsp" />
<style>
	/* 전체 테이블 */
	table{
		max-width:500px;
		margin:0 auto;
	}
	
	/* 프로필 이미지 사진 미리보기 이미지 */
	.uploadImage{
		width:100px;
		height:100px;
		border-radius:50px;
		border:1px solid #ccc;
	}
	
	#emailCodeWrap, #acceptEmail, #codeWrap{
		display:none;
	}
</style>
<section class="wrap">
<form id="joinForm" 
	  action="<c:url value='/member/joinCheck.jsp'/>" 
	  method="post"  
	  enctype="multipart/form-data">
	<table class="join">
		<tr>
			<th colspan="2"><h1>JOIN PAGE</h1></th>
		</tr>
		<tr>
			<td>프로필 이미지</td>
			<td align="center">
				<img src="${path}/resources/img/profile.jpg" 
					 id="uploadImage" class="uploadImage"/> <br/>
				<input type="file" id="profileImage" name="profileImage" accept="image/*"/>
			</td>
		</tr>
		<tr>
			<td>아이디(e-mail)</td>
			<td>
				<input type="text" name="u_id" id="u_id" autocomplete="off" />
				<button type="button" id="acceptEmail">이메일 인증</button>
				<!-- 검증 결과를 출력할 박스모델 -->
				<div class="result"></div>
				<div id="emailCodeWrap">
					<input type="text" id="emailCode" />
					<button type="button" id="emailAcceptBtn">인증완료</button>
				</div>
			</td>
		</tr>
		<!-- 비밀번호 -->
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="u_pw" id="u_pw" />
				<div class="result"></div>
			</td>
		</tr>
		<!-- 비밀번호 확인-->
		<tr>
			<td>비밀번호 확인</td>
			<td>
				<input type="password" name="re_pw" id="re_pw" />
				<div class="result"></div>
			</td>
		</tr>
		<!-- 이름 -->
		<tr>
			<td>이름(한글2~6자이내)</td>
			<td>
				<input type="text" name="u_name" id="u_name" />
				<div class="result"></div>
			</td>
		</tr>
		<!-- 생년월일 -->
		<tr>
			<td>생년월일(ex-19950505)</td>
			<td>
				<input type="text" name="u_birth" id="u_birth" />
				<div class="result"></div>
			</td>
		</tr>
		<!-- 주소 -->
		<tr>
			<td>주소</td>
			<td>
				<div>
					<input type="text" readonly name="u_post" id="u_post" class="addr" placeholder="우편번호"/>
					<input type="button" value="주소찾기" />
				</div>
				<input type="text" readonly name="u_addr" id="u_addr" class="addr" placeholder="주소"/>
				<input type="text" name="u_addr_detail" id="u_addr_detail" class="addr" placeholder="상세주소"/>
			</td>
		</tr>
		<!-- 전화번호 -->
		<tr>
			<td>전화번호(-제외 숫자만입력)</td>
			<td>
				<div id="phoneWrap">
					<input type="text" name="u_phone" id="u_phone" />
					<div class="result"></div>
				</div>
			</td>
		</tr>
		<!-- 개인정보처리방침 -->
		<!-- https://www.privacy.go.kr -->
		<tr>
			<td colspan="2">
				<h4>개인정보처리방침</h4>
				<textarea readonly cols=50 rows=5>당신의 개인정보는 언제든지 회사에서 팔아먹을 수 있으며 3자에게 항상 양도 됩니다. 그래도 이용하시겠습니까?</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>
					<input type="checkbox" name="u_info" id="u_info" value="y"/>
					개인정보 이용 동의
				</label>
				<div class="result"></div>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" id="joinBtn" value="회원가입"/>
			</th>
		</tr>
	</table>
</form>
</section>
<script>
	var boolUid = false;	// u_id 검증 완료 여부를 저장할 변수
	
	// 이메일 정규 표현식
	var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;       // 이메일
	document.querySelector("#u_id").onkeydown = function(){
		let tempVal = this.value;
		console.log(tempVal);
		
		let elP = this.parentNode.querySelector('.result');
		
		// 정규 표현식과 동일한 패턴의 문자열이면 true, 아니면 false
		if(regexEmail.test(tempVal)){
			elP.innerHTML = "<span style='color:green'>올바른 이메일 형식입니다.</span>";
			console.log("일치합니다.");
			location.href="checkId.jsp?u_id="+tempVal;
		}else{
			elP.innerHTML = "<span style='color:red'>사용할 수 없습니다.</span>";
			console.log("일치하지 않습니다.");
		}
	};
</script>
<jsp:include page="/common/footer.jsp" />





