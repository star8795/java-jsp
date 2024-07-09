<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 등록 요청 처리</title>
</head>
<body>
	<h1>방명록 등록 페이지</h1>
	<%@ page import="java.sql.*" %>
	<%
		String guestName = request.getParameter("guestName");
		String password = request.getParameter("password");
		String message = request.getParameter("message");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 처리 결과를 저장할 변수
		String resultMsg = "";
		
		try{
			// Driver class load
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",	// 연결할 db server schema
				"digital",									// 권한있는 계정 id
				"1234"										// 비밀번호
			);
			out.println("DB 연결 완료 " + conn);
			
			String sql = "INSERT INTO guestBook VALUES(null, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestName);
			pstmt.setString(2, password);
			pstmt.setString(3, message);
			
			int result = pstmt.executeUpdate();
			
			resultMsg = (result > 0) ? "방명록 등록 성공" : "방명록 등록 실패";
			
		}catch(ClassNotFoundException e){
			out.println("Driver class를 찾을 수 없음<br/>");
		}catch(SQLException e){
			out.println("DB 연결 정보 오류 <br/>");
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
	
	<!-- 방명록 작성 후 처리결과 출력 -->
	<h2><%=resultMsg%></h2>
	<a href="guest_book.jsp">방명록 목록 보기</a>
</body>
</html>