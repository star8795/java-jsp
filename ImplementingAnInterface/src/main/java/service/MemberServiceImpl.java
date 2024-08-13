package service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.MemberDAO;
import vo.MemberVO;

public class MemberServiceImpl implements MemberService {

    private MemberDAO memberDAO;

    public MemberServiceImpl(MemberDAO memberDAO) {
        this.memberDAO = memberDAO;
    }

    @Override
    public boolean memberJoin(HttpServletRequest request) {
        String id = request.getParameter("id");
        String password = request.getParameter("pass");
        String name = request.getParameter("name");

        MemberVO member = new MemberVO();
        member.setId(id);
        member.setPass(password); // 비밀번호 해싱을 고려
        member.setName(name);

        return memberDAO.memberJoin(member);
    }

    @Override
    public boolean memberLogin(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String password = request.getParameter("pass");
        String rememberMe = request.getParameter("rememberMe");

        MemberVO member = memberDAO.memberLogin(id, password);

        if (member != null) {
            HttpSession session = request.getSession();
            session.setAttribute("member", member);

            if ("on".equals(rememberMe)) {
                Cookie loginCookie = new Cookie("loginCookie", member.getId());
                loginCookie.setPath("/");
                loginCookie.setMaxAge(60 * 60 * 24 * 7); // 7일 동안 유지
                response.addCookie(loginCookie);
            }

            return true;
        }

        return false;
    }

    @Override
    public void logOut(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("loginCookie".equals(cookie.getName())) {
                    cookie.setMaxAge(0); // 쿠키 만료
                    cookie.setPath("/"); // 쿠키 경로 설정
                    response.addCookie(cookie); // 클라이언트에 쿠키 전달
                    break;
                }
            }
        }
    }

    // 자동 로그인 처리 메서드 추가
    public void autoLogin(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("loginCookie".equals(cookie.getName())) {
                    String id = cookie.getValue();
                    MemberVO member = memberDAO.getMemberById(id);
                    if (member != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("member", member);
                    }
                    break;
                }
            }
        }
    }
}
