<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../main/header.jsp"%>
<style>
	body {
		background-color: #e6e6e6; /* 배경색을 회색으로 설정 */
	}
	.join {
		margin: 50px auto;
		padding: 2rem;
		border: 1px solid #000;
		border-radius: 8px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		max-width: 500px;
		width: 100%;
		background-color: #fff;
		line-height: 50px;
		text-align: center;
	}
	
	h2 {
		text-align: center;
		font-size: 2.5rem; /* 제목 글자 크기 확대 */
	}
	
	.form-group {
		margin-bottom: 20px; /* 입력 필드 사이 간격 조정 */
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.form-group label {
		width: 120px; /* 모든 레이블의 너비를 동일하게 설정 */
		margin-right: 10px;
		text-align: left; /* 글자를 왼쪽 정렬 */
		font-size: 20px; /* 레이블 글자 크기 확대 */
	}
	
	.form-group input, .form-group button {
		flex: 1;
		padding: 10px;
		box-sizing: border-box;
		text-align: left; /* 입력 필드의 글자를 왼쪽 정렬 */
		font-size: 1rem; /* 입력 필드 글자 크기 확대 */
		width: calc(100% - 20px); /* 부모의 너비에 맞춰 크기 조정 */
	}
	
	.form-group input {
		margin-right: 10px; /* 입력 필드와 버튼 사이 간격 조정 */
	}
	
	#authCodeDiv.hidden {
		display: none;
	}
	
	#authCodeDiv {
		margin-top: 15px;
		text-align: center; /* 인증 코드 입력 필드 및 버튼 가운데 정렬 */
	}
	
	button {
		background-color: black;
		color: white;
		border: none;
		cursor: pointer;
		margin-top: 10px;
		padding: 10px;
		display: block; /* 버튼을 블록 요소로 만들어 가운데 정렬 */
		margin-left: auto;
		margin-right: auto;
		width: calc(100% - 20px); /* 버튼 너비 조정 */
	}
	
	button:disabled {
		background-color: #cccccc;
		cursor: allowed;
	}
	
	#emailMessage, #verificationMessage {
		font-size: 1.4rem; /* 메시지 글자 크기 확대 */
		margin-top: 10px;
		text-align: center; /* 메시지 가운데 정렬 */
	}
	
	/* /* 메뉴 컨테이너 스타일 */
	.menu-container {
		width: 800px; /* 너비 설정 */
		height: 220px; /* 높이 설정 */
		margin: 50px auto; /* 상하 여백, 좌우 가운데 정렬 */
		padding: 1rem;
		display: flex;
		flex-wrap: wrap; /* 여러 줄로 나눠서 표시 */
		gap: 20px; /* 메뉴 상자 간격 */
		justify-content: center; /* 가운데 정렬 */
		box-sizing: border-box; /* 패딩과 보더를 너비와 높이에 포함 */
	}
	
	.menu-box {
		width: calc(25% - 20px); /* 4개 열에 맞추기 위한 너비 */
		height: 80px; /* 원하는 높이로 설정 */
		padding: 10px; /* 패딩 조정으로 높이 감소 */
		border: 2px solid #000;
		border-radius: 8px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		background-color: #f5f5f5;
		text-align: center;
		box-sizing: border-box;
		overflow: hidden; /* 내용이 넘칠 경우 숨기기 */
	}
	
	.menu-box h3 {
		margin-top: 0;
		font-size: 40px; /* 메뉴 제목 글자 크기 */
	} */
</style>
<script>
	function sendEmail() {
		var email = document.getElementById("email").value;
		if (email) {
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "sendEmail.jsp", true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					document.getElementById("authCodeDiv").classList
							.remove("hidden");
					document.getElementById("emailMessage").innerText = "인증 코드가 이메일로 전송되었습니다.";
				}
			};
			xhr.send("email=" + email);
		} else {
			alert("이메일을 입력하세요.");
		}
	}

	function verifyCode() {
		var authCode = document.getElementById("authCode").value;
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "verifyEmail.jsp", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				if (xhr.responseText.trim() === "success") {
					document.getElementById("verificationMessage").innerText = "이메일 인증 성공!";
					document.getElementById("registerBtn").disabled = false;
				} else {
					document.getElementById("verificationMessage").innerText = "인증 코드가 올바르지 않습니다.";
				}
			}
		};
		xhr.send("authCode=" + authCode);
	}
</script>
</head>
<body>
	<div class="join">
		<h2>회원가입</h2>
		<form action="joinComplete.jsp" method="post">
			<div class="form-group">
				<label for="name">이름</label> <input type="text" id="name"
					name="name" placeholder="이름" required>
			</div>
			<div class="form-group">
				<label for="id">아이디</label> <input type="text" id="id" name="id"
					placeholder="id" required>
			</div>
			<div class="form-group">
				<label for="pass">비밀번호</label> <input type="password" id="pass"
					name="pass" placeholder="password" required>
			</div>
			<div class="form-group">
				<label for="birthdate">생년월일</label> <input type="date"
					id="birthdate" name="birthdate" placeholder="생년월일" required>
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label> <input type="text" id="phone"
					name="phone" placeholder="전화번호" required>
			</div>
			<div class="form-group">
				<label for="email">이메일</label> <input type="email" id="email"
					name="email" placeholder="email" required>
			</div>
			<button type="button" onclick="sendEmail()">이메일 인증</button>
			<p id="emailMessage"></p>
			<div id="authCodeDiv" class="hidden">
				<input type="text" id="authCode" placeholder="인증 코드 입력" required>
				<button type="button" onclick="verifyCode()">인증 코드 확인</button>
				<p id="verificationMessage"></p>
			</div>
			<button type="submit" id="registerBtn" disabled>회원가입</button>
		</form>
	</div>

<!-- 	<div class="menu-container">
		<div class="menu-box">
			<h3>메뉴 1</h3>
		</div>
		<div class="menu-box">
			<h3>메뉴 2</h3>
		</div>
		<div class="menu-box">
			<h3>메뉴 3</h3>
		</div>
		<div class="menu-box">
			<h3>메뉴 4</h3>
		</div>
		<div class="menu-box">
			<h3>메뉴 5</h3>
		</div>
		<div class="menu-box">
			<h3>메뉴 6</h3>
		</div>
		<div class="menu-box">
			<h3>메뉴 7</h3>
		</div>
		<div class="menu-box">
			<h3>메뉴 8</h3>
		</div> -->
	</div>
	<%@ include file="../main/footer.jsp"%>
</body>