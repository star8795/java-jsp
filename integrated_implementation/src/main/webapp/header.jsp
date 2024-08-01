<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<header>
    <ul>
        <li><a href="#">홈</a></li>
        <% 
            HttpSession ses = request.getSession(false); 
            if (session != null && session.getAttribute("userId") != null) { 
        %>
            <li><a href="logout.jsp">로그아웃</a></li>
            <li><a href="#">환영합니다, <%= session.getAttribute("userName") %>님</a></li>
        <% } else { %>
            <li><a href="login.jsp">로그인</a></li>
            <li><a href="join.jsp">회원가입</a></li>
        <% } %>
    </ul>
</header>

<main>
    <%
        if (session != null && session.getAttribute("userId") != null) {
            String userId = (String) session.getAttribute("userId");
            String userName = (String) session.getAttribute("userName");
            String userAddr = (String) session.getAttribute("userAddr");
            String userPhone = (String) session.getAttribute("userPhone");
    %>
    <%
        } else {
            response.sendRedirect("login.jsp");
        }
    %>
</main>
</body>
</html>
