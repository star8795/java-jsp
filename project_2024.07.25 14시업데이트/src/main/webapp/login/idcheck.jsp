<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,Util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 체크</title>
</head>
<%
	String id = request.getParameter("jid");
	String name = request.getParameter("jname");
	String nickName = request.getParameter("jnickname");
	String pw = request.getParameter("jpw");
	String cpw = request.getParameter("jcpw");
	String isJoin = "false";

	Connection conn = JDBCUtil.getConnection();
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String msg = "";
	
	try{
		String sql = "select id from member WHERE id = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, id);
		rs = stmt.executeQuery();
		if(id.equals("")){
			msg = "아이디를 입력해 주세요.";
		}else if(rs.next()){
			out.println("아이디 중복");
			msg = "아이디가 중복입니다.";
		}else{
			session.setAttribute("jcid",id);
			isJoin = "true";
			msg = "사용가능한 아이디입니다.";
		}
	}catch(Exception e){
		out.println("뭔가 오류남" + e.getMessage());
	}finally {
	    JDBCUtil.close(conn, stmt);
	}
	
	session.setAttribute("jid",id);
	session.setAttribute("jname",name);
	session.setAttribute("jnickname",nickName);
	session.setAttribute("jpw",pw);
	session.setAttribute("jcpw",cpw);
	session.setAttribute("isJoin",isJoin);
	// session.setAttribute("joinok",isJoin);
	
%>

<script>
	alert('<%=msg%>');
	location.href='join.jsp';
</script>
<!-- 
<body>
	<form id="myForm" action="join.jsp" method="post">
    <input type="hidden" name="jid" value="<%= id %>">
    <input type="hidden" name="jname" value="<%= name %>">
    <input type="hidden" name="jnickname" value="<%= nickName %>">
    <input type="hidden" name="jpw" value="<%= pw %>">
    <input type="hidden" name="jcpw" value="<%= cpw %>">
    <input type="hidden" name="joinok" value="<%= isJoin %>">
</form>
<script type="text/javascript">
    document.getElementById('myForm').submit();
</script>
 -->
</body>
</html>