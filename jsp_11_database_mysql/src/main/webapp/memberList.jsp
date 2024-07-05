<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style>
	table tr td {
		padding: 5px 10px;
	}

	table tr:nth-child(n+2):hover{
		cursor:pointer;
		background-color:gold;
		color:white;
	}	
</style>
</head>
<body>
	<%
		Statement stmt = conn.createStatement();
	
		String sql = "SELECT num, id, name, addr FROM member ORDER BY num DESC";
		
		ResultSet rs = stmt.executeQuery(sql);
	
	%>

	<h1>등록된 회원 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>주소</th>
			<th>비고</th>
		</tr>
		
	<%
		while(rs.next()){
			// num, id, name, addr
			int num = rs.getInt("num");				// 1
			String id = rs.getString("id");			// 2
			String name = rs.getString("name");		// 3
			String addr = rs.getString("addr");		// 4
	%>
		<!-- 한 회원의 정보를 table tag의 tr로 출력 -->	
		<tr onclick="location.href='updateForm.jsp?num=<%=num%>';">
			<td><%=num%></td>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=addr%></td>
			<td>
				<!-- 회원 삭제 -->
				<form action="deleteExecute.jsp" method="POST">
					<input type="hidden" name="num" value="<%=num%>"/> 
					<button>삭제</button>
				</form>
			</td>	
		</tr>
	<%		
		} // end while - 검색된 모든 행정보 읽기 완료
		
		// 자원 해제
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	%>		
	</table>
	<hr/>
	<a href="index.jsp">메인으로</a>
</body>
</html>