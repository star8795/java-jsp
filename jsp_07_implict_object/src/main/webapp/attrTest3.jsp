<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest3.jsp</title>
</head>
<body>
	<h1>attrTest3.jsp Page</h1>

	<h4>
		pageContext id :
		<%=pageContext.getAttribute("pageId")%></h4>
	<h4>
		request email :
		<%=request.getAttribute("requestEmail")%></h4>
	<h4>
		session email :
		<%=session.getAttribute("sessionEmail")%></h4>
	<h4>
		application id :
		<%=application.getAttribute("appId")%></h4>

	<a href="index.jsp">메인으로</a>
</body>
</html>