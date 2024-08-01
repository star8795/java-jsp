package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JoinServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/digital_jsp";
    private static final String DB_USER = "digital";
    private static final String DB_PASSWORD = "1234";

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC 드라이버 로드 실패", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 한글 인코딩 처리
        request.setCharacterEncoding("UTF-8");

        // 폼 데이터 가져오기
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        String name = request.getParameter("name");
        String addr = request.getParameter("addr");
        String phone = request.getParameter("phone");

        // 데이터베이스에 연결 및 데이터 삽입
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // ID 중복 검사
            String checkIdQuery = "SELECT COUNT(*) FROM tbl_member WHERE id = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkIdQuery)) {
                checkStmt.setString(1, id);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    rs.next();
                    if (rs.getInt(1) > 0) {
                        // ID 중복
                        response.setContentType("text/html; charset=UTF-8");
                        response.getWriter().print("<html><body>");
                        response.getWriter().print("<script type='text/javascript'>");
                        response.getWriter().print("alert('아이디가 이미 존재합니다. 다른 아이디를 입력해 주세요.');");
                        response.getWriter().print("window.location.href = 'join.jsp';");
                        response.getWriter().print("</script>");
                        response.getWriter().print("</body></html>");
                        return;
                    }
                }
            }

            // 데이터 삽입
            String insertQuery = "INSERT INTO tbl_member (id, pass, name, addr, phone) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                insertStmt.setString(1, id);
                insertStmt.setString(2, pass);
                insertStmt.setString(3, name);
                insertStmt.setString(4, addr);
                insertStmt.setString(5, phone);
                insertStmt.executeUpdate();
            }

            // 성공 메시지 표시
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().print("<html><body>");
            response.getWriter().print("<script type='text/javascript'>");
            response.getWriter().print("alert('회원가입이 완료되었습니다.');");
            response.getWriter().print("window.location.href = 'join.jsp';");
            response.getWriter().print("</script>");
            response.getWriter().print("</body></html>");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "서버 오류 발생");
        }
    }
}