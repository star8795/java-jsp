<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> DB 커넥션 </title>
</head>
<body>
	<%
	// Driver class 이름(위치)
			String driver = "com.mysql.cj.jdbc.Driver";
			// database 에 연결하기 위한 정보
			String url ="jdbc:mysql://localhost:3306/login";
			String username = "login";
			String password = "1234";
			
			// 연결 정보를 이용해서 database에 연결된 정보를 저장하는 객체
			Connection conn = null;
			
			try{
				Class.forName(driver);
				out.println("Driver class 존재<br/>");
				
				conn = DriverManager.getConnection(
					url,username,password
				);
				out.println("DB연결 완료");
				out.println(conn+"<br/>");
			}catch(Exception e){
				out.println("DB 연결 요청 오류 : " +e.getMessage()+"<br/>");
			}finally{
				if(conn != null){
					conn.close();
				}
			}
	%>
	<a href="main/main.jsp">로그인페이지</a>
</body>
</html>