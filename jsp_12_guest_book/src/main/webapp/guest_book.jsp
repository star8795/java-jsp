<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메시지 목록 &amp; 작성</title>
</head>
<body>
	<!-- 방명록 작성 -->
	<form action="guest_book_write.jsp" method="POST">
		<table>
			<tr>
				<th colspan="3"><h2>방명록 작성</h2></th>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td rowspan="4">
					<button style="margin-left:20px;width:100%; height:130px;">메세지 남기기</button>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="guestName" style="width:100%;" required/>
				</td>
			</tr>
			<tr>
				<td>암호</td>
				<td>
					<input type="password" name="password" style="width:100%;" required/>
				</td>
			</tr>
			<tr>
				<td>메세지</td>
				<td>
					<textarea name="message" cols="35" rows="5"></textarea>
				</td>
			</tr>
		</table>
	</form>
	<%@ page import="java.sql.*, utils.*" %>
	<%
		// 한 페이지에 보여줄 게시물 개수
		int pageCount = 10;
	
		Connection conn = JDBCUtil.getConnection();
		
		String sql = "SELECT num, guestName, message FROM guestBook ORDER BY num DESC";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
	%>
	
	<hr/>
	<br/>
	<h1>방명록 리스트</h1>
	<table border="1" cellspacing="0" cellpadding="0">
		<%
			while(rs.next()){
				int num = rs.getInt("num");				
				String guestName = rs.getString("guestName");
				String message = rs.getString("message");
		%>
			<tr>
				<td>
					메세지 번호 : <%=num%> <br/>
					손님 이름 : <%=guestName %> <br/>
					메세지 : <%=message %> 
					<a href="guest_book_confirm.jsp?num=<%=num%>">[삭제]</a>
				</td>				
			</tr>
		<%
			} // end while 
			// 검색된 행 정보 출력 완료
			// 사용이 끝난 자원 해제
			/*
			JDBCUtil.close(rs);
			JDBCUtil.close(stmt);
			JDBCUtil.close(conn);
			*/
			JDBCUtil.close(rs,stmt,conn);
		%>
	</table>
</body>
</html>