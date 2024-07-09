<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메시지 삭제 확인</title>
</head>
<body>
	<%
		// 삭제 요청한 방명록 번호
		String num = request.getParameter("num");
	%>
	<form action="guest_book_delete.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>"/>
		메세지를 삭제하시려면 암호를 입력하세요 <br/>
		암호 : <input type="password" name="password" /> <br/>
		<button>메세지 삭제하기</button>
	</form>
</body>
</html>