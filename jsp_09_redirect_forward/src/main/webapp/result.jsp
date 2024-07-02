<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp</title>
</head>
<body>
	<h1>result.jsp</h1>
	<h3>
		pageContext :
		<%=pageContext.getAttribute("index")%></h3>
	<h3>
		request :
		<%=request.getAttribute("index")%></h3>
	<!-- 
		jsp or servlet class 에서 java Code를 통해 페이지를 전환하는 방법
		
		1. response redirect
		요청에 다른 처리가 완료된 후에 응답을 받은 브라우저에게
		Location으로 지정한 페이지로 새롭게 요청(redirection)
		response.sendRedirect("이동할 페이지 경로");
		
		2. request -> RequestDispatcher -> forward(request, response);
		요청을 받아 응답으로 출력할 jsp 페이지를 지정된 페이지로 변경하여 출력하는 방법
		(하나의 요청에 출력할 페이지만 변경)
		request.getRequestDispatcher("출력할 페이지 경로").forward(request,response);
	 -->
	<hr />
	<form action="redirect" method="POST">
		<input type="text" name="id" />
		<button>POST</button>
	</form>
	<br />
	<hr />
	<a href="forward?id=chlrlrms">forward</a>

</body>
</html>