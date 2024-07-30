<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,Util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입확인</title>
</head>
<body>
<%
	Connection conn = JDBCUtil.getConnection();
	String cid = request.getParameter("cid");
	String id = request.getParameter("jid");
	String name = request.getParameter("jname");
	String nickName = request.getParameter("jnickname");
	String pw = request.getParameter("jpw");
	String cpw = request.getParameter("jcpw");
	String isJoin = request.getParameter("isJoin");
	PreparedStatement state = null;
	if(!id.equals(cid)){
		 %>
	        <script>
	            alert("아이디 중복 체크를 다시 해주세요");
	            history.go(-1);
	        </script>
	    <%
	    return;
	}
	 if(isJoin != null && isJoin.equals("true")){
		 if(!pw.equals(cpw)){
			 %>
		        <script>
		            alert("비밀번호를 확인해 주세요");
		            history.go(-1);
		        </script>
		    <%
		    return;
		 }
		 try{
		 	String sql = "insert into member(id, pass, name , nickName) values(?,?,?,?)";
		 	state = conn.prepareStatement(sql);
		 	state.setString(1, id);
			state.setString(2, pw);
			state.setString(3, name);
			state.setString(4, nickName);
			int rowsAffected = state.executeUpdate();
			
		 }catch(Exception e){
			 out.println(e.getMessage());
		 }finally{
			 JDBCUtil.close(state,conn);
		 }
		%>
		<%-- 
        <p>회원 정보가 확인되었습니다.</p>
        <p>ID: <%= id %></p>
        <p>Name: <%= name %></p>
        <p>Nickname: <%= nickName %></p>
        <p>Password: <%= pw %></p>
        <p>Confirm Password: <%= cpw %></p>
         --%>
         <h1>가입 완료 <%=id+":"+cid %></h1>
         <a href="login.jsp">로그인 페이지로</a>
<%
    }else{
    	%>
        <script>
            alert("아이디 중복체크 해주세요");
            history.go(-1);
        </script>
    <%
    }
%>
</body>
</html>
