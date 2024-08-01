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
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/digital_jsp";
    private static final String DB_USER = "digital";
    private static final String DB_PASSWORD = "1234";

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC 드라이버 로드 실패", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 폼 데이터 가져오기
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");

        // 데이터베이스에 연결 및 데이터 조회
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT * FROM tbl_member WHERE id = ? AND pass = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, id);
                stmt.setString(2, pass);

                try (ResultSet rs = stmt.executeQuery()) {
                    response.setContentType("text/html; charset=UTF-8");
                    response.getWriter().print("<html><body>");
                    if (rs.next()) {
                        // 로그인 성공
                        String userId = rs.getString("id");
                        String userName = rs.getString("name");
                        String userAddr = rs.getString("addr");
                        String userPhone = rs.getString("phone");

                        // 콘솔에 로그인된 회원 정보 출력
                        System.out.println("MemberVO {id=" + userId + ", name=" + userName + ", addr=" + userAddr + ", phone=" + userPhone + "}");

                        // 세션에 사용자 정보 저장
                        HttpSession session = request.getSession();
                        session.setAttribute("userId", userId);
                        session.setAttribute("userName", userName);
                        session.setAttribute("userAddr", userAddr);
                        session.setAttribute("userPhone", userPhone);

                        // 사용자에게 성공 메시지 표시 및 리다이렉션
                        response.getWriter().print("<script type='text/javascript'>");
                        response.getWriter().print("alert('로그인 성공');");
                        response.getWriter().print("window.location.href = 'main.jsp';");
                        response.getWriter().print("</script>");
                    } else {
                        // 로그인 실패
                        response.getWriter().print("<script type='text/javascript'>");
                        response.getWriter().print("alert('아이디 또는 비밀번호가 잘못되었습니다.');");
                        response.getWriter().print("window.location.href = 'login.jsp';");
                        response.getWriter().print("</script>");
                    }
                    response.getWriter().print("</body></html>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "서버 오류 발생");
        }
    }
}
