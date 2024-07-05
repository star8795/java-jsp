<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="connection.jsp" %>
<%
	// updateForm.jsp 전달되는 파라미터 3개
	// num, name, addr
	String paramNum = request.getParameter("num");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	int num = Integer.parseInt(paramNum);
	
	String sql = "UPDATE member SET name = ?, addr = ? WHERE num = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, addr);
	pstmt.setInt(3, num);
	
	int result = pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
%>
<script>
	alert('<%=result%> 개의 행 수정 완료!')
	location.href = "memberList.jsp";
</script>