<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function validateForm() {
    var form = document.forms["joinForm"];
    var id = form["id"].value.trim();
    var pass = form["pass"].value.trim();
    var name = form["name"].value.trim();
    var addr = form["addr"].value.trim();
    var phone = form["phone"].value.trim();

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
    if (name === "") {
        alert("이름을 입력해 주세요.");
        form["name"].focus();
        return false;
    }
    if (addr === "") {
        alert("주소를 입력해 주세요.");
        form["addr"].focus();
        return false;
    }
    if (phone === "") {
        alert("전화번호를 입력해 주세요.");
        form["phone"].focus();
        return false;
    }
    return true;
}
</script>
</head>
<body>
    <jsp:include page="header.jsp" />

    <section>
        <form name="joinForm" action="join" method="post" onsubmit="return validateForm()">
            <table class="join">
                <tr>
                    <th colspan="2"><h1>회원가입</h1></th>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" alt="아이디"/></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pass" alt="비밀번호"/></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" alt="이름"/></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="addr" alt="주소" /></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="phone" alt="전화번호" /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" id="acceptBtn" value="회원가입" /></td>
                </tr>
            </table>
        </form>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>
