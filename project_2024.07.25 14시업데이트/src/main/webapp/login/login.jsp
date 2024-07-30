<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .login {
        display: inline-block;
        text-align: left;
        border: 1px solid #ccc;
        padding: 20px;
    }
    
    .login1>input{
        width: 400px;
        height: 40px;
        box-sizing: border-box;
        border : 1px solid gray;
        outline: none;
        padding:0px 15px;
        font-size: 16px;
        margin-top: 3px;
    }
    
    .login2 a{
        font-size: 14px;
    }
    
    .social-login img {
        display: block;
        margin: 10px auto;
        width: 250px;
        height: 50px;
    }
    
    .flex-links {
        display: flex;
    }
    .join{
    	width:100%;
    	text-align:center;
    }
</style>

</head>
<body>
    <div style="text-align: center;">
        <div class="login">
            <div style="text-align: center;">
                <form onsubmit="return validateForm()">
                    <h2 style="text-align: center;">MONSTERZYM</h2>
                    <table width=400 style="text-align: center;">
                        <tr>
                            <td><input type="id"  placeholder="아이디" style="width: 100%;"></td>
                        </tr>
                        <tr>
                            <td><input type="password"  placeholder="비밀번호" style="width: 100%;"></td>
                        </tr>
                        <tr>
                            <td>
                                <button style="text-align: center; background-color: black; width: 100%; color: white;">이메일로 로그인</button>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <div style="text-align: left;">
                                    <input type="checkbox" id="rememberMe" name="rememberMe">
                                    <label for="rememberMe">아이디 저장</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="flex-links">
                                	<div style="margin-left:200px;">
	                                    <a href="https://www.naver.com/">아이디 찾기</a>
	                                    <a href="https://www.naver.com/">비밀번호 찾기</a>
                                	</div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <hr />
                    <div class="social-login">
                        <a href="https://accounts.kakao.com/">
                            <img src="../img/4.jpg" alt="카카오 로그인">
                        </a>
                        <a href="https://nid.naver.com/">
                            <img src="../img/8.png" alt="네이버 로그인">
                        </a>
                        <a href="https://appleid.apple.com/">
                            <img src="../img/6.jpg" alt="애플 로그인">
                        </a>
                    </div>
                    <br />
                    
                        
                            
                                <div class="join">
                                    <a href="register.jsp">회원가입</a>
                                </div>
                           
                        
                    
                </form>
            </div>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>