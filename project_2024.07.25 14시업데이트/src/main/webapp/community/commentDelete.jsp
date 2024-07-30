<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
String userId = (String) session.getAttribute("id");
Connection conn = null;
PreparedStatement state = null;
String commentNum = request.getParameter("comment_num");

conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM comment WHERE comment_num = ?;";
			state = conn.prepareStatement(sql);
			state.get(1, commentNum);
			ResultSet rs = state.executeQuery();
			String commentdeletenum = rs.getString("user_num");
			
		
		if(commentdeletenum.equals(usrId)){
		
		alert("정말 댓글을 삭제하시겠습니까?");
		} else {
			alert("본인이 작성하지 않은 댓글은 삭제할 수 없습니다.");
		}
		}

%>
</body>
</html>