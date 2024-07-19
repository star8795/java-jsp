<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 완료</title>
</head>
<body>
    <h1>게시글 작성 완료</h1>
    <%
        // 데이터베이스 연결 변수 설정
        String dbURL = "jdbc:mysql://localhost:3306/digital_jsp";
        String dbUser = "digital";
        String dbPassword = "1234";

        // 사용자 입력 데이터 가져오기
        String author = request.getParameter("author");
        String password = request.getParameter("password");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Connection conn = null;
        PreparedStatement pstmt = null;
        String message = "게시글 작성에 실패했습니다.";

        try {
            // 데이터베이스 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL 쿼리문
            String sql = "INSERT INTO test_board (board_name, board_pass, board_title, board_content) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, author);
            pstmt.setString(2, password);
            pstmt.setString(3, title);
            pstmt.setString(4, content);

            // SQL 실행
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                message = "게시글이 성공적으로 작성되었습니다.";
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    <p><%= message %></p>
    <a href='../board/board_list.jsp'/>게시글 목록으로 돌아가기</a>
</body>
</html>
