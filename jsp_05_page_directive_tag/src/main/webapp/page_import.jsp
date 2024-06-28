<%-- 
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
 --%>
<%@ page import="java.text.*, java.util.*" 
	     language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP import</title>
</head>
<body>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		out.print(date+"<br/>");
	%>
</body>
</html>











