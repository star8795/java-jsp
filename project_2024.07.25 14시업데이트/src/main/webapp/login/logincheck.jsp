<%@page import="java.util.UUID"%>
<%@page import="Util.JDBCUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;
    
    try {
        conn = JDBCUtil.getConnection();
        String id = request.getParameter("uid");
        String pw = request.getParameter("upw");
        
        String sql = "select * from member where id = ? and pass = ?";
        state = conn.prepareStatement(sql);
        state.setString(1, id);
        state.setString(2, pw);
        
        rs = state.executeQuery();
        if(rs.next()){
            // String uuid = UUID.randomUUID().toString();
            
            // Cookie cookie = new Cookie("cookie",uuid);
            // cookie.setMaxAge(1);
            // cookie.setPath("/");
            // response.addCookie(cookie);
            
            session.setAttribute("id", id); 
            
            out.println("<script> alert('로그인 성공'); location.href = '../main/main.jsp'; </script>");
        } else {
            out.println("<script> alert('로그인 실패'); history.go(-1); </script>");
        }
    } catch (SQLException e) {
        out.println("오류: " + e.getMessage());
    } finally {
      JDBCUtil.close(rs,state,conn);
    }
%>