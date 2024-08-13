package controller;

import java.io.IOException;

import javax.sql.DataSource;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;
import util.DBCPUtil;

public class MemberController extends HttpServlet {

    private static final long serialVersionUID = 7807099506362753862L;
    private MemberService memberService;

    @Override
    public void init() throws ServletException {
        super.init();
        DataSource dataSource = DBCPUtil.getDataSource();
        MemberDAO memberDAO = new MemberDAOImpl(dataSource);
        memberService = new MemberServiceImpl(memberDAO);
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/login.mc":
                showLoginPage(request, response);
                break;
            case "/join.mc":
                showJoinPage(request, response);
                break;
            case "/logout.mc":
                handleLogout(request, response);
                break;
            default:
                request.getRequestDispatcher("/common/main.jsp").forward(request, response);
                break;
        }
    }

    private void showLoginPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/member/login.jsp").forward(request, response);
    }

    private void showJoinPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/member/join.jsp").forward(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("pass");
        String rememberMe = request.getParameter("rememberMe");

        boolean loginSuccess = memberService.memberLogin(request, response);

        if (loginSuccess) {
            response.sendRedirect("welcome.jsp");
        } else {
            request.setAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            request.getRequestDispatcher("/member/login.jsp").forward(request, response);
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        memberService.logOut(request, response); // 로그아웃 처리
        response.sendRedirect("login.mc"); // 로그아웃 후 로그인 페이지로 리디렉션
    }
}
