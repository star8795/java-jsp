<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function validateForm() {
    var form = document.getElementById("loginForm");
    var id = form["id"].value.trim();
    var pass = form["pass"].value.trim();

    if (id === "") {
        alert("아이디를 입력해 주세요.");
        form["id"].focus();
        return false;
    }
    if (pass === "") {
        alert("비밀번호를 입력해 주세요.");
        form["pass"].focus();
        return false;
    }
    return true;
}
</script>
</head>
<body>
    <jsp:include page="header.jsp" />

    <section>
        <form id="loginForm" action="login" method="post" onsubmit="return validateForm()">
            <table class="login">
                <tr>
                    <th colspan="3"><h1>로그인</h1></th>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td colspan="2"><input type="text" name="id" alt="아이디" /></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td colspan="2"><input type="password" name="pass" alt="비밀번호" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="checkbox" id="login" name="login" />
                        <label for="login">로그인 상태 유지</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" id="acceptBtn" value="로그인" />
                    </td>
                </tr>
            </table>
        </form>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>