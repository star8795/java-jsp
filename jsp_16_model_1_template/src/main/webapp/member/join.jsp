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
	
	var boolUid = false;		// u_id 검증 완료 여부를 저장할 변수
	
	// 이메일 정규 표현식
	var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;       // 이메일
	// "^([\\w-]+(?:\\.[\\w-]+)*)@((?:[\\w-]+\\.)*\\w[\\w-]{0,66})\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$";
	
	// 이메일 발송 버튼
	let acceptEmail = document.querySelector("#acceptEmail"); 
	// 이메일 코드 인증
	let emailCodeWrap = document.querySelector("#emailCodeWrap");
	
	document.querySelector("#u_id").onkeyup = function(){
		
		let tempVal = this.value;
		console.log(tempVal);
		
		let elP = this.parentNode.querySelector('.result');
		
		// 정규 표현식과 동일한 패턴의 문자열이면 true, 아니면 false
		if(regexEmail.test(tempVal)){
			elP.innerHTML = "<span style='color:green'>올바른 이메일 형식입니다.</span>";
			console.log("일치합니다.");
			// location.href="checkId.jsp?u_id="+tempVal;
			checkUidAjax(this, elP, tempVal);
		}else{
			elP.innerHTML = "<span style='color:red'>사용할 수 없습니다.</span>";
			console.log("일치하지 않습니다.");
			// 이메일 형식이 아닐 경우에 이메일 인증 버튼 숨김
			acceptEmail.style.display = "none";
		}
	};
	
	// checkUidAjax(u_id입력태그요소, 결과를 출력할 태그요소, 비교할 이메일 data)
	function checkUidAjax(input, elP, val){
		// AJAX 방식으로 서버에 ID 사용 가능 여부 요청
		fetch("checkId.jsp?u_id="+val)
		.then(response => response.json())
		.then(result => {
			console.log(result);
			let message  = result ? "사용가능한 아이디입니다." : "사용할 수 없는 아이디입니다.";
			showMessage(elP, message, result);
			if(result){
				// 사용가능한 아이디
				acceptEmail.style.display = "inline-block";
			}else{
				// 사용할 수 없는 아이디		
				acceptEmail.style.display = "none";
			}
		})
		.catch(error => console.log(error));
	} // end checkId
	
	// 검증 결과 출력 함수
	// showMessage(메세지 출력할 요소,"출력할 메세지", 가능 여부)
	function showMessage(elp,msg,isCheck){
		let color = isCheck ? "color:green;" : "color:red";
		let html = "<span style='font-size:12px;"+color+"'>";
		html += msg;
		html +="</span>";
		elp.innerHTML = html;
	}
	
	// 메일발송 이벤트 처리
	let emailCode = ''; // 발송된 인증 코드 저장
	
	acceptEmail.onclick = function(){
		// 메일 발송 요청 시 - 메일 발송 버튼 비활성 화
		this.setAttribute("disabled","disabled");
		
		let u_id = document.querySelector("#u_id");
		fetch("sendMail.jsp",{ 
			method : "POST",
			// 수신자 이메일 : 인증 받을 이메일 주소를 파라미터로 전달
			body : new URLSearchParams({u_id : u_id.value})
		})
		.then(res => res.json())
		.then(result => { 
			console.log(result);
			// 발신한 코드 정보 저장
			emailCode = result;
			// 메일 인증 코드 발송 완료
			alert('이메일 인증 코드 발송 완료! 이메일을 확인해주세요!');
			emailCodeWrap.style.display = "block";
		})
		.catch(error => console.log(error));
	}
	
	// 인증코드 확인 버튼 이벤트 처리
	document.querySelector("#emailAcceptBtn").onclick = function(){
		let userCode = document.querySelector("#emailCode").value;
		let message = "";
		if(emailCode == userCode){
			// 인증 코드 일치
			alert("이메일 인증이 완료되었습니다.");
			message = "이메일 인증 완료";
			boolUid = true;
			// 이메일 발송 버튼  disabled 속성 제거
			acceptEmail.removeAttribute("disabled");
			acceptEmail.style.display = "none";
			emailCodeWrap.style.display = "none";
		}else{
			message = "인증 코드를 다시 확인해 주세요.";
			boolUid = false;
		}
		
		// 결과 메세지 출력
		let elP = acceptEmail.parentNode.querySelector(".result");
		showMessage(elP, message, boolUid);
	}; // end 인증 코드 확인
	
	// 비밀번호 체크 
	let boolPassword = false;
	let u_pw = document.querySelector("#u_pw");
	let re_pw = document.querySelector("#re_pw");
	
	// 특수문자 포함 비밀번호
	var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;	
	
	u_pw.onkeyup = function(){
		let val = this.value;
		let elP = this.nextElementSibling;
		let message = "";
		// 비밀번호 정규 표현식과 일치하는 지 확인
		boolPassword = regexPass.test(val);
		
		if(boolPassword){
			message = "사용가능한 비밀번호입니다.";
		}else{
			message = "특수문자 포함 영문/숫자 조합 8~16자이내 작성";
		}
		showMessage(elP, message, boolPassword);
	};
	
	var boolPassCheck = false;
	
	re_pw.onkeyup = function(){
		let val = this.value;
		let originalPass = u_pw.value;
		
		let elP = this.nextElementSibling;
		let message = "비밀번호가 일치하지 않습니다.";
		// 비밀번호 작성란의 형식에 맞게끔 작성을 했는지 여부 확인
		if(boolPassword){
			if(val == originalPass){
				boolPassCheck = true;
				message = "비밀번호가 일치합니다.";
			}
		}else{
			boolPassCheck = false;
			message = "비밀번호를 먼저 확인해 주세요.";
		}
		showMessage(elP,message, boolPassCheck);
	};
	
	// 생년월일 작성란 체크
	var boolBirth = false;
	
	let birth = document.querySelector("#u_birth");
	
	var regexBirth = /^[0-9]{4}[0-9]{2}[0-9]{2}$/;
	
	birth.onkeyup = function(){
		let tempVal = this.value;
		let message = "20020505 년월일 형식으로 작성";
		if(regexBirth.test(tempVal)){
			boolBirth = true;
			message = "사용가능합니다.";
		}else{
			boolBirth = false;
		}
		let elP = this.nextElementSibling;
		// 사용가능 여부에 따라 메세지 출력
		showMessage(elP,message,boolBirth);
	};
	
	// 이름 작성란 체크
	var boolName = false;
	let name = document.querySelector("#u_name");
	// 한글 2~6자 이내 가 - 힣
	var regexName = /^[\uac00-\ud7a3]{2,6}$/;								
	name.onkeyup = function(){
		let tempVal = this.value;
		let elP = this.nextElementSibling;
		let message = "2 ~ 6이내 한글로 작성";
		if(regexName.test(tempVal)){
			boolName = true;
			message = "사용가능한 이름";
		}else{
			boolName = false;
		}
		showMessage(elP, message , boolName);
	};
	
	
	// 전화 번호 체크
	var boolPhone = false;
	// mobile -표시 없이 숫자만
	var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;
	let phone = document.querySelector("#u_phone");
	phone.onkeyup = function(){
		// keyup 될때 정규표현식과 일치여부 체크
		let tempVal = this.value;
		let elP = this.nextElementSibling;
		let message = "- 제외 숫자만 입력";
		boolPhone = regexMobile.test(tempVal);
		if(boolPhone){
			message = "사용가능합니다.";
		}
		showMessage(elP,message,boolPhone);
	};
	
	// 회원 가입 버튼 클릭 시 각 요소의 입력값 검증 여부 확인 
	document.querySelector("#joinBtn").onclick = function(){
		
		if(!boolUid){
			alert("id(이메일)정보를 확인해주세요.");
			document.querySelector("#u_id").focus();
		}else if (!boolPassword){
			alert("비밀번호를 확인해주세요.");
			u_pw.focus();
		}else if(!boolPassCheck){
			alert("비밀번호가 일치하는지 확인해주세요.");
			re_pw.focus();
		}else if(!boolName){
			alert("이름을 정확하게 입력해주세요.");
			name.focus();
		}else if(!boolBirth){
			alert("생년월일을 정확하게 입력해주세요.");
			birth.focus();
		}else if(!boolPhone){
			alert("전화번호를 정확하게 입력해주세요.");
			phone.focus();
			// u_info 체크박스 입력태그가 체크된 상태면 true, 아니면 false
		}else if(!document.querySelector("#u_info").checked){
			alert("개인정보 이용동의를 확인해주세요.");
		}else {
			// joinForm tag submit 이벤트 실행
			document.querySelector("#joinForm").submit();
		}
	};
</script>
<jsp:include page="/common/footer.jsp" />











