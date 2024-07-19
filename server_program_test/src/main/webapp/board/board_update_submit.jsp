<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정 처리</title>
<script type="text/javascript">
    function showAlert(message) {
        alert(message);
        window.location.href = "board_list.jsp"; // 수정 완료 후 목록으로 리다이렉트
    }
</script>
</head>
<body>
    <%
        // 데이터베이스 연결 변수 설정
        String dbURL = "jdbc:mysql://localhost:3306/digital_jsp";
        String dbUser = "digital";
        String dbPassword = "1234";
        Connection conn = null;
        PreparedStatement pstmt = null;

        String boardNumParam = request.getParameter("board_num");
        String boardName = request.getParameter("board_name");
        String boardTitle = request.getParameter("board_title");
        String boardContent = request.getParameter("board_content");

        int boardNum = 0;
        String message = null;

        try {
            if (boardNumParam != null && !boardNumParam.isEmpty()) {
                boardNum = Integer.parseInt(boardNumParam);
            } else {
                throw new IllegalArgumentException("게시물 번호가 제공되지 않았습니다.");
            }

            // 데이터베이스 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // 게시물 수정
            String sql = "UPDATE test_board SET board_name = ?, board_title = ?, board_content = ? WHERE board_num = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardName);
            pstmt.setString(2, boardTitle);
            pstmt.setString(3, boardContent);
            pstmt.setInt(4, boardNum);
            
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                message = "게시물이 성공적으로 수정되었습니다.";
            } else {
                message = "게시물 수정에 실패했습니다. 게시물 번호를 확인해 주세요.";
            }
        } catch (NumberFormatException e) {
            message = "게시물 번호 형식이 잘못되었습니다.";
        } catch (IllegalArgumentException e) {
            message = e.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            message = "게시물 수정 중 오류가 발생했습니다.";
        } finally {
            // 자원 해제
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (message != null) {
    %>
            <script type="text/javascript">
                showAlert("<%= message %>");
            </script>
    <% 
        }
    %>
</body>
</html>
