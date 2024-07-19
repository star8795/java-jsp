<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
    <h1>게시물 상세보기</h1>
    <%
        // 데이터베이스 연결 변수 설정
        String dbURL = "jdbc:mysql://localhost:3306/digital_jsp";
        String dbUser = "digital";
        String dbPassword = "1234";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String boardNumParam = request.getParameter("board_num");
        int boardNum = 0;

        try {
            if (boardNumParam != null && !boardNumParam.isEmpty()) {
                boardNum = Integer.parseInt(boardNumParam);
            } else {
                throw new IllegalArgumentException("게시물 번호가 제공되지 않았습니다.");
            }

            // 데이터베이스 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // 게시물 정보 조회
            String sql = "SELECT * FROM test_board WHERE board_num = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardNum);
            rs = pstmt.executeQuery();

            if (rs.next()) {
    %>
    <table border="1">
        <tr>
            <th>작성자</th>
            <td><%= rs.getString("board_name") %></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><%= rs.getString("board_title") %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><%= rs.getString("board_content") %></td>
        </tr>
        <tr>
            <th>작성시간</th>
            <td><%= rs.getTimestamp("board_date") %></td>
        </tr>
        <tr>
            <th>조회수</th>
            <td><%= rs.getInt("board_readcount") %></td>
        </tr>
    </table>

    <!-- 수정 및 삭제 링크 -->
    <a href="board_update.jsp?board_num=<%= rs.getInt("board_num") %>">[수정]</a>
    <a href="board_delete.jsp?board_num=<%= rs.getInt("board_num") %>" onclick="return confirm('정말 삭제하시겠습니까?');">[삭제]</a>
    <a href="board_list.jsp">[목록]</a>
    <% 
            } else {
    %>
        <p>게시물 정보를 찾을 수 없습니다.</p>
    <% 
            }
        } catch (NumberFormatException e) {
            out.println("<p>게시물 번호 형식이 잘못되었습니다.</p>");
        } catch (IllegalArgumentException e) {
            out.println("<p>" + e.getMessage() + "</p>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>게시물 정보를 조회하는 중 오류가 발생했습니다.</p>");
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
</body>
</html>
