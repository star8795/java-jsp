<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
    <h1>게시물 수정</h1>
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
    <form action="board_update_submit.jsp" method="post">
        <input type="hidden" name="board_num" value="<%= rs.getInt("board_num") %>" />
        <table>
            <tr>
                <td>작성자</td>
                <td><input type="text" name="board_name" value="<%= rs.getString("board_name") %>" required /></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="board_password" required /></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="board_title" value="<%= rs.getString("board_title") %>" required /></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="board_content" rows="10" cols="40" required><%= rs.getString("board_content") %></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="수정완료" /></td>
            </tr>
        </table>
    </form>
    <% 
            } else {
    %>
        <p>해당 게시물이 존재하지 않습니다.</p>
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
