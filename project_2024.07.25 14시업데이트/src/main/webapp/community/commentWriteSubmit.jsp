<%@page import="Util.JDBCUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<c:catch var="e">
	<s:setDataSource var="conn"
	    driver="com.mysql.cj.jdbc.Driver"
	    url="jdbc:mysql://localhost:3306/login"
	    user="login"
	    password="1234"/>

	<s:update var="sql" dataSource="conn">
		INSERT INTO comment (post_num, nickname, main)
		VALUES (?,?,?);
		<s:param>${param.num}</s:param>
		<s:param>${param.nickname}</s:param>
		<s:param>${param.main}</s:param>
	</s:update>
		<c:if test="${sql == 1}">
			<script>
		    	alert('댓글 작성 완료');
		    	history.back();
		    </script>
		</c:if>
</c:catch>
<c:if test="${not empty e}">
    <p>오류가 발생했습니다: ${e.message}</p>
    <script>
    	alert('오류남');
    	history.back();
    </script>
</c:if>		
 --%>
 
 <%
	Connection conn = null;
	PreparedStatement state = null;
	String postNum = request.getParameter("num");
	String nickname = request.getParameter("nickname");
	String main = request.getParameter("main");
	
	try{
		conn = JDBCUtil.getConnection();
		String sql = "INSERT INTO comment (post_num, nickname, main, post_date) VALUES (?,?,?,?);";
		state = conn.prepareStatement(sql);
		state.setString(1, postNum);
		state.setString(2, nickname);
		state.setString(3, main);
		state.setString(4, "지금");
		
		state.executeUpdate();
	 response.sendRedirect(request.getHeader("referer"));
		
	} catch (Exception e) {
        out.println("오류: " + e.getMessage());
    } finally {
      //JDBCUtil.close(state,conn);
    }
	
 %>