<%@page import="com.mysql.cj.xdevapi.Table"%>
<%@ page import="java.sql.*,Util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
.body2{ 
 	position: relative; 
 	margin: 0 auto; 
 	bottom: 44px; 
 	width: 1000px; 
 }

.commentList {
border-collapse: collapse;
margin-bottom:30px;
}

.showpost {
	display: flex;
	height: 25px;	
}

.comment{
	border-bottom: 1px solid #c1c1c1;
	padding: 10px 0px;

}
.showComment {
	display: flex;
	height: 25px;
}


.nickname, .comment, .date {
line-height: 20px;
text-align:left;
}

.nickname {
font-weight: bold;
width:200px;
margin-right:100px;
}
.main {
margin-right:100px;
width:500px;
}

.commentdate {
	width:78px;	
	margin-right:0px;
}

hr{
border: 0;
height: 5px;
 background:black;

}

.showComment>button {
width:20px;
height:20px;
text-align:center;
background-color: rgba(125, 125, 125, 0.6);
color:white;
border:0px solid black;
cursor:pointer;
}
</style>
</head> 
<body>
<div class="body2">
<%
int pageCount = 25;
int currentPage = 1;
%>

	<%
	String postNum = request.getParameter("post_num");
	Connection conn = null;
	PreparedStatement state = null;
	
	

	try {
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM comment WHERE post_num = ?;";
		state = conn.prepareStatement(sql);
		state.setString(1, postNum);

		ResultSet rs = state.executeQuery();
		
		
		
	%>
	<hr/>
	<table class="commentList">
	
		<%
		while (rs.next()) {
 			String comment_num = rs.getString("comment_num");
			String nickname = rs.getString("nickname");
			String main = rs.getString("main");
			String post_date = rs.getString("post_date");
		%>
		<tr>
			<td>
			<div class="comment">
			<div class="showComment">
				<div class="nickname"><%=nickname%></div> <br />
				<div class="main"><%=main%></div> <br /> <br />
				<div class="commentdate"><%=post_date%></div> <br />
                <form action="commentDelete.jsp" method="post" style="display:inline;">
                <input type="hidden" name="comment_num" value="<%= comment_num %>"/>
                <button type="submit">X</button>
                </form>
				</div>
				</div>
			</td>
		</tr>
		


	<%
	}
	%>
		</table>
		<hr/>
<%@ include file="../community/commentWrite.jsp" %>
		
		</div>
</body>
	<script type="text/javascript">
	
<%
} catch (Exception e) {
out.println("오류: " + e.getMessage());
} finally {
JDBCUtil.close(state, conn);
}
%>


</script>
</html>