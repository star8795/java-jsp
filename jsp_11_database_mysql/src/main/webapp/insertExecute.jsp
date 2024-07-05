<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록 요청 처리</title>
</head>
<body>
	<h2>JDBC CONNECTION &amp; INSERT TEST</h2>
	<!-- JDBC class import -->
	<%@ page import="java.sql.*" %>
	<%
		// insertForm.jsp 에서 전달된 파라미터 값들
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		
		//인증된 계정정보로 지정된 위치에 있는 데이터베이스의 
		// 연결 정보를 저장하는 객체
		Connection conn = null;
		
		// 연결된 데이터베이스에 질의 작업을 수행하고 결과를 반환하는 객체
		// Statement - 정적 쿼리
		// PreparedStatement - 동적 쿼리
		// CallableStatement - Stored Procedure 저장 프로시저
		PreparedStatement pstmt = null;
		
		try{
			
			// Driver Class load 
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",
				"digital",
				"1234"
			);
			out.println("<h3>DB 연결 성공!</h3>");
			
			// 연결된 정보를 이용해서 쿼리 작업 수행
			// PreparedStatement - SQL PREPARE 구문을 이용해서 동작
			// 실행할 쿼리를 먼저 등록 시켜놓고
			// 쿼리 실행 시 쿼리 실행에 필요한 데이터를 삽입
			//                                                         1,2,3,4 
			String sql = "INSERT INTO member(id,pass,name,addr) VALUES(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(4, addr);
			pstmt.setString(3, name);
			// 등록된 쿼리에 대입될 데이터 삽입 완료 = 쿼리 완성
			
			// table의 행 정보를 변경 실행한 후
			// 변경된 행의 개수를 int 타입으로 반환
			int result = pstmt.executeUpdate();
			
			if(result == 1){
				out.println("회원정보 등록 완료");
			}else{
				out.println("회원정보 등록 실패");
			}
			out.println(" - " + result);
			
		}catch(SQLException e){
			out.println("<h3>DB 실행 오류!</h3>");
			out.println("<h3>"+e.toString()+"</h3>");
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
	<a href = "index.jsp">메인으로</a>
</body>
</html>