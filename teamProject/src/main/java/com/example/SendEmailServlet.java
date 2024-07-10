package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.RandomStringUtils;

public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String crtfcNo = RandomStringUtils.randomNumeric(6);
		
		String host = "smtp.naver.com";
		String senderEmail = "star8795@naver.com";	// 보내는 이의 메일 주소
		String password = "Kim168017**";	// 보내는 이의 메일 비밀번호
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "host");
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        });
		
		try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("이메일 인증번호");
            message.setText("귀하의 이메일 인증번호는 " + crtfcNo + " 입니다.\n인증번호를 복사하여 입력해주세요.");

            Transport.send(message);
            request.getSession().setAttribute("authCode", crtfcNo);
            response.getWriter().write("success");
        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().write("fail");
        }
	}

}
