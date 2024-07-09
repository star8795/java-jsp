package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VerifyEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String authCode = request.getParameter("authCode");
        String sessionAuthCode = (String) request.getSession().getAttribute("authCode");

        if (authCode.equals(sessionAuthCode)) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
	}

}
