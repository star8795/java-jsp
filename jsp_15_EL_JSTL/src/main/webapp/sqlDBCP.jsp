<%@ page import="javax.naming.*, javax.sql.*, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database Connection Pool</title>
</head>
<body>
	<%
		Context init = new InitialContext();
		// naming - name으로 지정된 특정 리소스를 찾기 위한 고정 접두어
		init = (Context)init.lookup("java:comp/env");
		Object obj = init.lookup("java/testVO");
		out.println(obj+"<br/>");
		// JNDI(Java Naming and Directory Interface)
		// 서비스에서 제공하는 데이터 및 객체를 발견하고 참고하기 위한 자바 API
		
		DataSource ds = (DataSource)init.lookup("java/MySQLDB");
		Connection conn = ds.getConnection();
		out.println(conn+"<br/>");
	%>
</body>
</html>