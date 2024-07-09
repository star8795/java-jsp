<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String authCode = request.getParameter("authCode");
    String sessionAuthCode = (String) session.getAttribute("authCode");

    if (authCode.equals(sessionAuthCode)) {
        response.getWriter().write("success");
    } else {
        response.getWriter().write("fail");
    }
%>