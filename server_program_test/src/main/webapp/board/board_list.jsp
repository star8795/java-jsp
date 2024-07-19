<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
    <h1>게시글 목록</h1>
    <a href="<c:url value='/board/board_write.jsp'/>">게시글 작성하러 가기</a>
    <table border="1">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>
        <% 
            // 데이터베이스 연결 변수 설정
            String dbURL = "jdbc:mysql://localhost:3306/digital_jsp";
            String dbUser = "digital";
            String dbPassword = "1234";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            int currentPage = 1; // 현재 페이지 번호
            int postsPerPage = 3; // 페이지당 게시물 수
            int totalPosts = 0; // 전체 게시물 수
            int totalPages = 0; // 전체 페이지 수

            try {
                // 데이터베이스 연결
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // 전체 게시물 수 가져오기
                String countSql = "SELECT COUNT(*) FROM test_board";
                pstmt = conn.prepareStatement(countSql);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    totalPosts = rs.getInt(1);
                }
                
                // 총 페이지 수 계산
                totalPages = (int) Math.ceil((double) totalPosts / postsPerPage);

                // 현재 페이지 번호 가져오기
                String pageParam = request.getParameter("page");
                if (pageParam != null && !pageParam.isEmpty()) {
                    try {
                        currentPage = Integer.parseInt(pageParam);
                    } catch (NumberFormatException e) {
                        currentPage = 1; // 페이지 번호가 유효하지 않을 경우 기본값
                    }
                }

                // 페이지 번호 범위 확인
                if (currentPage < 1) currentPage = 1;
                if (currentPage > totalPages) currentPage = totalPages;

                // SQL 쿼리문 (페이징 처리)
                int offset = (currentPage - 1) * postsPerPage;
                String sql = "SELECT * FROM test_board ORDER BY board_num DESC LIMIT ? OFFSET ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, postsPerPage);
                pstmt.setInt(2, offset);
                rs = pstmt.executeQuery();
                
                // 결과 처리
                if (!rs.next()) {
        %>
                    <tr>
                        <td colspan="5">등록된 정보가 없습니다.</td>		
                    </tr>
        <% 
                } else {
                    do {
        %>
                    <tr>
                        <td><%= rs.getInt("board_num") %></td>
                        <td><a href="<c:url value='/board/board_detail.jsp'/>?board_num=<%= rs.getInt("board_num") %>"><%= rs.getString("board_title") %></a></td>
                        <td><%= rs.getString("board_name") %></td>
                        <td><%= rs.getTimestamp("board_date") %></td>
                        <td><%= rs.getInt("board_readcount") %></td>
                    </tr>
        <% 
                    } while (rs.next());
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // 자원 해제
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>

    <!-- 페이징 블럭 -->
    <div>
        <% if (totalPages > 1) { %>
            <div>
                <% if (currentPage > 1) { %>
                    <a href="?page=<%= currentPage - 1 %>">« 이전</a>
                <% } %>
                
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <a href="?page=<%= i %>" <%= (i == currentPage) ? "style='font-weight:bold'" : "" %>><%= i %></a>
                <% } %>
                
                <% if (currentPage < totalPages) { %>
                    <a href="?page=<%= currentPage + 1 %>">다음 »</a>
                <% } %>
            </div>
        <% } %>
    </div>
</body>
</html>
