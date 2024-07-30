<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<%
Connection conn = null;
PreparedStatement state = null;
String postNum = request.getParameter("post_num");

try {
	conn = JDBCUtil.getConnection();
	String sql = "SELECT * FROM post_list WHERE post_num = ?;";
	state = conn.prepareStatement(sql);
	state.setString(1, postNum);

	ResultSet rs = state.executeQuery();

	if (rs.next()) {
		String viewCount = rs.getString("view_count");
		String category = rs.getString("category");
		String title = rs.getString("title");
		String nickname = rs.getString("nickname");
		String link = rs.getString("link");
		String main = rs.getString("main");	
		String file = rs.getString("file");
		String postDate = rs.getString("post_date");
%>
<style type="text/css">
.postview {
	display: flex;
	border-top: 3px solid black;
	border-bottom: 3px solid gray;
	padding-top:15px;
	padding:20px;
	line-height:20px;
}

.viewtitle {
	font-size : 25px;
	width:400px;
}

.page>button { 
border-radius: 25px; 
width:60px; 
height:50px; 
border:2px solid black; 
font-size:20px; 
font-weight:bold; 
 cursor:pointer; 
 background-color: white;
} 

.viewnickname {
margin-left:300px;
width:100px;

}
.viewpostdate {
margin-left:100px;
width:100px;
}

.postmain {
margin-top:20px;
padding:20px;
}
/* 기환 *//* 기환 *//* 기환 *//* 기환 *//* 기환 *//* 기환 *//* 기환 *//* 기환 *//* 기환 */
.deletePost{
margin-left:95%;
}


.page {
	margin-top: 200px;
	display: flex;
}

.Comment {
	margin-top: 100px;
}

.communityBody {
	margin-top: 100px;
}
</style>
</head>
<style>
</style>
<body>
	<%@ include file="../community/communityHeader.jsp"%>
	<div>
		<div style="width: 1000px; margin: 50px auto;">
			<div class="postview">
				<div class="viewtitle"><%=title%></div>
				<div class="viewnickname"><%=nickname%></div>
				<div class="viewpostdate"><%=postDate%></div>
			</div>
			<div class="postmain"><%=main%></div>
			
			<div class="deletePost">
				<button onclick="deletePost()"">삭제</button>
			</div>
			
			<div class="page">
				<button onclick="nextPage('-')">&lt;</button>
				<button onclick="nextPage('+')" style="margin-left: auto;">&gt;</button>
			</div>

			<div class="Comment">
				<jsp:include page="comment.jsp" />

			</div>


			<div class="communityBody">
				<jsp:include page="../community/communityBody.jsp" />
			</div>

		</div>
	</div>
	<%@ include file="../main/footer.jsp"%>
</body>
<script type="text/javascript">
	function nextPage(next) {
		var postNum = '<%=postNum%>';

		// 새로운 URL 생성
		if (next == '+') {
			var nextPostNum = parseInt(postNum) + 1; // postNum을 숫자로 변환하여 1을 더함
		} else {
			var nextPostNum = parseInt(postNum) - 1;
		}

		var newUrl = 'postview.jsp?post_num=' + nextPostNum;
		// 페이지 이동
		window.location.href = newUrl;
	}
</script>
<%
} else {
out.println("해당 게시물을 찾을 수 없습니다.");
}

} catch (Exception e) {
out.println("오류: " + e.getMessage());
} finally {
JDBCUtil.close(state, conn);
}
%>
</html>