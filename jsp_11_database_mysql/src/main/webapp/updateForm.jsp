<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="connection.jsp" %>
<%
	String paramNum = request.getParameter("num");
	int num = Integer.parseInt(paramNum);
	
	String sql = "SELECT name, addr FROM member WHERE num = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	
	ResultSet rs = pstmt.executeQuery();
	
	String name = "";
	String addr = "";
	
	if(rs.next()){
		// name, addr
		name = rs.getString(1);
		addr = rs.getString(2);
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
			
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<h3><%=num%>번 회원 정보 수정</h3>
	<form action="updateExecute.jsp" method="POST">
	<input type="hidden" name="num" value="<%=num%>" />
		<table border="1">
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value="<%=name%>" required/>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="addr" value="<%=addr%>" required/>
				</td>
			</tr>
			<tr>
				<th colspan="2"><button>수정</button></th>
			</tr>
		</table>
	</form>
</body>
</html>