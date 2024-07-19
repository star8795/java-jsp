<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제 처리</title>
<script type="text/javascript">
    function showAlert(message, redirectUrl) {
        alert(message);
        window.location.href = redirectUrl;
    }
</script>
</head>
<body>
    <%
        String dbURL = "jdbc:mysql://localhost:3306/digital_jsp";
        String dbUser = "digital";
        String dbPassword = "1234";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String boardNumParam = request.getParameter("board_num");
        String boardPass = request.getParameter("board_pass");

        int boardNum = 0;
        String message = null;
        String redirectUrl = "board_list.jsp"; // 기본 리다이렉트 URL

        try {
            // 게시물 번호가 유효한지 확인
            if (boardNumParam != null && !boardNumParam.isEmpty()) {
                boardNum = Integer.parseInt(boardNumParam);
            } else {
                throw new IllegalArgumentException("게시물 번호가 제공되지 않았습니다.");
            }

            // 데이터베이스 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // 게시물 비밀번호 확인
            String checkSql = "SELECT board_pass FROM test_board WHERE board_num = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setInt(1, boardNum);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("board_pass");
                if (storedPassword != null && storedPassword.equals(boardPass)) {
                    // 게시물 삭제
                    String deleteSql = "DELETE FROM test_board WHERE board_num = ?";
                    pstmt = conn.prepareStatement(deleteSql);
                    pstmt.setInt(1, boardNum);
                    int rowsAffected = pstmt.executeUpdate();
                    if (rowsAffected > 0) {
                        message = "게시물이 성공적으로 삭제되었습니다.";
                    } else {
                        message = "게시물 삭제에 실패했습니다.";
                    }
                } else {
                    message = "비밀번호가 일치하지 않습니다.";
                }
            } else {
                message = "해당 게시물이 존재하지 않습니다.";
            }
        } catch (NumberFormatException e) {
            message = "게시물 번호 형식이 잘못되었습니다.";
        } catch (IllegalArgumentException e) {
            message = e.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            message = "게시물 삭제 중 오류가 발생했습니다: " + e.getMessage();
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

        if (message != null) {
    %>
            <script type="text/javascript">
                showAlert("<%= message %>", "<%= redirectUrl %>");
            </script>
    <% 
        }
    %>
</body>
</html>
