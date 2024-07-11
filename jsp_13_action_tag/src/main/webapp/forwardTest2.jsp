<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest2.jsp</title>
</head>
<body>
	<%
		String nextPage = request.getParameter("nextPage");
		System.out.println(nextPage);
		// forwardTest1.jsp
		/*
		RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		rd.forward(request, response);
		*/
	%>
	<br>
	<hr>
	<img alt="" src="">
	
	<jsp:forward page="<%=nextPage %>">
		<jsp:param value="01094867166" name="tel"/>
	</jsp:forward>
</body>
</html>