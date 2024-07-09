<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*, javax.mail.internet.*, java.util.Properties, org.apache.commons.lang3.RandomStringUtils" %>
<%
    String email = request.getParameter("email");

    String crtfcNo = RandomStringUtils.randomNumeric(6);

    String host = "smtp.naver.com";
    String senderEmail = "your-email@naver.com"; // 발신자 메일 주소
    String password = "your-email-password"; // 발신자 메일 비밀번호

    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.ssl.protocols", "TLSv1.2");

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(senderEmail, password);
        }
    });

    try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(senderEmail));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        message.setSubject("이메일 인증 메일입니다.");
        message.setText("귀하의 이메일 인증번호는 " + crtfcNo + " 입니다.\n인증번호를 복사하여 입력해주세요.");

        Transport.send(message);

        session.setAttribute("authCode", crtfcNo);
        response.getWriter().write("success");
    } catch (MessagingException e) {
        e.printStackTrace();
        response.getWriter().write("fail");
    }
%>
