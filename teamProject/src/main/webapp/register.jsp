<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }
        .join {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            border: 1px solid #ccc;
        }
        .join h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .join input {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .join button {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .join button:hover {
            background-color: #0056b3;
        }
        .hidden {
            display: none;
        }
    </style>
    <script>
        function sendEmail() {
            var email = document.getElementById("email").value;
            if (email) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "sendEmail.jsp", true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        document.getElementById("authCodeDiv").classList.remove("hidden");
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
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
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
	<!-- <a href="sendEmail.jsp?email=hap0p9y@nate.com">aaaaa</a> -->

    <div class="join">
        <h2>회원가입</h2>
        <form action="joinComplete.jsp" method="post">
            이름 <input type="text" name="name" placeholder="이름" required><br/>
            아이디 <input type="text" name="id" placeholder="id" required><br/>
            비밀번호 <input type="password" name="pass" placeholder="password" required><br/>
            생년월일 <input type="date" name="birthdate" placeholder="생년월일" required><br/>
            전화번호 <input type="text" name="phone" placeholder="전화번호" required><br/>
            이메일 <input type="email" id="email" name="email" placeholder="email" required><br/>
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
</body>
</html>